# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Customize the firmware. Uncomment all or parts of the following
# to add files to the root filesystem or modify the firmware
# archive.

# config :nerves, :firmware,
#   rootfs_overlay: "rootfs_overlay",
#   fwup_conf: "config/fwup.conf"

# Use shoehorn to start the main application. See the shoehorn
# docs for separating out critical OTP applications such as those
# involved with firmware updates.
config :shoehorn,
  init: [
    :asn1,
    :public_key,
    :ssh,
    :nerves_firmware_ssh,
    :elixir_ale,
    :nerves_runtime,
    :runtime_tools,
    :nerves_network
  ],
  app: Mix.Project.config()[:app]

key_mgmt = System.get_env("NERVES_NETWORK_KEY_MGMT") || "WPA-PSK"

config :nerves_network, :default,
  wlan0: [
    ssid: "SFR_3410",
    psk: "bonsestillan4yleyele",
    key_mgmt: String.to_atom(key_mgmt)
  ]

config :nerves_firmware_ssh,
  authorized_keys: [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCadM7UxWocBoSoNtgVDEC7N9Q5B3Ku5rrNcB6jZ3P13NVY64b5j2dQh60nVJuzWWes1L07Q953ug/yx+g5V0FAcjY4Dxak6axRGOEzbMSRMRX1fMO8JdLRNfj8qUprPa2jZAssRD3Ys6q4B17BV+7SIjutUgIuIO4EKVKrqgFY5teesi7okbwjQOe8moZMksJxGRgHPV0c0Ck4VYIkX4qFfiWQCWv31CDgMAvNPM6L5/UcBJfdteLXSmX1ms4xteT9oPDlKp5vfhjOeUjfTJyklMtlplUrUehH6jH7F0Qb964+t/rhtGR9AVMm9vza+2EF0IuabodQRLdBFyHpTLqd nico@Nicolass-MBP"
  ]

# Import target specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# Uncomment to use target specific configurations

# import_config "#{Mix.Project.config[:target]}.exs"
