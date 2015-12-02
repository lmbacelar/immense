class Instrument < ActiveRecord::Base
  validates :reference,   presence: true, uniqueness: true
  validates :designation, presence: true
  validates :user,        presence: true

  belongs_to :user

  extend FriendlyId
  friendly_id :reference, use: :slugged

  include PgSearch
  pg_search_scope :full_text_search,
                     against: [ :reference, :designation, :manufacturer, :model, :serial_number ],
                     using: { tsearch: { dictionary: 'english', prefix: true } }
  def self.search query
    if query.present?
      full_text_search query
    else
      order 'created_at DESC'
    end
  end

  def user_email
    user.email
  end

  def user_email= email
    self.user = User.find_by email: email
  end

  IMPORT_ATTRS = %w{reference designation manufacturer model part_number serial_number remarks user_email}
  def self.import file
    sheet = open_sheet file
    header = sheet.row 1
    (2..sheet.last_row).each do |i|
      row = Hash[[header, sheet.row(i)].transpose]
      attrs = Hash[row.to_hash.slice(*IMPORT_ATTRS).map{ |k,v| [ k, v || '' ] }]
      instr = find_by(reference: row['reference']) || new
      instr.update_attributes attrs
      instr.save!
    end
  end

  def self.open_sheet file
    case File.extname file.to_path
      when '.csv'  then Roo::CSV.new    file.to_path, file_warnings: :ignore
      when '.xlsx' then Roo::Excelx.new file.to_path, file_warnings: :ignore
      else raise "Unknown file type: #{file.to_path}"
    end
  end
end
