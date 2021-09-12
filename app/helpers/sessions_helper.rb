module SessionsHelper
  def flash_message(type)
    if flash[type]
      content_tag :p, flash[type], class:'flash errors'
    end
  end
end