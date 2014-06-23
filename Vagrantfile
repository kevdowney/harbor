# Code and idea taken from Laravel Homestead
# http://laravel.com/docs/homestead?version=4.2


VAGRANTFILE_API_VERSION = "2"

path = "#{File.dirname(__FILE__)}"

require 'yaml'
require path + '/lib/config.rb'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  Harbor.configure(config, YAML::load(File.read(path + '/settings.yaml')))
end
