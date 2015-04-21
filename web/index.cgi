#!/usr/bin/perl -w

use strict;

#use lib '/usr/local/src/yubikey-uvm';

use YKApp;

my $ykapp = YKApp->new(
	PARAMS => { cfg_file => 'config.pl' }
);
$ykapp->run();
