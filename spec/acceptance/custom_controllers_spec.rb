# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'custom controllers' do
  scenario "index" do
    visit faqs_path
    find("h1 a").text.should == "チェックイン端末とはなんですか？" 
  end

  scenario "overwritten method" do
    visit faq_path(:id => "管理端末とはなんですか？")
    find("h1").text.should == "チェックイン端末とはなんですか？" 
  end
end
