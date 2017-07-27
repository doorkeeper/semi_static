# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'custom controllers', type: :feature do
  scenario "index" do
    visit faqs_path
    expect(find("h1 a").text).to eq("チェックイン端末とはなんですか？")
  end

  scenario "overwritten method" do
    visit faq_path(:id => "管理端末とはなんですか？")
    expect(find("h1").text).to eq("チェックイン端末とはなんですか？")
  end

  scenario "partial match redirects" do
    visit faq_path("チェックイン端末")
    expect(page.current_path).to eq(faq_path("チェックイン端末とはなんですか"))
    expect(find("h1").text).to eq("チェックイン端末とはなんですか？")
  end

  scenario "namespaced controller" do
    visit admin_faqs_path
    expect(find("body").text).to eq("Namespaced")
  end

  scenario "namespaced controller redirects" do
    visit admin_faq_path("チェックイン端末")
    expect(page.current_path).to eq(admin_faq_path("チェックイン端末とはなんですか"))
    expect(find("h1").text).to eq("チェックイン端末とはなんですか？")
  end
end
