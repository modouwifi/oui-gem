# config.ru (run with `rackup` or `shotgun`)
require "oui"
require 'oui/server'

# realtime logging
# https://devcenter.heroku.com/articles/logging
$stdout.sync = true

use Rack::Static, :urls => ["/assets"], :root => "public"

run OUI::Server
