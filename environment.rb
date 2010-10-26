require 'compass'
require 'haml'
require 'couchrest'
require 'couchrest_extended_document'
require 'ostruct'
require 'cgi'

ENV['RACK_ENV'] ||= 'production'
ENV['DB_NAME'] = 'bug-journal-' << ENV['RACK_ENV']

require 'lib/project'
