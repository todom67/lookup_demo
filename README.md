# lookup_demo

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with lookup_demo](#setup)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This is a contrived module to demo dat lookup functionality for data contained within a module.

This module is inspired by the article [Native Puppet 4 Data in Modules](https://www.devco.net/archives/2016/01/08/native-puppet-4-data-in-modules.php). With the release of puppet 4.3. We now have the ability to use "native" data in modules. What this means for us is that we now can decouple module specific data from its underlying code in a module resident lookup structure much in the same way we decouple company specific data in the environmental lookup structure.

What does that mean? It means replacing the Params.pp class with mini lookup hierarchy *within the module*

## Setup

Clone the module to a machine that has puppet installed.

## Usage

To see the output of the lookup_demo class wwith all defaults, either include the class or call it with no parameters specified:

```puppet
  include ::lookup_demo
  #    or
  class{ 'lookup_demo': }
```

switch to the directory into which you have cloned the repository, then execute the follwing command:

```bash
  puppet apply --modulepath ./ lookup_demo/examples/init.pp
```

on a MacBook, the output is similar to this:

```bash
 ➜  my_modules puppet apply --modulepath ./ lookup_demo/examples/init.pp
    Notice: Compiled catalog for chic02v35j2htd8.grubhub.local in environment production in 0.20 seconds
    Notice:  The explicit lookup: This is an explicit lookup NOT explicit language!
    Notice: /Stage[main]/Lookup_demo/Notify[ The explicit lookup: This is an explicit lookup NOT explicit language!]/message: defined 'message' as ' The explicit lookup: This is an explicit lookup NOT explicit language!'
    Notice:  The os family fact: 'Darwin' lookup value: 'OS family, not to be confused with awards of the same name'
    Notice: /Stage[main]/Lookup_demo/Notify[ The os family fact: 'Darwin' lookup value: 'OS family, not to be confused with awards of the same name']/message: defined 'message' as ' The os family fact: 'Darwin' lookup value: 'OS family, not to be confused with awards of the same name''
    Notice:  From common: WE ALL LIVE IN A YELLOW SUBMARINE
    Notice: /Stage[main]/Lookup_demo/Notify[ From common: WE ALL LIVE IN A YELLOW SUBMARINE]/message: defined 'message' as ' From common: WE ALL LIVE IN A YELLOW SUBMARINE'
    Notice: Applied catalog in 0.02 seconds
```

And on Centos:

```bash
  Notice: Compiled catalog for centos002.grubhub.local in environment production in 0.10 seconds
  Notice:  The explicit lookup: This is an explicit lookup from COMMON rather than OS family...
  Notice: /Stage[main]/Lookup_demo/Notify[ The explicit lookup: This is an explicit lookup from COMMON rather than OS family...]/message: defined 'message' as ' The explicit lookup: This is an explicit lookup from COMMON rather than OS family...'
  Notice:  The os family fact: 'RedHat' lookup value: 'Chapeau rouge'
  Notice: /Stage[main]/Lookup_demo/Notify[ The os family fact: 'RedHat' lookup value: 'Chapeau rouge']/message: defined 'message' as ' The os family fact: 'RedHat' lookup value: 'Chapeau rouge''
  Notice:  From common: WE ALL LIVE IN A YELLOW SUBMARINE
  Notice: /Stage[main]/Lookup_demo/Notify[ From common: WE ALL LIVE IN A YELLOW SUBMARINE]/message: defined 'message' as ' From common: WE ALL LIVE IN A YELLOW SUBMARINE'
  Notice: Applied catalog in 0.02 seconds
```

Override the everyone_setting:

```puppet
  class{ 'lookup_demo':
    everyone_setting => 'I am overriding the default everyone_setting!',
  }
```

```bash
  Notice: Compiled catalog for centos002.grubhub.local in environment production in 0.10 seconds
  Notice:  The explicit lookup: This is an explicit lookup from COMMON rather than OS family...
  Notice: /Stage[main]/Lookup_demo/Notify[ The explicit lookup: This is an explicit lookup from COMMON rather than OS family...]/message: defined 'message' as ' The explicit lookup: This is an explicit lookup from COMMON rather than OS family...'
  Notice:  The os family fact: 'RedHat' lookup value: 'Chapeau rouge'
  Notice: /Stage[main]/Lookup_demo/Notify[ The os family fact: 'RedHat' lookup value: 'Chapeau rouge']/message: defined 'message' as ' The os family fact: 'RedHat' lookup value: 'Chapeau rouge''
  Notice:  From common: I am overriding the default everyone_setting!
  Notice: /Stage[main]/Lookup_demo/Notify[ From common: I am overriding the default everyone_setting!]/message: defined 'message' as ' From common: I am overriding the default everyone_setting!'

```

## Reference

There are no types and providers or any of that other jazz. This is simply a config of how to use in module hieradata.

## Limitations

This has been tested on MacOS, Centos, and Debian with Puppet 4.10.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.
