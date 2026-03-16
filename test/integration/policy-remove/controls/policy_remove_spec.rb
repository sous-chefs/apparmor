# frozen_string_literal: true

title 'Policy remove suite'

control 'apparmor-policy-remove-01' do
  impact 1.0
  title 'AppArmor package is installed'

  describe package('apparmor') do
    it { should be_installed }
  end
end

control 'apparmor-policy-remove-01a' do
  impact 1.0
  title 'AppArmor service is running'
  only_if('not in Docker') { !file('/.dockerenv').exist? }

  describe service('apparmor') do
    it { should be_enabled }
    it { should be_running }
  end
end

control 'apparmor-policy-remove-02' do
  impact 1.0
  title 'Policy file is removed'

  describe file('/etc/apparmor.d/my_policy') do
    it { should_not exist }
  end
end

control 'apparmor-policy-remove-03' do
  impact 1.0
  title 'Policy is not loaded in AppArmor'
  only_if('not in Docker') { !file('/.dockerenv').exist? }

  describe command('apparmor_status') do
    its('stdout') { should_not match %r{/usr/sbin/my_policy} }
  end
end
