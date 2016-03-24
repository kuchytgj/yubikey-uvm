#!/usr/bin/perl

my %CFG = ();

$CFG{TT2_ROOT} = ['/var/www/yubikey/templates/'];
$CFG{YK_STATUS} = '/usr/local/src/yubikey-uvm/yk-status';
$CFG{YK_PROG} = '/usr/local/src/yubikey-uvm/yk-program';
$CFG{ACCT_REGEX} = '^[a-z0-9\-]{3,8}$';

\%CFG;
