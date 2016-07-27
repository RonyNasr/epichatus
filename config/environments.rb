require("bundler/setup")
Bundler.require(:default)

configure :production, :development do
  db = URI.parse(ENV['RACK_ENV'] || 'epichatus')

  ActiveRecord::Base.establish_connection(
    :adapter  => 'postgresql',
    :database => 'epichatus'
  )
end
