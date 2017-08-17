describe command('apparmor_status') do
  its('stdout') { should match /my_policy/ }
end
