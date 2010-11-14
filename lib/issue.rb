module IssueRoutes
    get '/project/:project_url/issue/new' do |project_url|
        verify_user
        @project_url = find_project(project_url).nice_url
        @issue = Issue.new

        haml :'issue/new'
    end

    post '/project/:project_url/issue/save' do |project_url|
        verify_user

        @project = find_project project_url
        @issue = Issue.new( params['issue'] )
        @project.issues << @issue

        @project.save
    
        redirect "/project/#{project_url}"
    end

    get '/project/:project_url/issue/:issue_url' do |project_url, issue_url|
        verify_user
        @issue = find_issue project_url, issue_url

        haml :'issue/show'
    end

    get '/project/:project_url/issue/:issue_url/edit' do |project_url, issue_url|
        verify_user
        find_issue project_url, issue_url

        haml :'issue/edit', :locals => { :issue => @issue }
    end

    post '/project/:project_url/issue/:issue_url/update' do |project_url, issue_url|
        verify_user
        find_project project_url

        @project.issues[issue_url.to_i] = params['issue']
        @project.save

        redirect "/project/#{project_url}/issue/#{issue_url}"
    end

    get '/project/:project_url/issue/:issue_url/delete' do |project_url, issue_url|
        verify_user
        find_issue project_url, issue_url

        @project.issues.slice!(issue_url.to_i)
        @project.save

        redirect "/project/#{project_url}"
    end



    
end

