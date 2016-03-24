UVM toolchain to manage YubiKeys within our Duo Security account

==Overview==
This project is for a web interface intended to be run on a small embedded or micro computer (i.e. CuBox, Raspberry Pi, etc). The web interface interacts with the local system via asynchronous HTTP calls to a CGI script that can read and write to the USB bus and therefore YubiKey devices.

==Requrements==
- Web Server included configs are for Apache but you can easily adapt to make whatever work as long as it supports Perl/CGI.
- A Duo Security account
- The following Perl modules:
	* CGI::Application::Plugin::AutoRunmode
	* CGI::Application::Plugin::ConfigAuto
	* CGI::Application::Plugin::TT
	* CGI
	* Config::Simple
	* Data::Dumper
	* Digest::HMAC_SHA1
	* Duo::API
	* Errors
	* File::Basename
	* Getopt::Long
	* JSON
	* LWP::UserAgent
	* MIME::Base64
	* POSIX  
- A working install of the yubico-c and yubico-personalization tools

==Using==
(1)

===Templates===

