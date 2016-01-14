class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true

  validates :addressable, presence: true
  after_validation :geocode

  geocoded_by :to_s

  def to_s
    text = ''
    text << "#{line1}\n"       if line1.present?
    text << "#{line2}\n"       if line2.present?
    text << "#{zip} #{city}\n" if city.present?
    text << "#{state}\n"       if state.present?
    text << "#{country}"       if country.present?
  end
end
