RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    # Capybara::Lockstep.debug = true
    driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400] do |options|
      # Make browser logs available to Capybara
      options.add_option('goog:loggingPrefs', { browser: 'ALL' })

      # Disable most animations. In practice, this shortens CSS animation durations to a fraction of a second.
      options.add_argument('--force-prefers-reduced-motion')


      # options.logging_prefs = { browser: 'ALL' }
      options.add_preference(:download, prompt_for_download: false, default_directory: DownloadsHelper::PATH.to_s)
      options.add_preference(:browser, set_download_behavior: { behavior: 'allow' })
    end
  end

  config.after(:each, type: :system, js: true) do |example|
    logs = page.driver.browser.logs.get(:browser)
    error_logs = logs.select do |log|
      log.level == 'SEVERE' &&
        log.message.exclude?('500 (Internal Server Error)') &&
        log.message.exclude?('403 (Forbidden)')
    end

    if (failed? && logs.present?) || error_logs.present?
      file_safe_example_name = example.rerun_argument.gsub(/[^\w\d\-]/, '_')
      filename = "failures#{file_safe_example_name}.log"
      folder = Rails.root.join('tmp/browser_logs')

      FileUtils.mkdir_p(folder)

      file_path = folder.join(filename)
      file_path.write(logs.join("\n"))

      # RSpec will append this line to the failure message
      example.metadata[:extra_failure_lines] << "[Browser Logs]: #{file_path}"
    end

    if !failed? && error_logs.present?
      raise 'JavaScript Error(s) during test execution'
    end
  end

  config.before(:each, type: :system, chrome: true) do
    driven_by :selenium, using: :chrome, screen_size: [1400, 1400] do |options|
      options.add_preference(:download,
                             prompt_for_download: false,
                             default_directory: DownloadsHelper::PATH.to_s)
      options.add_preference(:browser, set_download_behavior: { behavior: 'allow' })
    end
  end
end

# hide the annoying "Capybara starting Puma..." STDOUT message
Capybara.server = :puma, { Silent: true }
Selenium::WebDriver.logger.ignore :capabilities
# Capybara::Lockstep.wait_tasks = 36 # ensure stimulus tasks are complete before asserting; value determined through trial and error
