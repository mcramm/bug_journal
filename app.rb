require 'rubygems'
require 'sinatra'
require 'environment'
require 'digest/md5'

set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :views, "views"
set :public, "static"

enable :sessions

configure do 
    Compass.add_project_configuration(File.join(Sinatra::Application.root, 'config', 'compass.config'))
end

before do
    @db = CouchRest.database!("http://127.0.0.1:5984/" << ENV['DB_NAME'])
end

get '/stylesheets/:name.css' do
    content_type 'text/css', :charset => 'utf-8'
    sass(:"stylesheets/#{params[:name]}", Compass.sass_engine_options)
end

def verify_user
    redirect '/login' if session[:user].nil?
end


%w(/ /projects).each do |path|
    get path do
        verify_user
        @projects = Project.all
        haml :index
    end
end

get '/login' do
    haml :login
end

post '/signin' do
    username = params['user']['username'] 
    password = params['user']['password']
    password = Digest::MD5.hexdigest( password )

    user = User.by_username(:key => username).first

    invalid_user if user.nil?
    invalid_password if user.password != password
    
    session[:user] = user

    redirect '/'
end

get '/register' do
    @user = User.new

    haml :register
end

post '/signup' do
   params['user']['password'] = Digest::MD5.hexdigest( params['user']['password'] )
   user = User.new( params['user'] )

   if user.save
       session[:user] = user
       redirect "/"
   else
       halt "bad user save"
   end
end

get '/logout' do
    verify_user
    session[:user] = nil
    redirect '/login'
end


after do
    session[:message] = nil
end

private

def escape(string)
    CGI.escape string
end

def find_project(nice_url)
    nice_url = escape( nice_url )
    @project = Project.by_nice_url(:key => nice_url ).first
end

def invalid_user 
#    session[:message] = "Invalid Username"
    redirect '/login'
end

def invalid_password 
#    session[:message] = "Invalid Password"
    redirect '/login'
end

