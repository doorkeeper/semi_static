# encoding: UTF-8
require 'spec_helper'

describe SemiStatic::Page do
  before do
    @japanese_page = described_class.new("body", :title => "ほげ")
    @english_page = described_class.new("body", :title => "foo bar") 
    SemiStatic.backend = double(:all => [ @japanese_page, @english_page ])
  end

  it { expect(@japanese_page.to_param).to eq("ほげ") }
  it { expect(@japanese_page.to_s).to eq("ほげ") }
  it { expect(@english_page.to_param).to eq("foo-bar") }
  it { expect(@english_page.to_s).to eq("foo bar") }
  it { expect(described_class.new(nil, {}).to_s).to eq("") }
  it { expect(SemiStatic::Page.find("foo-bar")).to eq(@english_page) }
  it { expect(SemiStatic::Page.find("ほげ")).to eq(@japanese_page) }
  it { expect(SemiStatic::Page.find(CGI.escape("ほげ"))).to eq(@japanese_page) }
end
