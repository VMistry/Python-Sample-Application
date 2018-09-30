# Contains all the required plugins needed.
required_plugins = ["vagrant-hostsupdater", "vagrant-berkshelf"]
required_plugins.each do |plugin|
    unless Vagrant.has_plugin.each?(plugin)
      puts "Installing vagrant plugin #{plugin}"
      Vagrant::Plugin::Manager.instance.install_plugin plugin
      puts "Installed vagrant plugin #{plugin}"
    end
end

Vagrant.configure("2") do |config|
  config.vm.define "app" do |app|
    app.vm.box = "ubuntu/xenial64"
    app.vm.network "private_network", ip: "192.168.10.100"
    app.hostsupdater.aliases = ["Python.local"]
    app.vm.synced_folder "requirements", "/home/ubuntu/requirements"
    app.vm.provision "chef_solo" do |chef|
      chef.add_recipe "python::default"
    end
    app.vm.provision "chef_solo" do |chef|
      chef.add_recipe "nginxCB::default"
    end
  end
end
