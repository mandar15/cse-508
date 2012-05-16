#! /usr/bin/perl

use strict;
use warnings;

my @array;
my $i = 0;
my @row;
my $website;

system("rm DB.txt");

open INPUT, "db.csv";

@array = <INPUT>;

close INPUT;

open (MYFILE, '>>DB.txt');

for(my $j = 0; $j < 10; $j++ )
{

	@row = split(',', $array[$j]);

#	system("rm analysis.txt");

#	$website = "tcpdump -i wlan0 'tcp' > analysis.txt &";

#	system($website);

#	sleep(2);

#$website = "wget -O abc http://". $row[1]; #$ARGV[0]; 
#$website = "firefox ". substr($row[1], 0, length($row[1]) - 1). " &";
#print  $website;

#	$website = "wget -E -H -k -K -p ". $row[1]. " > /tmp/thrash" ;


	$website = "wget -E -H -k -K -p /dev/null http://www.". substr($row[1], 0, length($row[1]) - 1). " 2>&1 | grep \'Downloaded:\' | sed -e \'s|^.*(\\([0-9.]\\ + [KM]B/s\\))|\\1|\' 1> abc";

#	system("rm /tmp/thrash/*");

#	sleep(5);

#$website = "killall tcpdump firefox-bin";
#	$website = "killall tcpdump";

	system($website);

#	my @analysis;
	open INPUT, "db.csv";

	my @tmp = <INPUT>;

	close INPUT;

	print @tmp;

#	open INPUT, "analysis.txt";

#	@analysis = <INPUT>;

#	close INPUT;

#	my $min = 999;
#	my $max = -1;

#	for($i = 0; $i <= $#analysis; $i++)
#	{
#		my @entry = split(' ', $analysis[$i]);

#		if(exists($entry[0]))
#		{
#			my @time = split(':', $entry[0]);

#			if($time[2] < $min)
#			{
#				$min = $time[2]; 
#			}
#			elsif($time[2] > $max)
#			{
#				$max = $time[2];
#			}

#		}
#	}

#	my $diff = $max - $min;

#	print "T = ". $diff. "\n";

#	print MYFILE substr($row[1], 0, length($row[1]) - 1)." ".$diff."\n";

}

close (MYFILE);

