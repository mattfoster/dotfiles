#! /usr/bin/env perl

use warnings;
use strict;

use YAML::XS;

YAML::XS::LoadFile( $ARGV[0] );
