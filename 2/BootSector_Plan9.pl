#! /usr/bin/perl

if ($#ARGV==-1){print "Bad arguments"; exit;}
$output=0;
$input = $ARGV[0];
#$output = $ARGV[1];
$str;
$count;

open (file, "<$input") or die "cannot open $input";
binmode file;
if ((read file, $str, 510)!=510){print "Error\n";}

while ((read file, $_, 1 )== 1 )
	{	
		$_=unpack "H2", $_;
		if ($_ eq "55")
		{
			if ((read file, $_, 1)!=1){print "!!!\n";}
			$_=unpack "H2", $_;
			if ($_ eq "aa")
			{
				$count++;
				open (fff, "> $output")or die "cannot open $output";
				$output ++;
				binmode fff;	
				if ((seek file, -512, 1)!=1){print "Bad position\n";}
				if ((read file,$str, 512)!=512){print "Failed to read\n";}
				print (fff $str);
				close fff;	
			}
		}
	}
close file;
if (!$count) {print " The boot sector is no seach\n";}
