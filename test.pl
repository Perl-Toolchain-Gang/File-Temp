
# Test for File::Temp

use File::Spec;
use File::Temp qw/ :POSIX :mktemp tempfile tempdir/;

# Use STANDARD for testing since stickyness does not work on NT
# Neither does _PC_CHOWN_RESTRICTED
# File::Temp->safe_level( File::Temp::MEDIUM );

($fh, $tempfile) = tempfile(
#			    DIR => '/var/tmp/',
			    UNLINK => 1,
			    SUFFIX => '.dat',
			   );

# TEMPDIR test

$tempdir = tempdir( 'tmpdirXXXXXX' ,
		    CLEANUP => 1,
		    TMPDIR => 1,
		    UNLINK => 1,
		  );

print "TEMPDIR: $tempdir\n";

($fh, $tempfile) = tempfile(
			    DIR => $tempdir,
			    UNLINK => 1,
			    SUFFIX => '.dat',
			   );

print "TEMPFILE: Created $tempfile\n";

# Test tempfile

($fh, $tempfile) = tempfile(
			    DIR => $tempdir,
			   );

print "TEMPFILE: Created $tempfile\n";


($fh, $tempfile) = tempfile( 'helloXXXXXXX',
			    DIR => $tempdir,
			    UNLINK => 1,
			    SUFFIX => '.dat',
			   );

print "TEMPFILE: Created $tempfile\n";


# MKSTEMP - test

$template = File::Spec->catfile(File::Spec->tmpdir, 'wowserXXXX');

($fh, $template) = mkstemp($template);

print "MKSTEMP: FH is $fh File is $template fileno=".fileno($fh)."\n";

print $fh "woohoo";

close ($fh) or die "Oops with MkStemp\n";

print "MKSTEMP Closed $template okay\n";

unlink $template;  # Dont bother testing return value

# MKSTEMPS

$template = "suffixXXXXXX";
$suffix = ".dat";

($fh, $fname) = mkstemps($template, $suffix);

print "MKSTEMPS: FH is $fh File is $template -> $fname fileno=".fileno($fh)."\n";

print $fh "woohoo";

close($fh) or die "Error closing file $!\n"; 

unlink $fname; # dont test return value

# MKDTEMP

$template = File::Spec->catdir(File::Spec->tmpdir, 'tmpdirXXXXXX');

$tmpdir = mkdtemp($template);

print "MKDTEMP: Name is $tmpdir from template $template\n";


# MKTEMP

$template = File::Spec->catfile(File::Spec->tmpdir, 'mytestXXXXXX');

$tmpfile = mktemp($template);

print "MKTEMP: Tempfile is $template -> $tmpfile\n";

# TMPNAM - scalar

print "TMPNAM: in a scalar context: ";
$tmpnam = tmpnam();
print $tmpnam . "\n";

# TMPNAM array context

($fh, $tmpnam) = tmpnam();

print "TMPNAM: in array context: $fh $tmpnam\n";


# TMPFILE
# Currently fails on NT since it can't unlink an open file

$fh = tmpfile();

print "TMPFILE: got $fh with fileno :" . fileno($fh) . "\n";

# TMPFILE - test that it is read-writable

print "TMPFILE: TESTING TEMP TMPFILE\n";

$fh = tmpfile();

print "TMPFILE: tmpfile got FH $fh\n";

# print something to it
print "TMPFILE: Wrote line: Hello a test\n";
print $fh "Hello a test\n"
  or die "Error printing to tempfile\n";

# rewind it
seek($fh,0,0)
  or die "Unable to rewind filehandle\n";

# Read from it
my $line = <$fh>;

print "TMPFILE: Read line: $line\n";

close($fh);

 



# TEMPNAM

$fname = File::Temp::tempnam( File::Spec->tmpdir , "testing");

print "TEMPNAM: fname is $fname\n";

