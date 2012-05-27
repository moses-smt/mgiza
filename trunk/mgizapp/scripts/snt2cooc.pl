#!/usr/bin/perl -w

# sntcooc.perl output vcb1 vcb2 snt12 

use strict;
use File::Basename;
use FindBin qw($Bin);

sub systemCheck($);

my $out		= $ARGV[0];
my $vcb1	= $ARGV[1];
my $vcb2	= $ARGV[2];
my $snt12	= $ARGV[3];
my $sortArgs = "";

for (my $i = 4; $i < @ARGV; ++$i)
{
  my $arg = $ARGV[$i];
  if ($arg eq "-sort-buffer-size")
  {
		$sortArgs .= "-S " .$ARGV[++$i];
  }
  elsif ($arg eq "-sort-batch-size")
  {
	  $sortArgs .= "--batch-size " .$ARGV[++$i];
  }
  elsif ($arg eq "-sort-compress")
  {
	  $sortArgs .= "--compress-program " .$ARGV[++$i];
  }
}
					
my $SORT_EXEC = `gsort --help 2>/dev/null`; 
if($SORT_EXEC) {
  $SORT_EXEC = 'gsort';
}
else {
  $SORT_EXEC = 'sort';
}

my $TMPDIR=dirname($out);

my $cmd;
$cmd = "$Bin/snt2coocrmp $vcb1 $vcb2 $snt12 ";
$cmd .= "| $SORT_EXEC $sortArgs -T $TMPDIR -nk 1 -nk 2 | uniq > $out";
systemCheck($cmd);

#############################

sub systemCheck($)
{
  my $cmd = shift;
	print STDERR "Executing $cmd \n";
	
  my $retVal = system($cmd);
  if ($retVal != 0)
  {
    exit(1);
  }
}

