describe_recipe 'apparmor' do
  it 'should enable/disable apparmor properly' do
    %x(/usr/sbin/service apparmor status 2>&1)

    if node['apparmor']['disable']
      assert_equal 2, $?.exitstatus
    else
      assert_equal 0, $?.exitstatus
    end
  end

  it 'removes apparmor' do
    if node['apparmor']['disable']
      output = %x(dpkg -l apparmor | grep ii 2>&1)
      assert_match /^$/, output
      assert_equal 1, $?.exitstatus
    else
      package('apparmor').must_be_installed
    end
  end
end
