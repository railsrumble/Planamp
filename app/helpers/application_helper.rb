module ApplicationHelper
  def page_title( page_title )
    content_for(:title) { page_title }
  end

  def body_class( klass )
    content_for(:body_class) { klass}
  end
end
