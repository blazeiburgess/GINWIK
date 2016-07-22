$:.unshift '.'
require 'config/environment'

use SocietyController
use UserController
run ApplicationController
