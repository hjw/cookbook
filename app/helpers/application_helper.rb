module ApplicationHelper

  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "VMC Cookbook").join(" ")
      end
    end
  end
end
