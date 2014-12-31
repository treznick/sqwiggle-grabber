require 'sqwiggle_grabber/user_grabber.rb'
require 'sqwiggle_grabber/file_downloader.rb'
require 'yaml'

grabber = UserGrabber.new(YAML.load_file('token.yml').api_token)

loop do
  puts "Command | Action"
  puts "--------|-------"
  puts "   L    | List all users"
  puts "   Q    | Quit "
  input = gets.chomp
  case input
  when /\AL\z/i
    puts "Select user to grab"
    grabber.pretty_print_users
    user_index = gets.chomp
    FileDownloader.new(grabber.get_indexed_user(user_index)).save_image
  when /\AQ\z/i
    exit(0)
  end

end
