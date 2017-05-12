# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'news', type: :feature do
  scenario "index" do
    visit news_index_path
    page.find("h1 a").text.should == "請求書のダウンロードが可能になりました"
    page.find("date").text.should == "July 26, 2011"
    page.find("p").text.should == "各請求書のページに「ダウンロード」ボタンを設置し、作成した請求書をPDFファイルとしてダウンロードできるようになりました。"
  end

  scenario 'show markdown page' do
    visit "/news/2011/7/26/#{CGI.escape("請求書のダウンロードが可能になりました")}"
    page.find("h1").text.should == "請求書のダウンロードが可能になりました"
    page.find("date").text.should == "July 26, 2011"
    page.find("p").text.should == "各請求書のページに「ダウンロード」ボタンを設置し、作成した請求書をPDFファイルとしてダウンロードできるようになりました。"
  end

  scenario 'show non-existant page' do
    visit "/news/1999/1/23/foo"
    page.status_code.should == 404
  end
end
