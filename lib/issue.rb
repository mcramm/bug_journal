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
    
        redirect project_url @project
    end

    get '/project/:project_url/issue/:issue_index' do |project_url, issue_index|
        verify_user
        @issue = find_issue project_url, issue_index
        find_comment project_url, issue_index
        haml :'issue/show'
    end

    get '/project/:project_url/issue/:issue_index/edit' do |project_url, issue_index|
        verify_user
        find_issue project_url, issue_index

        haml :'issue/edit', :locals => { :issue => @issue }
    end

    post '/project/:project_url/issue/:issue_index/update' do |project_url, issue_index|
        verify_user
        find_project project_url

        @project.issues[issue_index.to_i] = params['issue']
        @project.save

        redirect issue_url(@project, issue_index)
    end

    get '/project/:project_url/issue/:issue_index/delete' do |project_url, issue_index|
        verify_user
        find_issue project_url, issue_index

        destroy_comments(project_url, issue_index)

        @project.issues.slice!(issue_index.to_i)
        @project.save

        redirect project_url(@project)
    end

    post '/project/:project_url/issue/:issue_index/create_comment' do |project_url, issue_index|
        verify_user
        comment = Comment.new( params[:comment] )
        comment.issue_id = "#{project_url}-#{issue_index}"
        comment.body = comment.body.gsub( /\r\n/m, "<br />" )

        comment.save

        redirect issue_url( find_project(project_url), issue_index)
    end
end

