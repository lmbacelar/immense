module ApplicationHelper
  def present object, klass = nil
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new object, self
    yield presenter if block_given?
    presenter
  end


  def paginate collection_or_options = nil, options = {}
    if collection_or_options.is_a? Hash
      options, collection_or_options = collection_or_options, nil
    end
    unless options[:renderer]
      options = options.merge renderer: BootstrapPagination::Rails
    end
    will_paginate *[collection_or_options, options].compact
  end
end
