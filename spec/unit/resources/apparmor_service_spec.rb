# frozen_string_literal: true

require 'spec_helper'

describe 'apparmor_service' do
  step_into :apparmor_service
  platform 'ubuntu', '24.04'

  before do
    allow(Dir).to receive(:exist?).and_call_original
    allow(Dir).to receive(:exist?).with('/etc/default/grub.d').and_return(true)
  end

  context 'action :create (default)' do
    recipe do
      apparmor_service 'default'
    end

    it { is_expected.to install_package('apparmor') }

    it { is_expected.to start_service('apparmor') }

    it { is_expected.to enable_service('apparmor') }

    it { is_expected.to delete_file('/etc/default/grub.d/apparmor.cfg') }

    it { is_expected.to nothing_execute('update-grub') }

    it { is_expected.to nothing_reboot('apparmor_state_change') }
  end

  context 'action :disable' do
    recipe do
      apparmor_service 'default' do
        action :disable
      end
    end

    it { is_expected.to nothing_execute('apparmor_teardown') }

    it { is_expected.to remove_package('apparmor') }

    it { is_expected.to stop_service('apparmor') }

    it { is_expected.to disable_service('apparmor') }

    it { is_expected.to create_file('/etc/default/grub.d/apparmor.cfg') }

    it do
      is_expected.to create_file('/etc/default/grub.d/apparmor.cfg').with(
        content: 'GRUB_CMDLINE_LINUX_DEFAULT="$GRUB_CMDLINE_LINUX_DEFAULT apparmor=0"'
      )
    end

    it { is_expected.to nothing_execute('update-grub') }

    it { is_expected.to nothing_reboot('apparmor_state_change') }
  end
end
