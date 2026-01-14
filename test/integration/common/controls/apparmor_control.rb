enabled = input('enabled')

control 'apparmor-common' do
  title 'Verify AppArmor is enabled or disabled'

  describe package 'apparmor' do
    if enabled
      it { should be_installed }
    else
      it { should_not be_installed }
    end
  end

  if enabled
    describe service 'apparmor' do
      it { should be_enabled }
      it { should be_running }
    end

    describe file '/sys/module/apparmor/parameters/enabled' do
      its('content') { should cmp "Y\n" }
    end
  else
    describe service 'apparmor' do
      it { should_not be_running }
    end

    describe file '/etc/default/grub.d/apparmor.cfg' do
      it { should exist }
      its('content') { should match(/apparmor=0/) }
    end
  end
end
