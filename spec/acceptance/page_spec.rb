# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'page' do
  scenario "index" do
    visit '/event_planning_tips'
    page.find("h1 a").text.should == "イベント時に気をつけたいマナー"
    page.find("section h2").text.should == "1. 無断に写真や動画の撮影、公開しない"
  end

  scenario 'show markdown page' do
    visit "/event_planning_tips/#{CGI.escape("イベント時に気をつけたいマナー")}"
    page.find("h1").text.should == "イベント時に気をつけたいマナー"
    page.find("section h2").text.should == "1. 無断に写真や動画の撮影、公開しない"
  end

end
