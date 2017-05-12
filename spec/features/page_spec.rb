# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'page', type: :feature do
  scenario "index" do
    visit '/event_planning_tips'
    expect(page).to have_css("h1 a")
    expect(page).to have_content("イベント時に気をつけたいマナー")
  end

  scenario 'show markdown page' do
    visit "/event_planning_tips/#{CGI.escape("イベント時に気をつけたいマナー")}"
    expect(page.find("h1").text).to eq("イベント時に気をつけたいマナー")
    expect(page.find("section h2").text).to eq("1. 無断に写真や動画の撮影、公開しない")
  end

  scenario 'show multibyte bang' do
    visit "/event_planning_tips/#{CGI.escape("イベントやろう")}"
    expect(current_path).to eq("/event_planning_tips/#{CGI.escape("イベントやろう")}")
    expect(page.find("h1").text).to eq("イベントやろう！")
  end

  scenario 'show erb page' do
    visit "/event_planning_tips/erb-test"
    expect(page.find(".erb").text).to eq("1 + 1 = 2")
  end

  scenario 'show erb chained' do
    visit "/event_planning_tips/erb-chained"
    expect(page.find("h2").text).to eq("1 + 1 = 2")
    expect(page).to have_css "img"
  end

  scenario 'non standard slug' do
    visit "/event_planning_tips/non-standard-slug"
    expect(page.find("h1").text).to eq("Title is different than slug")
  end

  scenario 'slug is not validly encoded' do
    visit "/event_planning_tips/%8e%8f"
    expect(page.status_code).to eq(400)
  end

  scenario 'redirect in case of double escape' do
    visit "/event_planning_tips/#{CGI.escape(CGI.escape("イベントやろう"))}"
    expect(current_path).to eq("/event_planning_tips/#{CGI.escape("イベントやろう")}")
    expect(page.find("h1").text).to eq("イベントやろう！")
  end
end
