include_controls 'apparmor-common'

control 'apparmor-remove' do
  describe command('apparmor_status') do
    its('stdout') { should_not match %r{/usr/sbin/my_policy} }
  end
end
