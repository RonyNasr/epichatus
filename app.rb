require("bundler/setup")
require 'rack-flash'
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
include BCrypt

use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :expire_after => 3600, # Signs out after 1 hour of inactivity
                           :secret => 'secrets_are_no_fun'
use Rack::Flash

helpers do
  def faye_path
    "#{request.scheme}://#{request.host}:9292/faye"
  end

  def faye_js_path
    faye_path + ".js"
  end
end

get('/') do
  @users = User.all()
  erb(:index)
end

get '/user' do
  if User.find_by_id(session[:id])
    @user = User.find(session[:id])
    @users = User.all()
    erb(:user)
  else
    flash[:notice] = "You have been signed out due to inactivity"
    redirect '/'
  end
end

post '/signup/?' do
  if User.find_by email: params['signup_email']
    flash[:notice] = "That email is already registered to an account"
    redirect '/'
  elsif User.find_by username: params['signup_username']
    flash[:notice] = 'That username is taken'
    redirect '/'
  else
    secure_password = Password.create(params['signup_password'])
    @user = User.create({username: params['signup_username'], email: params['signup_email'], password: secure_password})
    session[:id] = @user.id
    redirect '/user'
  end
end

post '/login/?' do
  if user = User.authenticate(params)
    @user = user
    session[:id] = @user.id
    redirect '/user'
  else
    flash[:notice] = "Invalid username or password."
    redirect '/'
  end
end

post '/logout/?' do
  session.clear
  flash[:notice] = "You have succesfully signed out"
  redirect '/'
end

post '/conversation' do
  @conversation = Conversation.create({sender_id: params['data-sid'], recipient_id: params['data-rid']})
  @user = User.find(session[:id])
  @user.conversations.push(@conversation)
  @other_user = User.find(params['data-rid'])
  @other_user.conversations.push(@conversation)
  redirect '/user'
end
