@test "apparmor_status doesn't list my_policy" {
  apparmor_status | grep -qv "my_policy"
}
