require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
    'Hello, this is our first webpage!'
end
