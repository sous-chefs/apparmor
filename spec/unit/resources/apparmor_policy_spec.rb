# frozen_string_literal: true

require 'spec_helper'

describe 'apparmor_policy' do
  step_into :apparmor_policy
  platform 'ubuntu', '24.04'

  context 'action :add with defaults' do
    recipe do
      apparmor_policy 'my_policy'
    end

    it { is_expected.to create_cookbook_file('/etc/apparmor.d/my_policy') }

    it do
      is_expected.to create_cookbook_file('/etc/apparmor.d/my_policy').with(
        owner: 'root',
        group: 'root',
        mode: '0644'
      )
    end

    it { is_expected.to nothing_service('apparmor') }
  end

  context 'action :add with source_cookbook' do
    recipe do
      apparmor_policy 'my_policy' do
        source_cookbook 'acme_profiles'
      end
    end

    it do
      is_expected.to create_cookbook_file('/etc/apparmor.d/my_policy').with(
        cookbook: 'acme_profiles'
      )
    end
  end

  context 'action :add with source_filename' do
    recipe do
      apparmor_policy 'my_policy' do
        source_filename 'custom_name'
      end
    end

    it do
      is_expected.to create_cookbook_file('/etc/apparmor.d/my_policy').with(
        source: 'custom_name'
      )
    end
  end

  context 'action :remove' do
    recipe do
      apparmor_policy 'my_policy' do
        action :remove
      end
    end

    it { is_expected.to delete_file('/etc/apparmor.d/my_policy') }
    it { is_expected.to nothing_service('apparmor') }
    it { is_expected.to nothing_execute('aa-remove-unknown') }
  end
end
