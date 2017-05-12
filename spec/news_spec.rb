# encoding: UTF-8
require 'spec_helper'

describe SemiStatic::News do
  before do
    @page = described_class.new("body", :title => "ほげ", :published_at => Date.parse("2001-01-31"))
    SemiStatic.backend = double(:all => [ @page ])
  end

  it { @page.to_param.should == "2001/1/31/ほげ" }
  it { News.find("2001/1/31/ほげ").should == @page }
end
