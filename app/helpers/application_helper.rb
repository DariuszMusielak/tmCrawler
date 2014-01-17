module ApplicationHelper

  def correct_class status
    return "warning" if status == "wyslany"
    return "success" if status == "gotowy"
  end

end
