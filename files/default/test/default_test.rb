describe_recipe 'apparmor' do
  it 'should enable/disable apparmor properly' do
    output = %x(/usr/sbin/service apparmor status 2>&1)

    if node['apparmor']['disable'] == true then
      assert_match /0 profiles are loaded./, output
      assert_equal 2, $?.exitstatus
    else
      assert_equal 0, $?.exitstatus
    end
  end
end
