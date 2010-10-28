require 'rubygems'
require 'sinatra'
require 'environment'

set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :views, "views"
set :public, "static"

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

%w(/ /projects).each do |path|
    get path do
        @projects = Project.all
        haml :index
    end
end

get '/project/new' do
    @project = Project.new
    haml :'project/new'
end

get '/project/:nice_url/edit' do |nice_url|
    find_project nice_url

    haml :'project/edit', :locals => { :project => @project }
end

post '/project/save' do
    params['project']['nice_url'] = escape(params['project']['title'].downcase)
    @project = Project.new( params['project'] )
    if @project.save
        redirect "/project/#{@project.nice_url}"
    else
        halt 'Baa! bad save!'
    end
end

post '/project/:nice_url/update' do |nice_url|
    find_project nice_url

    params['project']['nice_url'] = escape(params['project']['title'].downcase)
    if @project.update_attributes( params['project'] )
        redirect "/project/#{@project.nice_url}"
    else
        halt 'Baa! aaaa!'
    end
    
end

get '/project/:nice_url/delete' do |nice_url|
    find_project nice_url
    
    if @project.destroy
        redirect "/"
    else
        halt 'Cant delete'
    end
end

get '/project/:nice_url' do |nice_url|
    find_project nice_url

    haml :'project/show'
end


private

def escape(string)
    CGI.escape string
end

def find_project(nice_url)
    nice_url = escape( nice_url )
    @project = Project.by_nice_url(:key => nice_url ).first
end
