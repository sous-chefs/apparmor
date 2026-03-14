# Limitations

## Package Availability

AppArmor is a Linux Security Module (LSM) integrated into the kernel. The `apparmor` userspace
tools are available from the default distribution repositories — no third-party repositories are
needed.

### APT (Debian/Ubuntu)

- Debian 12 (Bookworm): apparmor 3.0.x (all architectures: amd64, arm64, armhf, i386, etc.)
- Debian 13 (Trixie): apparmor 4.x (all architectures)
- Ubuntu 22.04 (Jammy): apparmor 3.0.x (amd64, arm64, armhf, s390x, etc.)
- Ubuntu 24.04 (Noble): apparmor 4.x (amd64, arm64, armhf, s390x, etc.)

### Other Platform Families

AppArmor is **not available** on RHEL, CentOS, AlmaLinux, Rocky, Fedora, Amazon Linux, or SUSE.
These distributions use SELinux as their mandatory access control system. This cookbook only
supports Debian-family platforms.

## Architecture Limitations

None — the `apparmor` package is available on all architectures supported by Debian and Ubuntu.

## Source/Compiled Installation

Not applicable. AppArmor kernel support is compiled into Debian/Ubuntu kernels by default.
The userspace tools are installed via the distribution package manager.

## Known Issues

- Disabling AppArmor requires a GRUB configuration change and a reboot to take effect at the
  kernel level. The `apparmor_service` resource handles this via GRUB config and optional reboot.
- In Docker containers, AppArmor is managed by the host. GRUB configuration changes are skipped
  inside containers.
