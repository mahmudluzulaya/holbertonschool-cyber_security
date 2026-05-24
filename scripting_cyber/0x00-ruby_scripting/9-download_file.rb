re 'open-uri'
require 'uri'
require 'fileutils'

if ARGV.length != 2
    puts "Usage: 9-download_file.rb URL LOCAL_FILE_PATH"
      exit
end

url = ARGV[0]
local_path = ARGV[1]

puts "Downloading file from #{url}..."

begin
    URI.open(url) do |remote_file|
          dirname = File.dirname(local_path)
              FileUtils.mkdir_p(dirname) unless Dir.exist?(dirname)

                  File.open(local_path, 'wb') do |local_file|
                          local_file.write(remote_file.read)
                              end
                    end
      puts "File downloaded and saved to #{local_path}."
rescue => e
    puts "Error: #{e.message}"
end
