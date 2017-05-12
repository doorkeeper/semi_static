# encoding: UTF-8
class FaqsController < SemiStatic::PageController
  def show
    case params[:id]
    when "管理端末とはなんですか？"
      article = resource.all.find {|a| a.title == "チェックイン端末とはなんですか？" }
      redirect_to :id => article.to_param, :status => 301
    else
      super
    end
  end

end
