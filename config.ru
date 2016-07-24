$:.unshift '.'
require './config/environment'


use UserController
use SocietyController
use MergeController
use CloneController
run ApplicationController
