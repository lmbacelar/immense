class Instrument < ActiveRecord::Base
  validates :reference,   presence: true, uniqueness: true
  validates :designation, presence: true
  validates :user,        presence: true

  belongs_to :user

  extend FriendlyId
  friendly_id :reference, use: :slugged

  include PgSearch
  pg_search_scope :full_text_search,
                     against: [ :reference, 
                                :designation, 
                                :manufacturer, 
                                :model, 
                                :serial_number ], 
                     using: { tsearch: {
                                 dictionary: 'english',
                                 prefix: true } }
  def self.search query
    if query.present?
      full_text_search query
    else
      order 'created_at DESC'
    end
  end

  def self.to_csv columns: %w{reference designation manufacturer model serial_number part_number remarks}
    CSV.generate do |csv|
      csv << columns
      all.each do |instrument|
        csv << instrument.attributes.values_at(*columns)
      end
    end
  end
end
