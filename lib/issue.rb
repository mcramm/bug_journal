module IssueRoutes
    get '/project/:project_url/issue/new' do |project_url|
        verify_user
        @issue = Issue.new

        haml :'issue/new'
    end
end

