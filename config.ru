$:.unshift '.'
require './config/environment'


use UserController
use SocietyController
use MergeController
run ApplicationController
