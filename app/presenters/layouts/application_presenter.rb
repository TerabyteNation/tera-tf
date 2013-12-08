class Layouts::ApplicationPresenter < Curly::Presenter

  def title
    content_for(:title) || "Tera.TF"
  end

  def javascripts
    javascript_include_tag "application"
  end

  def stylesheets
    stylesheet_link_tag "application", media: "all"
  end

  def body
    yield
  end

  def header
    render "header"
  end

  def footer
    render "footer"
  end

  def csrf
    csrf_meta_tags
  end
end
