enabled = input('enabled')

control 'apparmor-common' do
  title 'Verify AppArmor is disabled or disabled'

  describe package 'apparmor' do
    if enabled
      it { should be_installed }
    else
      it { should_not be_installed }
    end
  end

  describe service 'apparmor' do
    if enabled
      it { should be_enabled }
      it { should be_running }
    else
      it { should_not be_enabled }
      it { should_not be_running }
    end
  end

  describe file '/sys/module/apparmor/parameters/enabled' do
    if enabled
      its('content') { should cmp "Y\n" }
    else
      its('content') { should cmp "N\n" }
    end
  end
end
