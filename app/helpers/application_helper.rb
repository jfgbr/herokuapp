module ApplicationHelper
  def page_title(separator = " – ")
    [content_for(:title), 'Sistema'].compact.join(separator)
  end

  def page_heading(title)
    content_tag(:h1, title, :class => "title")
  end
end
