require 'sinatra/base'
require_relative './lib/entry'
require 'pg'

class DearDiary < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/new_entry' do
    erb(:new_entry)
  end

  post '/new_entry' do
    content = params[:content]
    title = params[:title]
    Entry.create(title, content)
    redirect '/confirmation'
  end

  get '/confirmation' do
    @entries = Entry.all
    erb(:confirmation)
  end


  run! if app_file == $0

end
