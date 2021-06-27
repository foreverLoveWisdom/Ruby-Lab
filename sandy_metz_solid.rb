# frozen_string_literal: true

# What does this class do?
class PatentJob
  attr_reader :downloader

  def initialize(downloader = PatentDownloader.new)
    @downloader = downloader
  end

  def run
    downloader.download_file
  end

  def parse(temp)
    FasterCSV.read(temp, headers: true)
  end

  def update_patents(rows)
    Patent.connection.transaction do
      Patent.delete_all

      rows.each { |r| Patent.create!(r.to_hash) }
    end
  end
end

# Download file
class PatentDownloader
  def download_file
    temp     = TempFile.new('patents')
    tempname = temp.path
    temp.close

    Net::FTP.open('localhost', 'foo', 'foopw') do |ftp|
      ftp.getbinaryfile('Public/prod/patents.csv', tempname)
    end

    tempname
  end
end

# Configuration
class PatentConfig
  attr_reader :env

  def initialize(env = Rails.env)
    @env = env
  end

  def ftp_host
    'localhost'
  end

  def ftp_path
    'Public/' + (env == 'production' ? 'prod' : 'test')
  end
end
