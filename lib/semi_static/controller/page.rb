module SemiStatic::Controller::Page
  def index
    @articles = resource.all
  end

  def show
    unless params[:id].valid_encoding?
      raise ActionController::RoutingError.new("Invalid Encoded URL")
    end
    @article = resource.find(params[:id])
    unless @article
      raise ActionController::RoutingError.new(url_for(:id => params[:id], :only_path => true))
    end
    unless params[:id] == @article.to_param
      redirect_to({id: @article}, status: :moved_permanently)
    end
  end

  private

  def resource
    request.env["semi_static.mapping"]
  end
end
