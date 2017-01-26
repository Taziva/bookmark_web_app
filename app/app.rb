ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'datamapper_setup.rb'

class Bookmarks < Sinatra::Base

  enable :sessions

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/add' do
    erb :add
  end

  post '/create' do
    link = Link.new(url: params[:url], title: params[:title])
    params[:tags].split(', ').each do |t|
      tag = Tag.first_or_create(name: t.gsub(' ', '_').downcase)
      link.tags << tag
    end
    link.save
    redirect '/links'
  end

  get '/tags' do
    @tags = Tag.all
    erb :tags
  end

  post '/selection' do
    session[:tag] = params[:filtered_tag]
    redirect '/tags/:tag'
  end

  get '/tags/:tag' do
    tag = Tag.first(name: session[:tag])
    @links = tag ? tag.links : []
    erb :links
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
