module ProjectRoutes
    get '/project/new' do
        verify_user
        @project = Project.new
        haml :'project/new'
    end

    get '/project/:nice_url/edit' do |nice_url|
        verify_user
        find_project nice_url

        haml :'project/edit', :locals => { :project => @project }
    end

    post '/project/save' do
        verify_user
        params['project']['nice_url'] = escape(params['project']['title'].downcase)
        @project = Project.new( params['project'] )
        if @project.save
            redirect "/project/#{@project.nice_url}"
        else
            halt 'Baa! bad save!'
        end
    end

    post '/project/:nice_url/update' do |nice_url|
        verify_user
        find_project nice_url

        params['project']['nice_url'] = escape(params['project']['title'].downcase)
        if @project.update_attributes( params['project'] )
            redirect "/project/#{@project.nice_url}"
        else
            halt 'Baa! aaaa!'
        end
        
    end

    get '/project/:nice_url/delete' do |nice_url|
        verify_user
        find_project nice_url
        @project.issues.each do |issue|
            destroy_comments(nice_url, @project.issues.index(issue))
        end
        
        if @project.destroy
            redirect "/"
        else
            halt 'Cant delete'
        end
    end

    get '/project/:nice_url' do |nice_url|
        verify_user
        find_project nice_url

        haml :'project/show'
    end
end
