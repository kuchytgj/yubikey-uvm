package Errors;

require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(%ERR_SYM %ERR_MSG);

%ERROR_MAP = (
	0 => {'symbol' => 'YK_NOERR', 'message' => 'Success'},
	1 => {'symbol' => 'YK_ERR', 'message' => 'Generic YubiKey failure'},
	10 => {'symbol' => 'YKERR_NODEV', 'message' => 'No YubiKey device present'},
	11 => {'symbol' => 'YKERR_MULDEV', 'message' => 'Multiple YubiKey devices present'},
	20 => {'symbol' => 'YKERR_NOUSER', 'message' => 'Invalid user'},
	30 => {'symbol' => 'YKERR_DUO', 'message' => 'Generic Duo Security failure'},
	31 => {'symbol' => 'YKERR_DUODUP', 'message' => 'A token with this serial number already exists in Duo Security'},
);

%ERR_SYM = ();
%ERR_MSG = ();

foreach my $KEY (keys(%ERROR_MAP)) {
	my $symbol = $ERROR_MAP{$KEY}{'symbol'};
	my $message = $ERROR_MAP{$KEY}{'message'};

	$ERR_SYM{$symbol} = $KEY;
	$ERR_MSG{$KEY} = $message;
}
#%ERR = (
#	YK_NOERR => 0,
#	YK_ERR => 1,
#	YKERR_NODEV => 10,
#	YKERR_MULDEV => 11,
#	YKERR_NOUSER => 20,
#	YKERR_DUO => 30,
#	YKERR_DUODUP => 31,
#);

1;
