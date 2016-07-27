
# require 'sinatra/base'
# Dir.glob('./app/{models,helpers,controllers}/*.rb').each { |file| require file }
# PrivatePub.load_config(File.expand_path("../config/private_pub.yml", __FILE__), ENV["RACK_ENV"] || "development")
# run PrivatePub.faye_app
#
# $: << '.'
# require "yaml"
require "bundler/setup"
require "faye"
require "private_pub"
# require './app'
require File.expand_path('./app', __FILE__)
Faye::WebSocket.load_adapter('thin')

use Faye::RackAdapter, :mount => '/faye', :timeout => 25

run Sinatra::Application
