ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'datamapper_setup.rb'
require 'dm-validations'
require 'sinatra/flash'



class Bookmarks < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/user/new'
  end

  get '/links' do
    @links = Link.all
    @email = session[:email]
    erb :links
  end

  get '/add' do
    erb :add
  end

  post '/user' do
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:failure] = 'Password and confirmation password do not match'
      erb :signup
    end
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
    @email = session[:email]
    erb :links
  end

  get '/user/new' do
    @user = User.new
    erb :signup
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
