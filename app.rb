require 'sinatra/base'
require_relative './lib/entry'

class DearDiary < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/new_entry' do
    erb(:new_entry)
  end

  post '/confirm_entry' do
    redirect '/confirmation'
  end

  get '/confirmation' do
    @entry = Entry.all
    erb(:confirmation)
  end


  run! if app_file == $0

end
