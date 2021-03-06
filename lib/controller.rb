require 'gossip'

class ApplicationController < Sinatra::Base
	get '/' do
	  erb :index, locals: {gossips: Gossip.all}
	end

	get '/gossip/new/' do
		erb :new_gossip
	end

	post '/gossips/new/' do
		Gossip.new(params["gossip_author"], params["gossip_content"]).save
		redirect '/'
	end

	get '/gossips/:id' do 
		erb :show_gossip, locals: {gossip: Gossip.find(params[:id]), id_gossip: params[:id]}
	end


	get '/gossip/edit/:id' do
		erb :edit, locals: {num_id: params[:id]}
	end

end