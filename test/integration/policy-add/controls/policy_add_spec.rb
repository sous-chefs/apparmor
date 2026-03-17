# frozen_string_literal: true

title 'Policy add suite'

control 'apparmor-policy-add-01' do
  impact 1.0
  title 'AppArmor is installed and running'

  describe package('apparmor') do
    it { should be_installed }
  end

  describe service('apparmor') do
    it { should be_enabled }
    it { should be_running }
  end
end

control 'apparmor-policy-add-02' do
  impact 1.0
  title 'Policy file exists'

  describe file('/etc/apparmor.d/my_policy') do
    it { should exist }
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
  end
end

control 'apparmor-policy-add-03' do
  impact 1.0
  title 'Policy is loaded in AppArmor'

  describe command('sudo apparmor_status') do
    its('stdout') { should match %r{/usr/sbin/my_policy} }
  end
end
