class Instrument < ActiveRecord::Base

  EXPORT_ATTRS = %w{reference designation manufacturer model part_number serial_number remarks user_email}
  
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

  def self.import file
    CSV.foreach file.path, headers: true do |row|
      instrument = find_by_reference(row['reference']) || new
      instrument.attributes = row.to_hash.slice(*Instrument::EXPORT_ATTRS)
      instrument.save!
    end
  end
end
