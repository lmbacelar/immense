class InstrumentPresenter < BasePresenter
  presents :instrument
  delegate :designation, to: :instrument

  def details
    text  = ''
    text << "<strong>man.</strong> #{instrument.manufacturer}  " if instrument.manufacturer.present?
    text << "<strong>mod.</strong> #{instrument.model}  "        if instrument.model.present?
    text << "<strong>s/n</strong> #{instrument.serial_number}  " if instrument.serial_number.present?
    text << "<strong>p/n</strong> #{instrument.part_number}  "   if instrument.part_number.present?
    text.strip.html_safe
  end

  def reference
    h.link_to instrument.reference, instrument
  end

  def edit_link
    h.link_to 'Edit', h.edit_instrument_path(instrument), class: :default
  end

  def destroy_link
    h.link_to 'Destroy', instrument, method: :delete, data: { confirm: 'Are you sure?' }, class: :danger
  end
end
