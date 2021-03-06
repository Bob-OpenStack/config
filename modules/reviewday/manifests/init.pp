# Copyright 2013 Hewlett-Packard Development Company, L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#
# Class: reviewday
#
class reviewday {
  if ! defined(Package['python-launchpadlib']) {
    package { 'python-launchpadlib':
      ensure => present,
    }
  }
  package { 'python-cheetah':
    ensure => present,
  }

  file {'/var/lib/reviewday':
    ensure  => directory,
    owner   => 'reviewday',
    group   => 'reviewday',
    mode    => '0755',
    require => User['reviewday'],
  }

  group { 'reviewday':
    ensure => present,
  }

  user { 'reviewday':
    ensure     => present,
    home       => '/var/lib/reviewday',
    shell      => '/bin/bash',
    gid        => 'reviewday',
    managehome => true,
    require    => Group['reviewday'],
  }

}

# vim:sw=2:ts=2:expandtab:textwidth=79
