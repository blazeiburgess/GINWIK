$:.unshift '.'
require 'config/environment'

use SocietyController
run ApplicationController
