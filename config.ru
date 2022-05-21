require 'sinatra'
require_relative './slidenotes'

use Rack::Static, :urls => ['/css', '/img'], :root => 'public'

map "/" do 
    run Slidenotes::App
end