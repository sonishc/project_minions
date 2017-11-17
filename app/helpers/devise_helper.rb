module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:ol, msg) }.join
    html = <<-HTML
      #{messages}
    HTML

    html.html_safe
  end
end