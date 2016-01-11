class DepartmentPresenter < BasePresenter
  presents :department
  delegate :designation, to: :department

  def details
    "<strong>co.</strong> #{department.company}".html_safe
  end

  def name
    if h.policy(department).show?
      h.link_to department.name, department
    else
      department.name
    end
  end

  def edit_link
    if h.policy(department).edit?
      h.link_to 'Edit', h.edit_department_path(department), class: :default
    end
  end

  def destroy_link
    if h.policy(department).destroy?
      h.link_to 'Destroy', department, method: :delete,
                                       data: { confirm: 'Are you sure?' },
                                       class: :danger
    end
  end
end
