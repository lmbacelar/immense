class InstrumentPresenter < BasePresenter
  presents :instrument
  delegate :designation, to: :instrument

  def details
    text  = ''
    text << "<strong>man.</strong> #{instrument.brand_name} "     if instrument.brand_name.present?
    text << "<strong>mod.</strong> #{instrument.modl_name}  "     if instrument.modl_name.present?
    text << "<strong>s/n</strong> #{instrument.serial_number}  "  if instrument.serial_number.present?
    text << "<strong>p/n</strong> #{instrument.part_number}  "    if instrument.part_number.present?
    text << "<strong>dep.</strong> #{instrument.department_name}" if instrument.department_name.present?
    text.strip.html_safe
  end

  def reference
    if h.policy(instrument).show?
      h.link_to instrument.reference, instrument
    else
      instrument.reference
    end
  end

  def edit_link
    if h.policy(instrument).edit?
      h.link_to 'Edit', h.edit_instrument_path(instrument), class: :default
    end
  end

  def destroy_link
    if h.policy(instrument).destroy?
      h.link_to 'Destroy', instrument, method: :delete,
                                       data: { confirm: 'Are you sure?' },
                                       class: :danger
    end
  end
end
