# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'page', type: :feature do
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

  scenario 'show multibyte bang' do
    visit "/event_planning_tips/#{CGI.escape("イベントやろう")}"
    current_path.should == "/event_planning_tips/#{CGI.escape("イベントやろう")}"
    page.find("h1").text.should == "イベントやろう！"
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

  scenario 'slug is not validly encoded' do
    visit "/event_planning_tips/%8e%8f"
    page.status_code.should == 400
  end

  scenario 'redirect in case of double escape' do
    visit "/event_planning_tips/#{CGI.escape(CGI.escape("イベントやろう"))}"
    current_path.should == "/event_planning_tips/#{CGI.escape("イベントやろう")}"
    page.find("h1").text.should == "イベントやろう！"
  end
end
