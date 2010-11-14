class Issue < Hash
    include CouchRest::CastedModel
    property :title
    property :description
    property :nice_url

end
