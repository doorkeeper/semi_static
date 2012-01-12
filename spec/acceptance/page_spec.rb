# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'page' do
  scenario "index" do
    visit '/event_planning_tips'
    page.should have_css("h1 a")
    page.should have_content("イベント時に気をつけたいマナー")
  end

  scenario 'show markdown page' do
    visit "/event_planning_tips/#{CGI.escape("イベント時に気をつけたいマナー")}"
    page.find("h1").text.should == "イベント時に気をつけたいマナー"
    page.find("section h2").text.should == "1. 無断に写真や動画の撮影、公開しない"
  end

  scenario 'show erb page' do
    visit "/event_planning_tips/erb-test"
    page.find(".erb").text.should == "1 + 1 = 2"
  end

  scenario 'show erb chained' do
    visit "/event_planning_tips/erb-chained"
    page.find("h2").text.should == "1 + 1 = 2"
    page.should have_css "img"
  end

  scenario 'non standard slug' do
    visit "/event_planning_tips/non-standard-slug"
    page.find("h1").text.should == "Title is different than slug"
  end
end
