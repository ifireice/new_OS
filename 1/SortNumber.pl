#!/usr/bin/perl

if ($#ARGV==-1){print "Bad parametr's";}

for  $i (0..$#ARGV-1)
{
	open ( file, "< @ARGV[$i]") or die "cannot open  @ARGV[$i]"; 		
	$msg="";
		while (<file>)
		{
			if ($_=~/^[\d\s]+/s){$msg.=$_;}
  			else
				{
					$msg="";
					last;
				}		
		}
	$res.=$msg;
	close @ARGV[$i];
}

@res = split (" " , $res);

$answer = @ARGV[$#ARGV];

open (FFF, "> $answer");
	@sort = sort { $a <=> $b } @res;
	print  ( FFF join (' ',@sort)); 
close FFF;
