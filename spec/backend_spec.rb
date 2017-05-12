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
    it { expect(@all.size).to eq(1) }

    context "item" do
      before { @item = @all.first }
      it { expect(@item.title).to eq("請求書のダウンロードが可能になりました") }
      it { expect(@item.published_at).to eq(Date.parse("2011-07-26")) }
      context "body" do
        subject { @item.body.render(self) }
        it { is_expected.to include("<br>") } 
      end
    end
  end
end
