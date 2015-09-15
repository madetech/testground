unless Vagrant.has_plugin?('vagrant-omnibus')
  raise 'vagrant-omnibus is not installed! Install with `vagrant plugin install vagrant-omnibus`'
end

Vagrant.configure(2) do |config|
  config.vm.box = 'chef/centos-6.5'
  config.vm.box_url = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5_chef-provisionerless.box'

  config.vm.hostname = "testground"

  config.vm.network 'private_network', ip: '192.168.33.15'
  config.vm.network 'forwarded_port', guest: 3000, host: 3000

  config.vm.synced_folder '.', '/var/www', type: :nfs

  config.omnibus.chef_version = '11.8.2'

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = %w(private/chef/cookbooks private/chef/site-cookbooks)
    chef.data_bags_path = %w(private/chef/data_bags)
    chef.roles_path = [File.expand_path('../private/chef/roles', __FILE__)]
    chef.add_role 'vagrant'
  end
end
