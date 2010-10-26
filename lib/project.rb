require 'lib/issue'

class Project < CouchRest::ExtendedDocument
    include CouchRest::Validation

    use_database CouchRest.database!("http://127.0.0.1:5984/" << ENV['DB_NAME'])

    property :title
    property :description
    property :nice_url
    property :issues,   [Issue]

    timestamps!

    validates_presence_of :title
    validates_presence_of :nice_url

end
