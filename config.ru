$:.unshift '.'
require 'config/environment'


use UserController
use ApplicationController
run SocietyController
