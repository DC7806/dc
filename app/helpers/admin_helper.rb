module AdminHelper

  def admin_name
    current_admin_user.name if admin_user_signed_in?
  end
  
  def admin_session
    if admin_user_signed_in?
      link_to 'Logout', destroy_admin_user_session_path, method: :delete
    else
      link_to 'Login', new_admin_user_session_path
    end
  end

  def admin_index_image instance
    case instance.class.name
    when 'Admin::Article'
      image_tag instance.image.src.url(:thumb_200), class: 'wt-100' if instance.image.src.present?
    when 'Admin::Metum'
      image_tag instance.og_image.url(:thumb_200), class: 'wt-100' if instance.og_image.present?
    end
  end

end