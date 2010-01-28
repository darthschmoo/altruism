# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title( str )
    content_tag :h1, str
  end

  def r( str, restrictions = [] )
    RedCloth.new(str, restrictions).to_html
  end
end
