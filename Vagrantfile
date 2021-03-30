Vagrant.configure("2") do |config|
  config.env.enable

  tokens = ENV['GH_RUNNER_TOKENS'].split(',')
  labels = ENV['GH_RUNNER_LABELS']

  tokens.each_with_index do |token, index|
    config.vm.define "runner-#{index}" do |runner|
      runner.vm.box = "generic/debian10"
      runner.vm.hostname = "github-actions-vagrant-runner-#{index}.box"

      runner.vm.provider "virtualbox" do |vb|
        vb.cpus = 8
        vb.memory = 4096
      end

      runner.vm.provision :shell, :path => "vagrant/provision.sh"
      runner.vm.provision :shell, :path => "vagrant/github-actions.sh", :privileged => false, :args => "#{token} #{labels}"
    end
  end
end
