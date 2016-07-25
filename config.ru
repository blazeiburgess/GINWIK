$:.unshift '.'
require './config/environment'


use UserController
use SocietyController
use ConflictsController
use SocialGroupsController
use MethodController
use MergeController
use CloneController
run ApplicationController
