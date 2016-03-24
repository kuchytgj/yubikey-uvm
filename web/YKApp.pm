package YKApp;

use strict;


use base 'CGI::Application';
use CGI::Application::Plugin::AutoRunmode;
use CGI::Application::Plugin::ConfigAuto (qw/cfg/);
#use CGI::Application::Plugin::DBH (qw/dbh_config dbh/);
#use CGI::Application::Plugin::Session;
use CGI::Application::Plugin::TT;
use JSON;

use lib '../';
use Errors;

sub setup {
	my $self = shift;

	$self->tt_config(
		TEMPLATE_OPTIONS => {
			INCLUDE_PATH => $self->cfg('TT2_ROOT'),
		},
	);
}

sub process_template {
	my $self = shift;

	my $vars = shift;

	my $output;

	#print STDERR Dumper($vars);

	$output .= ${$self->tt_process('header.tmpl')};
	$output .= ${$self->tt_process('site_body.tmpl', $vars)};
	$output .= ${$self->tt_process('footer.tmpl')};

	return \$output
}

sub run_start : StartRunMode {
	my $self = shift;

	my $params = {};
	$params->{'acct_regex'} = $self->cfg('ACCT_REGEX');
	$params->{'rm_template'} = 'run_start.tmpl';

	return $self->process_template($params);
}

sub async_ykstatus : Runmode {
	my $self = shift;

	my $yk_status = $self->cfg('YK_STATUS');
	my $output = `$yk_status 2>&1`;
	my $rc = $? >> 8;
	chomp $output;

	return encode_json({'code' => $rc, 'mesg' => $output});
}

sub async_ykprog : Runmode {
	my $self = shift;
	my $query = $self->query();

	my $netid = $query->param('netid');
	
	unless ($netid =~ m/$self->cfg('ACCT_REGEX')/) {
		return encode_json({'code' => '-1', 'mesg' => 'Not a valid NetID'});
	}

	my $yk_prog = $self->cfg('YK_PROG');
	my $output = `sudo $yk_prog --netid $netid`;
	print STDERR $?;
	my $rc = $? >> 8;
	chomp $output;
	return encode_json({'code' => $rc, 'mesg' => $ERR_MSG{$rc}});
}

1;
