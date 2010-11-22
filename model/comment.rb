class Comment < CouchRest::ExtendedDocument
    include CouchRest::Validation

    use_database CouchRest.database!("http://127.0.0.1:5984/" << ENV['DB_NAME'])

    property :body
    property :issue_id

    timestamps!

    validates_presence_of :body

    view_by :issue_id

end
