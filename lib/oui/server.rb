require "sinatra"
require "sinatra/json"

module OUI
  class Server < Sinatra::Base
    configure :production do
      require 'newrelic_rpm'
    end

    get '/lookup' do
      organization = OUI::MACAddress.parse(params[:mac]).organization
      result = { mac: params[:mac], manufacturer: organization.name, chinese_name: organization.chinese_name }
      json result
    end
  end
end
