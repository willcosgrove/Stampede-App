# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end
  def phone_for_view(n)
    return "(#{n[0..2]}) #{n[3..5]}-#{n[6..9]}"
  end
end
