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

end
