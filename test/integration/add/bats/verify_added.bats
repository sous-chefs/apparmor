@test "apparmor_status lists my_policy" {
  apparmor_status | grep -q "my_policy"
}
