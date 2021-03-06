module ApplicationHelper

  def full_title(page_title)
    base_title = "NBAProject"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def indented_render(num, *args)
  	render(*args).gsub(/^/, "\t" * num)
	end
	
end