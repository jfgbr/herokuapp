# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Herokuapp::Application.initialize!

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|

  #unless html_tag =~ /^<label/
  #  %{<span class="field_with_errors">#{html_tag}<label for="#{instance.send(:tag_id)}" class="message">#{instance.error_message.first}</label></span>}.html_safe
  #else
  #  %{<span class="field_with_errors">#{html_tag}</span>}.html_safe
  #end
  html = Nokogiri::HTML::DocumentFragment.parse(html_tag)
  html = html.at_css("input") || html.at_css("select")
  unless html.nil?
    css_class = html['class'] || ""
    required = css_class.include? "required" 
    #style = html['style']
    #style =~ /^(display)+(.)+(none)$/
    if required #&& !style
      html['class'] = css_class.split.push("field_with_errors").join(' ')
      html['data-error'] = instance.error_message.join(". ")
      html_tag = %{#{html}<div class="alert alert-danger alert-dismissable"><button type="button" class="close data" data-dismiss="alert" aria-hidden="true">&times;</button>#{html['data-error']}</div>}.to_s.html_safe
    end
    
  end
  
  html_tag  
  
end