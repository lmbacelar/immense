class CompanyPresenter < BasePresenter
  presents :company

  def name
    if h.policy(company).show?
      h.link_to company.name, company
    else
      company.name
    end
  end

  def details
    text  = ''
    text << "<strong>vat:</strong> #{company.vat_prefix} #{company.vat_number}  "
    text << "<strong>short:</strong> #{company.short_name}"
    text.strip.html_safe
  end

  def edit_link
    if h.policy(company).edit?
      h.link_to 'Edit', h.edit_company_path(company), class: :default
    end
  end

  def destroy_link
    if h.policy(company).destroy?
      h.link_to 'Destroy', company, method: :delete,
                                    data: { confirm: 'Are you sure?' },
                                    class: :danger
    end
  end
end
