module ApplicationHelper
  def flash_class(level)
    case level
        when 'notice' then "alert alert-info"
        when 'success' then "alert alert-success"
        when 'error' then "alert alert-error"
        when 'alert' then "alert alert-error"
    end
  end


  def is_user_follow(user_id)
    current_user.follows.where(following_id: user_id).where(following_type: 'User').blank?
  end

  def is_topic_follow(user_id)
    current_user.follows.where(following_id: user_id).where(following_type: 'Topic').blank?
  end

end
