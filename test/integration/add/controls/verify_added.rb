include_controls 'apparmor-common'

control 'apparmor-add' do
  describe command('apparmor_status') do
    its('stdout') { should match %r{/usr/sbin/my_policy} }
  end
end
