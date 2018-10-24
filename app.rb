require 'sinatra/base'

class DearDiary < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/new_entry' do
    erb(:new_entry)
  end

  run! if app_file == $0

end
