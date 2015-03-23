use warnings;
use diagnostics;

print "Try to guess my number.\n", "\n";

sub Setup {
	print "Tell me what you want the bottom number of the range to be.\n"; 
	chomp(our $bottom = <>);

	print "OK, now tell me what you want the top number of the range to be.\n";
	chomp(our $top = <>);

	print "Got it.\n";
	print "I have my number.  What's your first guess?\n";
	chomp (our $response = <>);

	$number = int(rand($top));
	Guess();
}

sub Guess {
	if ($response == $number) {
		print "You got it!  Want to play again? (\"Y\" or \"N\")\n";
		chomp (my $again = <>);
		if ($again eq 'Y') {
		Setup();	
		} else {
			print "Then goodbye.\n";
			exit();
		}
	} elsif ($response > $number) {
		print "Too high.  Guess again.\n";
		chomp ($response = <>);
		Guess();
	} else {
		print "Too low.  Guess again.\n";
		chomp ($response = <>);
		Guess();
	}
}

Setup();



