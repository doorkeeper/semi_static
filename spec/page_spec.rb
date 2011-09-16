# encoding: UTF-8
require 'spec_helper'

describe SemiStatic::Page do
  before do
    @japanese_page = described_class.new("body", :title => "ほげ")
    @english_page = described_class.new("body", :title => "foo bar") 
    SemiStatic.backend = mock(:all => [ @japanese_page, @english_page ])
  end

  it { @japanese_page.to_param.should == "ほげ" }
  it { @japanese_page.to_s.should == "ほげ" }
  it { @english_page.to_param.should == "foo-bar" }
  it { @english_page.to_s.should == "foo bar" }
  it { described_class.new(nil, {}).to_s.should == "" }
  it { SemiStatic::Page.find("foo-bar").should == @english_page }
end
