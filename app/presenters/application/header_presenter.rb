class Application::HeaderPresenter < Curly::Presenter
  def logo
    image_tag "something.png"
  end

  def login
    if user_signed_in?
      "Welcome, #{current_user.name}"
    else
      link_to(
        image_tag("sign_in.png"),
        user_omniauth_authorize_path(:steam)
      ).html_safe
    end
  end
end
