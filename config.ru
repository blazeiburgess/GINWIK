$:.unshift '.'
require './config/environment'


use UserController
use SocietyController
run ApplicationController
