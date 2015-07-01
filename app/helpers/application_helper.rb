module ApplicationHelper
  # Returns the full title on a per-page basis.
  # If a page_title is supplied as an argument in calls to this function,
  #   it is appended to the base_title
  def full_title(page_title = '')
    base_title = "Hacker Academy"
    if page_title.empty?
      base_title
    else
      base_title + " | " + page_title
    end
  end
end
