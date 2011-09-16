# encoding: UTF-8
require 'spec_helper'

class News < SemiStatic::News
end

describe SemiStatic::Backend do
  before do
    root = File.join(File.dirname(__FILE__), 'semi_static_pages')
    @backend = described_class.new(root)
  end

  context "all" do
    before { @all = @backend.all(News) }
    it { @all.size.should == 1 }

    context "item" do
      before { @item = @all.first }
      it { @item.title.should == "請求書のダウンロードが可能になりました" }
      it { @item.published_at.should == Date.parse("2011-07-26") }
      it { @item.body.should be_instance_of Tilt::RDiscountTemplate }
    end
  end
end
