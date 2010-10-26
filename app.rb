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
    @db = CouchRest.database!("http://127.0.0.1:5984/bug-diary")
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
    haml :new
end

post '/project/save' do
    params['project']['nice_url'] = CGI.escape(params['project']['title'].downcase)
    @project = Project.new( params['project'] )
    if @project.save
        redirect "/project/#{@project.id}"
    else
        halt 'Baa! bad save!'
    end
end

get '/project/:id' do
    @project = Project.find( params[:id] )
    haml :project
end


private
