require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

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
  erb(:"index.html")
end
