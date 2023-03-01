module ApplicationHelper

  def owner?(object)
    current_user == object.creator
  end

  def registered?(object)
    current_user && object.creator != current_user && !object.attendees.include?(current_user)
  end

  def not_registered?(object)
    current_user && object.creator != current_user && object.attendees.include?(current_user)
  end

  def is_user?
    current_user == @user
  end

  def admin?
    current_user && current_user.admin? == true
  end

  def bootstrap_class_for_flash(type)
    case type
      when 'notice' then "alert-info"
      when 'success' then "alert-success"
      when 'error' then "alert-danger"
      when 'alert' then "alert-warning"
    end
  end

end