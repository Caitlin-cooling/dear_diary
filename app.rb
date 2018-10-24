require 'sinatra/base'
require_relative './lib/entry'
require 'pg'

class DearDiary < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/new_entry' do
    erb :new_entry
  end

  post '/new_entry' do
    content = params[:content]
    title = params[:title]
    Entry.create(title, content)
    redirect '/confirmation'
  end

  get '/confirmation' do
    @entries = Entry.all
    erb :confirmation
  end

  get '/view_entries' do
    @entries = Entry.all
    erb :view_entries
  end

  get '/entry/:id' do
    @entry = Entry.all.select{ |entry| entry.id == params[:id] }.first
    erb :entry_id
  end

  run! if app_file == $0

end
