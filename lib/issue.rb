class Issue < Hash
    include CouchRest::CastedModel
    property :name
    property :nice_url

end
