# coding: utf-8

require "sinatra"
require "sinatra/json"

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
      erb :form, :locals => { title: "提交 MAC 地址和厂商及产品的对应关系" }
    end

    get '/feed' do
      erb :thanks, :locals => { title: "非常感谢" }.merge(@params), :layout => :layout_plain
    end
  end
end
