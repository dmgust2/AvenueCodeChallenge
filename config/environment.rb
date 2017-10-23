# Load the Rails application.
require_relative 'application'


#
# Logging
#

# Redirect log output to ONLY the console
#Rails.logger = Logger.new(STDOUT)

# Log4R (not implemented)
#Rails.logger = Log4r::Logger.new("TodoList")


# Initialize the Rails application.
Rails.application.initialize!
