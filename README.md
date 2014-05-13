## Description

This is the collectd client package that can be used with graphite for OS system monitoring.


## Requirements

### Platforms

* Linux OS (Ubuntu/CentOS/RHEL)

### Cookbooks

* build-essential
* yum

## Attributes

## Recipes

## Example

1-Create collectd-client.rb file (example included)

name "collectd-client"
description "This is the collectd client role attributes"
run_list "recipe[ntp]", "recipe[motd]", "recipe[hostsfile]", "recipe[collectd]", ["recipe[collectd::attribute_driven]"]
default_attributes(
  "collectd" => {
    "plugins" => {
      "syslog" => {
        "config" => { "LogLevel" => "Info" }
      },
      "disk"      => { },
      "swap"      => { },
      "memory"    => { },
      "cpu"       => { },
      "interface" => {
        "config" => { "Interface" => "lo", "IgnoreSelected" => true }
      },
      "df"        => {
        "config" => {
          "ReportReserved" => false,
          "FSType" => [ "proc", "sysfs", "fusectl", "debugfs", "devtmpfs", "devpts", "tmpfs" ],
          "IgnoreSelected" => true
        }
      },
      "write_graphite" => {
        "config" => {
          "Prefix" => "servers."
        }
      }
    }
  }
)

2-Create the role

knife role from file collectd-client.rb

3-Assign the role to the node


{
  "name": "NODE",
  "chef_environment": "lab",
  "normal": {
    "tags": [

    ]
  },
  "run_list": [
    "role[collectd-client]"
  ]
}


