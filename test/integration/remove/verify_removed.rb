describe command('apparmor_status') do
  its('stdout') { should_not match /my_policy/ }
end
