# encoding: UTF-8
class Admin::FaqsController < SemiStatic::PageController
  def index
    render :text => "Namespaced"
  end
end
