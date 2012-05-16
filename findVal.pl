#! /usr/bin/perl

use strict;
use warnings;

open INPUT, "DB.txt";

my @array = <INPUT>;

close INPUT;

my %website;
my $i = 0;

for(; $i < $#array; $i++)
{
		my @arr = split(' ', $array[$i]);
	
		$website{$arr[0]} = $arr[1];
}

my $args = $ARGV[0];
my $ret = 2;

if(exists($website{$args}))
{
		$ret =	$website{$args};
}

print "T = ". $ret. "\n";

