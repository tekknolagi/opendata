#require 'sinatra'
require 'grape'
require './database.rb'

# heroku addons:add heroku-postgresql

class OpenData; end

class OpenData::API < Grape::API
  format :json
  
  resource :feed do
    desc "Explain what this is all about."
    get '/' do
      self.routes
    end

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

    desc "Post a new datum; param is `body`."
    post :new, :requirements => { :body => /[ -~]+/ } do
      d = Datum.create :body => params[:body]
      d.save!
    end
  end
end

