class Application::HeaderPresenter < Curly::Presenter
  def logo
    image_tag "something.png"
  end

  def login
    if user_signed_in?
      "Welcome, #{current_user.name}!"

    else
      link_to(
        image_tag("sign_in.png"),
        user_omniauth_authorize_path(:steam)
      ).html_safe
    end
  end

  def avatar_image
    if user_signed_in?
      image_tag current_user.avatar
    else
      ""
    end
  end

  def admin_link
    if user_signed_in? && current_user.forem_admin
      link_to forem.admin_root_path do
        content_tag :li, "Admin"
      end
    end
  end
end
