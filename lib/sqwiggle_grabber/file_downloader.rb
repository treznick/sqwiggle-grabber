require 'open-uri'
class FileDownloader
  def initialize(user)
    @url = user.snapshot
    @name = user.name
  end

  def save_image
    filename = "#{@name}-#{Time.now.strftime('%Y%m%d%H%M%S')}.jpeg"

    open(filename) do |file|
      file << open(@url).read
    end

    puts "#{@name}'s visage saved to #{filename}"
  end
end
