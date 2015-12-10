class Instrument < ActiveRecord::Base

  belongs_to :user

  validates :reference,   presence: true, uniqueness: true
  validates :designation, presence: true
  validates :user,        presence: true

  include Serializable
  io_attributes :reference,:designation, :manufacturer, :model, :part_number, :serial_number, :remarks, :user_email

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
end
