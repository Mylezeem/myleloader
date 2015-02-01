require 'mongo'

module Myleloader

  class MongoDB
    include Mongo

    def initialize
      @@conn = MongoClient.new('mongo.puppeels.mylezeem.com', 27017).db('mylezeem').collection('profiles')
    end

    def list
      @@conn.find.each do |profile|
        puts ">> [#{profile['_id']}] name : #{profile['name']}\t| version : #{profile['version']}"
      end
    end

    def delete elements
      elements.each do |elm_to_remove|
        puts ">> Delete: #{elm_to_remove}"
        @@conn.remove({'name' => elm_to_remove})
      end
    end

    def upload document
      @@conn.insert document
    end

  end

end
