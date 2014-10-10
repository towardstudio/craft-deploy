set :deploy_config_path, 'cap/deploy.rb'
set :stage_config_path, 'cap/deploy'

# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

# Include custom strategy for deploying git submodules
require 'capistrano/git'
require './cap/submodule_strategy'

# Includes everything else
require 'yaml'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('cap/tasks/*.cap').each { |r| import r }