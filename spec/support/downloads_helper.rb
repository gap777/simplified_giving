module DownloadsHelper
  TIMEOUT = 10
  PATH = "#{Dir.pwd}/tmp/downloads".freeze

  def downloads
    Dir["#{PATH}/*"]
  end

  def download(filename)
    downloads.grep(/^#{Regexp.escape(PATH)}\/#{filename}$/).first
  end

  def download_content(filename)
    wait_for_download(filename)
    downloaded_file = download(filename)
    raise "File #{filename} not found" if downloaded_file.blank?

    File.read(downloaded_file)
  end

  def wait_for_download(filename)
    Timeout.timeout(TIMEOUT) do
      sleep 0.1 until downloaded?(filename)
    end
  end

  def downloaded?(filename)
    !downloading?(filename) && download(filename).present?
  end

  def downloading?(filename)
    filename_pattern = /^#{Regexp.escape(PATH)}\/#{filename}\.crdownload$/
    downloads.grep(filename_pattern).any?
  end

  def clear_downloads
    FileUtils.rm_f(downloads)
  end
end
