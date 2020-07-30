use v5.20.1;
use warnings;
use strict;

my $line = <>;
chomp($line);
my ($usb_pc, $ps2_pc, $usb_ps2_pc) = split(' ', $line);

$line = <>;
chomp($line);
my($n) = split(' ', $line);

my @usb;
my @ps2;

for (my $i = 0; $i < $n; $i++) {
	$line = <>;
	chomp($line);
	my ($price, $type) = split(' ', $line);
	if ($type eq "USB") {
		push(@usb, $price);
	}
	else {
		push(@ps2, $price);
	}
}
my @usb_sorted = sort {$a <=> $b} @usb;
my @ps2_sorted = sort {$a <=> $b} @ps2;

my $cnt_computers = 0;
my $total_price = 0;
my $i;
my $j;

for ($i = 0; $i < scalar @usb_sorted && $usb_pc > 0; $i++) {
	$cnt_computers++;
	$usb_pc--;
	$total_price += $usb_sorted[$i];
}

for ($j = 0; $j < scalar @ps2_sorted && $ps2_pc > 0; $j++) {
	$cnt_computers++;
	$ps2_pc--;
	$total_price += $ps2_sorted[$j];
}

while ($usb_ps2_pc > 0) {
	$usb_ps2_pc--;
	if ($i < scalar @usb_sorted && $usb_sorted[$i] <= $ps2_sorted[$j]){
		$cnt_computers++;
		$total_price += $usb_sorted[$i++];
		
	}
	elsif ($j < scalar @ps2_sorted) {
		$cnt_computers++;
		$total_price += $ps2_sorted[$j++];
		
	}
}
print "$cnt_computers  $total_price";

