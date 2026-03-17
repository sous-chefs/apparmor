# frozen_string_literal: true

title 'Disable suite - AppArmor disabled'

control 'apparmor-disable-01' do
  impact 1.0
  title 'AppArmor package is removed'

  describe package('apparmor') do
    it { should_not be_installed }
  end
end

control 'apparmor-disable-02' do
  impact 1.0
  title 'AppArmor service is not running'

  describe service('apparmor') do
    it { should_not be_running }
  end
end

control 'apparmor-disable-03' do
  impact 0.7
  title 'GRUB config disables AppArmor'
  only_if('not in Docker') { !file('/.dockerenv').exist? }

  describe file('/etc/default/grub.d/apparmor.cfg') do
    it { should exist }
    its('content') { should match(/apparmor=0/) }
  end
end
