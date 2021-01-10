steps_for :yahoo do
  step 'yahooにアクセスします' do
    Capybara.app_host = 'https://www.yahoo.co.jp'
  end

  step 'yahooトップ画面を表示' do
    visit '/'

    expect(current_url).to eq('https://www.yahoo.co.jp/')
  end

  step 'テキストボックスに:keywordを入力' do |keyword|
    fill_in 'p', with: keyword
  end

  step '検索する' do
    click_on '検索'
    sleep 2
  end
end
