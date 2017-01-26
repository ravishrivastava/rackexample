require_relative 'api_key'
require_relative 'validate_content_type'
require_relative 'who_is_calling'
require_relative 'friendly_errors'

require_relative 'application_helpers'
require_relative 'users_application'
require_relative 'rides_application'

require_relative 'database'
database = Database.new

use Rack::Runtime

if ENV["RACK_ENV"] == "production"
  use Rack::NullLogger
  use Rack::CommonLogger
else
  use Rack::Logger
  use Rack::Reloader
end

use ApiKey, database: database
use ValidateContentType
use Rack::ShowStatus
use FriendlyErrors

use WhoIsCalling

map('/users') do
 run UsersApplication.new(database)
end

map('/rides') do
 run RidesApplication.new(database)
end
