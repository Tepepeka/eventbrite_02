module ApplicationHelper

    def owner?(object)
        current_user == object.creator
    end

end
