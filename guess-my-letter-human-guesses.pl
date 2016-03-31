use warnings;
use diagnostics;

print "Try to guess my letter.\n", "\n";

sub Setup {
	print "I have my lower case letter.  What's your first guess?\n";
	chomp (our $response = <>);
#chooses letter
	my @letters = ('a'..'z');
	$letter = @letters[int(rand(@letters))];
	Guess();
}

sub Guess {
	if ($response eq $letter) {
		print "You got it!  Want to play again? (\"Y\" or \"N\")\n";
		chomp (my $again = <>);
		if ($again eq 'Y') {
		Setup();	
		} else {
			print "Then goodbye.\n";
			exit();
		}
	} 
	elsif ($response gt $letter) {
		print "Nope.  Pick a letter earlier in the alphabet.\n";
		chomp ($response = <>);
		Guess();
	} 
	else {
		print "Nope.  Pick a letter later in the alphabet.\n";
		chomp ($response = <>);
		Guess();
	}
}

Setup();



