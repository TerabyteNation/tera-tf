class Application::HeaderPresenter < Curly::Presenter
  def logo
    image_tag "something.png"
  end

  def login
    link_to(image_tag("sign_in.png"), "/login").html_safe
  end
end
