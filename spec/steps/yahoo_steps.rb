steps_for :yahoo do
  step 'yahooにアクセスします' do
    Capybara.app_host = 'http://www.yahoo.co.jp'
  end

  step 'yahooトップ画面を表示' do
    visit '/'
    page.current_url.should == 'http://www.yahoo.co.jp/'
  end

  step 'ヤフオク!をクリック' do
    within('#yahooservice') { click_on 'ヤフオク!' }
    sleep 2
    page.current_url.should == 'http://auctions.yahoo.co.jp/'
  end

  step 'テキストボックスに:keywordを入力' do |keyword|
    fill_in 'AucSearchTxt', with: keyword
  end

  step '検索する' do
    click_on 'AucSearchSbmt'
    sleep 2
  end
end
