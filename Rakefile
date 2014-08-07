require "bundler/gem_tasks"

require 'rake'

# require 'rspec/core/rake_task'
#
# RSpec::Core::RakeTask.new(:spec)
#
# task :default => :spec

def download_logs
  `mkdir -p tmp`
  `heroku logs -n 100000 > tmp/logs.txt`
end

def show_report
  require "oui"

  logs = File.read('tmp/logs.txt')

  mac_addresses = []

  logs.each_line do |line|
    if line =~ /(#{OUI::MACAddress.mac_regex_string})/
      puts $1
      mac_addresses << $1
    end
  end

  mac_addresses.uniq!

  File.open("records.txt", "a") do |file|
    mac_addresses.each do |mac|
      org = OUI::MACAddress.parse(mac).organization
      if org.chinese_name.nil? || org.chinese_name.length > 9
        if org.name
          p org
          file.puts org.inspect
        end
      end
    end
  end
end

def show_feeds
  logs = File.read('tmp/logs.txt')

  logs.each_line do |line|
    if line =~ /path="\/feed/
      puts line
    end
  end
end

task :report_local do
  show_report
end

task :report do
  download_logs
  show_report
end

task :feeds do
  show_feeds
end

task :download_logs do
  download_logs
end
