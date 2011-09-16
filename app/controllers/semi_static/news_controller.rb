class SemiStatic::NewsController < SemiStatic::PageController
  def index
    super
    respond_to do |f|
      f.html 
      f.atom { render :layout => false }
    end
  end
end
