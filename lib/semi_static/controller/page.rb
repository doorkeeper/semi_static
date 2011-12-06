module SemiStatic::Controller::Page
  def index
    @articles = resource.all
  end

  def show
    @article = resource.find(params[:id])
    raise ActionController::RoutingError.new(url_for(:id => params[:id], :only_path => true)) unless @article
  end

  private

  def resource
    env["semi_static.mapping"]
  end
end
