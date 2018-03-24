module AdminHelper
  def admin_session
    if admin_user_signed_in?
      link_to 'Logout', destroy_admin_user_session_path, method: :delete
    else
      link_to 'Login', new_admin_user_session_path
    end
  end
end
