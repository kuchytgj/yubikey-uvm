package Errors;

require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(%ERR);

%ERR = (
	YK_NOERR => 0,
	YK_ERR => 1,
	YKERR_NODEV => 10,
	YKERR_MULDEV => 11,
	YKERR_NOUSER => 20,
);

1;
