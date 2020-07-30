use v5.20.1;
use warnings;
use strict;

my $line = <>;
chomp($line);
my ($n) = split(' ', $line);
$line = <>;
chomp($line);

my @values = split(' ', $line);
my $answer = 0;
my @currentValues = ();
my $nextPos = 0;
my $length = 0;

sub gcd {
	my ($a, $b) = @_;
	while ($b > 0) {
		my $r = $a % $b;
		$a = $b;
		$b = $r;
	}
	return $a;
}

sub canAdd {
	my ($element, @currentValues) = @_;
	for (my $nrElem = 0; $nrElem < @currentValues; $nrElem++) {
		if (gcd($element, $currentValues[$nrElem]) == 1) {
			return 0;
		}	
	}
	return 1;
}

sub findMaxLength {
	my $length = shift;
	my $nextPos = shift;
	my @currentValues = @_;
	print "lg = $length \n";
	
	if ($answer < $length) {
		$answer = $length;
	}
	if ($nextPos == $n) {
		return;
	}
	for (my $i = $nextPos; $i < $n; $i++) {
		if(canAdd($values[$i], @currentValues) == 1) {
			push(@currentValues, ($values[$i]));
			findMaxLength($length + 1, $i + 1, @currentValues);
			pop(@currentValues);
		}
		
	}
}

findMaxLength(0, 0, @currentValues);
print $answer;

