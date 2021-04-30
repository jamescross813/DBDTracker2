require './config/environment'
require_relative 'app/controllers/killers_controller'
require_relative 'app/controllers/survivors_controller'
require_relative 'app/controllers/perks_controller'
require_relative 'app/controllers/users_controller'
require_relative 'app/controllers/currencies_controller'
require_relative 'app/helpers/helpers'

use Rack::MethodOverride


use KillersController
use SurvivorsController
use PerksController
use UsersController
use CurrenciesController
run ApplicationController