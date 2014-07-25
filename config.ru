# config.ru (run with `rackup` or `shotgun`)
require "oui"
require 'oui/server'

use Rack::Static, :urls => ["/assets"], :root => "public"

run OUI::Server
