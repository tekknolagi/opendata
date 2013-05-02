require 'sinatra'
require 'grape'
require 'json'
require './database.rb'

class OpenData; end

class OpenData::API < Grape::API
  format :json

  resource :feed do
    desc "Get the last posted datum."
    get :last do
      Datum.last
    end
    
    desc "Get the last n data."
    get :latest do
      begin
        Datum.all :order => [ :id.desc ], :limit => params[:limit]
      rescue
        Datum.all :order => [ :id.desc ], :limit => 10
      end
    end
  end

  resource :datum do
    desc "Post a new datum. Params: `body`"
    post :new do
      d = Datum.create :body => params[:body]
      d.save!
      d
    end

    desc "Get a datum by id."
    get ':id' do
      Datum.first :id => params[:id]
    end
  end
end

class OpenData::Web < Sinatra::Base
  get '/' do
    OpenData::API.routes.to_json
  end
end
