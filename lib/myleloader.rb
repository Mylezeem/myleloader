require 'myleloader/connector/mongo'
require 'json'
require 'purolie'
require 'purolie/context'


module Myleloader
  include Purolie

  @@connector = Myleloader::MongoDB.new

  def list
    @@connector.list    
  end

  def delete id
    @@connector.delete id
  end

  def upload

    options = { 
      :environment => nil,
      :format      => 'json',
      :path        => nil,
      :mandatory   => false,
      :sudo        => false,
      :filepath    => '/home/spredzy/.puppet/modules/blabla/manifests/init.pp',
    }

    ctx = Purolie::Context.new options
    profile = Purolie.parse ctx
    document = {}
    document[:name] = profile.name
    document[:version] = '0.1.0'
    document[:full_parameter] = JSON.parse(profile.to_s.gsub(/=>/, ":").gsub(/nil/, '""').gsub(/'/, ''))
    @@connector.upload document
  end

end
