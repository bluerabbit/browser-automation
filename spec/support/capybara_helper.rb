module CapybaraHelper
  def save_screenshot_and_open_page
    tmp_dir = './tmp/capybara'
    FileUtils.mkdir_p(tmp_dir) unless File.exists?(tmp_dir)
    file_path = "#{tmp_dir}/#{Time.now.strftime('%Y-%m-%d %H.%M.%S')}-screenshot.png"
    save_screenshot(file_path, :full => true)

    require 'launchy'
    Launchy.open file_path
  end
end
