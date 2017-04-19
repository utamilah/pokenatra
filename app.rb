require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/pokemon'
require_relative 'models/trainer'

# Routes Below #

get '/' do
  @trainer =  Trainer.all
  @pokemon = Pokemon.all
  erb :"index"
end

## Pokemon Routes

get '/pokemon' do
  @pokemon = Pokemon.all
  erb :"pokemon/index"
end

get '/pokemon/new' do
  erb :"pokemon/new"
end

get '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemon/pokemon"
end

post '/pokemon' do
  @pokemon = Pokemon.create(name: params[:name], cp: params[:cp], poke_type: params[:poke_type], img_url: params[:img_url])
  redirect "/pokemon/#{@pokemon.id}"
end

get '/pokemon/:id/edit' do
  @pokemon = Pokemon.find(params[:id])
  erb(:"pokemon/edit")
end

put '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  redirect "/pokemon/#{@pokemon.id}"
end

delete '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.destroy
  redirect "/pokemon"
end

## Trainer Routes

get '/trainer' do
  @trainer = Trainer.all
  erb :"trainer/index"
end

get '/trainer/new' do
  erb :"trainer/new"
end

get '/trainer/:id' do
  @trainer = Trainer.find(params[:id])
  erb :"trainer/trainer"
end

post '/trainer' do
  @trainer = Trainer.create(name: params[:name], level: params[:level], img_url: params[:img_url])
  redirect "/trainer/#{@trainer.id}"
end

get '/trainer/:id/edit' do
  @trainer = Trainer.find(params[:id])
  erb(:"trainer/edit")
end

put '/trainer/:id' do
  @trainer = Trainer.find(params[:id])
  @trainer.update(params[:trainer])
  redirect "/trainer/#{@trainer.id}"
end

delete '/trainer/:id' do
  @trainer = Trainer.find(params[:id])
  @trainer.destroy
  redirect "/trainer"
end
