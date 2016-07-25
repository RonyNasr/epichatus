require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
include BCrypt

get '/' do
  erb(:index)
end

post '/signup/?' do
  if User.find_by email: params['signup_email']
    'That email is already registered to an account'
    redirect '/ '
  elsif User.find_by username: params['signup_username']
    'That username is taken'
    redirect '/'
  else
    secure_password = Password.create(params['signup_password'])
    @user = User.create({username: params['signup_username'], email: params['signup_email'], password: secure_password})
    erb(:user)
  end
end

post '/login/?' do
  if user = User.authenticate(params)
    session[:user] = user
    redirect_to_original_request
  else
    flash[:notice] = "You could not be signed in. Please re-enter you email and password"
    redirect '/signin'
  end
end
