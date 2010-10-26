require 'lib/issue'

class Project < CouchRest::ExtendedDocument
    include CouchRest::Validation
    if ENV['RACK_ENV'] == 'test'
        db_name = 'bug-diary-test'
    else
        db_name = 'bug-diary'
    end
    use_database CouchRest.database!("http://127.0.0.1:5984/#{db_name}")

    property :title
    property :description
    property :nice_url
    property :issues,   [Issue]

    timestamps!

    validates_present :title
    validates_present :nice_url

end
