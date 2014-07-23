require "sinatra"
require "sinatra/json"
require "erb"

module OUI
  class Server < Sinatra::Base
    configure :production do
      require 'newrelic_rpm'
    end

    get '/lookup' do
      org = OUI::MACAddress.parse(params[:mac]).organization

      result = {
        mac: params[:mac],
        manufacturer: org.name,
        chinese_name: org.chinese_name
      }

      json result
    end

    get '/' do
      template = File.read(File.expand_path("../../../template.html.erb", __FILE__))
      renderer = ERB.new(template)

      renderer.result
    end

    get '/feed' do
      erb :thanks, :locals => @params
    end
  end
end
