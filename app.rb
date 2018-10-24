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

  post '/confirm_entry' do
    entry = params[:entry]
    connection = PG.connect(dbname: 'dear_diary_test')
    connection.exec("INSERT INTO entries (content) VALUES('#{entry}')")
    redirect '/confirmation'
  end

  get '/confirmation' do
    @entries = Entry.all
    erb(:confirmation)
  end


  run! if app_file == $0

end
