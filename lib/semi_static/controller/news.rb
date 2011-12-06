module SemiStatic::Controller::News
  def self.included(klass)
    klass.send :include, SemiStatic::Controller::Page
  end

  def index
    super
    respond_to do |f|
      f.html 
      f.atom { render :layout => false }
    end
  end
end
