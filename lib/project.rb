require 'lib/issue'

class Project < CouchRest::ExtendedDocument
    include CouchRest::Validation
    use_database CouchRest.database!("http://127.0.0.1:5984/bug-diary")

    property :title
    property :description
    property :nice_url
    property :issues,   [Issue]

    timestamps!

    validates_present :title
    validates_present :nice_url

end
