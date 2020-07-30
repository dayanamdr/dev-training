use v5.20.1;
use warnings;
use strict;

my $line = <>;
chomp($line);
my ($n, $k) = split(' ', $line);

my @divisors;

my $answer = -1;
my $j = -1;

for (my $i = 1; ($i * $i) <= $n; $i++) {
	if ($n % $i == 0) {
		$divisors[++$j] = $i; 
		if ($i * $i < $n) {
			$divisors[++$j] = ($n / $i);
		}
	}	
}

my @sortedDivisors = sort {$a <=> $b} @divisors;

if ($k - 1 > $j) {
	print -1;
}
else {
	print $sortedDivisors[$k - 1];
}

