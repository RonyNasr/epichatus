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

  erb(:index)
end

post("/conversations") do

  if Conversation.between(params[:sender_id],params[:recipient_id]).present?
         @conversation = Conversation.between(params[:sender_id],params[:recipient_id]).first
  else
     @conversation = Conversation.create!(:sender_id => params[:sender_id],:recipient_id => params[:recipient_id])
  end
   @users = User.all()

   erb(:index)
end
