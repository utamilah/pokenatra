require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/pokemon'

# Routes Below #
get '/' do
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
  redirect "/"
end
