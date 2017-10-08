#!rackup

require_relative './lib/isuda/web.rb'


require 'stackprof' #if ENV['ISUPROFILE']
Dir.mkdir('/tmp/stackprof') unless File.exist?('/tmp/stackprof')
use StackProf::Middleware, enabled: true,  mode: :wall, interval: 500, save_every: 100, path: '/tmp/stackprof'

run Isuda::Web
