require 'sinatra'
require 'nokogiri'
require 'open-uri'

module Slidenotes
  class App < Sinatra::Base
    set :static, true

    get "/" do
      erb :urlform
    end
    
    post "/notes" do
      doc = Nokogiri::HTML(open(params[:url]))
      @notes = doc.css("#notesList p")
      erb :notes
    end
    
    helpers do
      # Replace stupid 'smart' quotes in text, replace '\n' with real
      # newlines, change selected diacritical marks
      #
      def cleaned(str) 
        str.gsub(/\\n/,"\n").gsub(/\‘|\’/, "'").gsub(/\”|\“/, '"').gsub(/í/, 'i')
      end
    end
  end
end