module ApplicationHelper
  def icon(*icon_classes)
    class_attr = icon_classes.map { |icon_class| "fa-#{icon_class.to_s.gsub('_', '-')}" }.join(' ')
    content_tag(:i, nil, class: "fa #{class_attr}")
  end

  def action_buttons(object)
    content_tag :div, class: 'pull-right btn-group' do
      [link_to(icon(:edit, :fw), url_for(controller: object.class.name.tableize, id: object, action: :edit),
               class: 'btn btn-default'),
       link_to(icon(:trash_o, :fw), url_for(controller: object.class.name.tableize, id: object, action: :destroy),
               class: 'btn btn-default', method: :delete, data: {confirm: 'Are you sure?'})
      ].join.html_safe
    end
  end
end
