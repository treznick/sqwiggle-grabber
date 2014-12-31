require 'sqwiggle-ruby'
class UserGrabber
  def initialize(token)
    @client = Sqwiggle.client(token)
    get_users
  end


  def pretty_print_users
    @users.each_with_index { |user, index|
      puts "ID: #{index}, NAME #{user.name}"
    }
  end

  def get_indexed_user(index)
    @users[index]
  end

  private

  def get_users
    @users ||= client.users.all
  end
end
