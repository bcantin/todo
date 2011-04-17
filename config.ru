# This file is used by Rack-based servers to start the application.
# 
# require ::File.expand_path('../config/environment',  __FILE__)
# run Todo::Application


require ::File.expand_path('../config/environment',  __FILE__)
require ::File.expand_path('../lib/api_v1',  __FILE__)

run Rack::Cascade.new([ApiV1, Todo::Application])
