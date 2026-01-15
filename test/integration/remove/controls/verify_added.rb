control 'apparmor-remove' do
  describe package 'apparmor' do
    it { should be_installed }
  end

  describe service 'apparmor' do
    it { should be_enabled }
    it { should be_running }
  end

  describe command('apparmor_status') do
    its('stdout') { should_not match %r{/usr/sbin/my_policy} }
  end
end
