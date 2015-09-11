describe_recipe 'apparmor' do
  it 'should enable/disable apparmor properly' do
    `/usr/sbin/service apparmor status 2>&1`

    if node['apparmor']['disable']
      assert_equal 2, $CHILD_STATUS.exitstatus
    else
      assert_equal 0, $CHILD_STATUS.exitstatus
    end
  end

  it 'removes apparmor' do
    if node['apparmor']['disable']
      output = `dpkg -l apparmor | grep ii 2>&1`
      assert_match /^$/, output # rubocop: disable Lint/AmbiguousRegexpLiteral
      assert_equal 1, $CHILD_STATUS.exitstatus
    else
      package('apparmor').must_be_installed
    end
  end
end
