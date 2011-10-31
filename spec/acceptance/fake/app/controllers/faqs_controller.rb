# encoding: UTF-8
class FaqsController < SemiStatic::PageController
  def show
    case params[:id]
    when "管理端末とはなんですか？"
      redirect_to :id => "チェックイン端末とはなんですか？", :status => 301
    else
      super
    end
  end

end
