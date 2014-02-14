module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Sistema"
    if page_title.empty?
    base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def page_heading(title)
    content_tag(:h1, title, :class => "title")
  end

  def is_active?(link_path)
    if current_page?(link_path)
      "active"
    else
      ""
    end
  end

  def respond_empty
    respond_to do |format|
      format.json { render :json => nil }
    end
  end
end
