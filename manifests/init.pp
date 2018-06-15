# Class: lookup_demo
# ===========================
#
# Full description of class lookup_demo here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `family parameter`
# "A class parameter that is keyed to facts.os.family and will default to the 
# corresponding local hiera data lookup"
#
# * `everyone_setting parameter`
# "Another class parameter that, if not set will default to value in common.yaml"
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `mylookup`
# "This variable is used to demonstrate specifically calling the lookup function. In
# this use case, there is a 'lookup_demo::explicit' key in both data/os/Darwin.yaml and 
# data/common.yaml to demonstrate the lookup falling through the hierarchy"
#
# Examples
# --------
#
# @example
#    include ::lookup_demo
#    or
#    class{ 'lookup_demo': }
#" Includes the class with all default values ascertained from hiera."
#
# @example
#    class{ 'lookup_demo': 
#      everyone_setting => 'I am overriding the default everyone_setting!', 
#    }
#
# Authors
# -------
#
# Timothy Odom <todom@grubhub.com>
#
# Copyright
# ---------
#
# Copyright 2018 Timothy Odom.
#
class lookup_demo(
  $family,
  $everyone_setting,
) {
  $mylookup = lookup(lookup_demo::explicit)
  notify { " The explicit lookup: ${mylookup}":}
  notify { " The os family fact: '${facts[os][family]}' lookup value: '${family}'":}
  notify { " From common: ${everyone_setting}":}
}
