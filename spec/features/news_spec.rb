# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'news', type: :feature do
  scenario "index" do
    visit news_index_path
    expect(page.find("h1 a").text).to eq("請求書のダウンロードが可能になりました")
    expect(page.find("date").text).to eq("July 26, 2011")
    expect(page.find("p").text).to eq("各請求書のページに「ダウンロード」ボタンを設置し、作成した請求書をPDFファイルとしてダウンロードできるようになりました。")
  end

  scenario 'show markdown page' do
    visit "/news/2011/7/26/#{CGI.escape("請求書のダウンロードが可能になりました")}"
    expect(page.find("h1").text).to eq("請求書のダウンロードが可能になりました")
    expect(page.find("date").text).to eq("July 26, 2011")
    expect(page.find("p").text).to eq("各請求書のページに「ダウンロード」ボタンを設置し、作成した請求書をPDFファイルとしてダウンロードできるようになりました。")
  end

  scenario 'show non-existant page' do
    visit "/news/1999/1/23/foo"
    expect(page.status_code).to eq(404)
  end
end
