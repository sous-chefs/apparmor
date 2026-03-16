# frozen_string_literal: true

title 'Default suite - AppArmor enabled'

control 'apparmor-service-01' do
  impact 1.0
  title 'AppArmor package is installed'

  describe package('apparmor') do
    it { should be_installed }
  end
end

control 'apparmor-service-02' do
  impact 1.0
  title 'AppArmor service is running'

  describe service('apparmor') do
    it { should be_enabled }
    it { should be_running }
  end
end
