use v5.20.1;
use warnings;
use strict;
use List::Util qw(min);

my $line = <>;
chomp($line);
my @keys;
my %cntCharacters = ();
#I have to initialize the frequency of all characters with 0.
for my $char (split('', $line)){
	$cntCharacters{$char}++;
	#print $cntCharacters{$char};
	@keys = keys %cntCharacters;	
}
print min(int($cntCharacters{'a'} / 2), int($cntCharacters{'b'}), int($cntCharacters{'B'}), 
	   int($cntCharacters{'l'}), int($cntCharacters{'s'}), int($cntCharacters{'r'}), 		   int($cntCharacters{'u'} / 2));

