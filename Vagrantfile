Vagrant::Config.run do |config|
  config.vm.box = "ubuntu-rails"
  # config.vm.box_url = "https://github.com/downloads/roderik/VagrantQuantal64Box/quantal64.box"
  config.vm.box_url = "quantal64.box"
  config.vm.network :hostonly, "192.168.11.99"
  config.vm.share_folder "v-cookbooks", "/cookbooks", "."

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "cookbooks-custom"]
    chef.roles_path = "roles"
    chef.add_role("appserver")
  end

end
