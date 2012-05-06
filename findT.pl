#! /usr/bin/perl

use strict;
use warnings;

my @array;
my $i = 0;
my @row;
#my $website = $ARGV[0];

#open INPUT, "db.csv";

#@array = <INPUT>;

#close input;

#@row = split(',', $array[$i]);

#print $row[1];

#print "-------------------------------------------------------------------------------".$ARGV[0]."\n"; 

my $website = "tcpdump -i wlan0 'tcp' > analysis.txt &";

system($website);

$website = "wget -O abc http://".$ARGV[0]; #$row[1];

system($website);

$website = "killall tcpdump";

system($website);

my @analysis;
 
open INPUT, "analysis.txt";

@analysis = <INPUT>;

close input;

my %packets;
my $j;

for($j = 0; $j <= $#analysis; $j++)
{
	my @entry = split(' ', $analysis[$j]);
	if($entry[4] =~ "mandar*")
	{
		my $k = 0;
		
		while($k < $#entry && $entry[$k] ne "val" )
		{
			$k++;
		}
		$k++;
		
		my @time = split(':', $entry[0]);
		$packets{$entry[$k]} = $time[2];		
	}
	elsif($entry[2] =~ "mandar*")
	{

		my $k = 0;
		
		while($k < $#entry && $entry[$k] ne "ecr" )
		{
			$k++;
		}
		$k++;
		
		my @temp = split(']', $entry[$k]);
		if(exists($packets{$temp[0]}))
		{
				my @time = split(':', $entry[0]);
				my $new_entry = $packets{$temp[0]}." ".$time[2];
				$packets{$temp[0]} = $new_entry;		
		}
	}
}

my $key;
my $value;
my $count = 0;
my $sum = 0;

while (($key, $value) =each(%packets))
{
#	print $key." ".$value."\n";
	
	my @diff = split(' ', $value);	
	
	if($#diff  != 0)
	{
		$sum +=  $diff[$#diff] - $diff[0];
		$count++;
	}

#	print "T = ". $sum . " ". $count. "\n";	
}

print "T = ". ($sum/$count). "\n";

