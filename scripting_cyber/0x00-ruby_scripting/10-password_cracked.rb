require 'digest'

if ARGV.length != 2
  puts "Usage: 10-password_cracked.rb HASHED_PASSWORD DICTIONARY_FILE"
  exit
end

hashed_password = ARGV[0].downcase
dictionary_file = ARGV[1]

unless File.exist?(dictionary_file)
  exit
end

password_found = nil

File.foreach(dictionary_file) do |line|
  word = line.strip
  word_hash = Digest::SHA256.hexdigest(word)

  if word_hash == hashed_password
    password_found = word
    break
  end
end

if password_found
  puts "Password found: #{password_found}"
else
  puts "Password not found in dictionary."
end
