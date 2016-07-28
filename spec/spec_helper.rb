ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }


RSpec.configure do |config|
  config.after(:each) do
    Conversation.all().each() do |conversation|
      conversation.destroy()
    end
    Message.all().each() do |message|
      message.destroy()
    end
    User.all().each() do |user|
      user.destroy()
    end
  end
end
