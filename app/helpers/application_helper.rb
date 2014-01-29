module ApplicationHelper
  def full_title(page_title)
    base_title = t('views.app_name')
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def hidden_div_if(condition, attributes = {}, &block)
     if condition
       attributes["style"] = "display: none"
     end
     content_tag("div", attributes, &block)
  end

  def current_item_if(condition, attributes = {}, &block)
     if condition
       attributes["id"] = "current_item"
     end
     content_tag("tr", attributes, &block)
  end
end
