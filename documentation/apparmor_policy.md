# apparmor_policy

[Back to resource list](../README.md#resources)

Adds or removes AppArmor policies

## Actions

| Action    | Description                                             |
| --------- | ------------------------------------------------------- |
| `:add`    | Adds a new AppArmor policy using a provided policy file |
| `:remove` | Removes a specified AppArmor policy                     |

## Properties

| Name              | Type   | Default       | Description                                                                          |
| ----------------- | ------ | ------------- | ------------------------------------------------------------------------------------ |
| `name`            | String | Resource name | The name of the policy as stored in `/etc/apparmor.d/`                               |
| `source_cookbook` | String |               | Cookbook to source the policy file from if the provider is not in the same cookbook. |
| `source_filename` | String |               | Name of the source file in the cookbook if it doesn't match the name attribute       |

## Examples

Add the policy `my_super_app` where a cookbook file exists in the same cookbook and is named `my_super_app`

```ruby
apparmor_policy 'my_super_app'

```

Add the policy `my_super_app` where a cookbook file exists in a different cookbook and the file is named `my_super_app_am_policy`

```ruby
apparmor_policy 'my_super_app' do
  source_cookbook 'acme_apparmor_profiles'
  source_filename 'my_super_app_am_policy'
end
```

Remove the policy `my_super_app`

```ruby
apparmor_policy 'my_super_app' do
  action  :remove
end
```
