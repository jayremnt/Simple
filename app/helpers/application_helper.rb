module ApplicationHelper
  def full_title(page_title = "")
    base_title = t 'app.title'
    if page_title.empty?
      base_title
    else
      t(page_title.downcase + '.index.title') + " | " + base_title
    end
  end
end
