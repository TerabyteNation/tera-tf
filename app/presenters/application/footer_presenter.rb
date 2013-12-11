class Application::FooterPresenter < Curly::Presenter
  def logo

  end

  def admin_panel
    if current_user.forem_admin
      link_to("Admin panel", forem.admin_root_path) + "."
    end
  end
end
