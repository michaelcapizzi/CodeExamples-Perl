use warnings;
use diagnostics;

sub Setup {
	print "Tell me what you want the bottom number of the range to be.\n"; 
	chomp(our $bottom = <>);

	print "OK, now tell me what you want the top number of the range to be.\n";
	chomp(our $top = <>);

	print "Got it.\n";
	print "I'll guess a number, and you tell me if your number is higher (H) or lower (L) or correct (C).\n", "\n";

	our $prediction = $top;
	our $counter = 0;

	while ($prediction > int(1)) {
		$prediction = $prediction / 2;
		$counter ++;
	}

	print "I bet I can guess you number in $counter guesses.\n";
}

sub Guess {
	my $guess = int((($top - $bottom)/2) + $bottom);
	
	print "Is you number $guess? (H, L, or C)\n";
	chomp (my $response = <>);
	
	if ($response eq 'C') {
		$game_counter ++;
		print "Damn, I'm good.\n";
#this didn't work until I had == instead of just =
		if ($game_counter == $counter) {
			print "And it took $game_counter guesses.  Just as I predicted.\n";

		} elsif ($game_counter < $counter) {
			print "And it took only $game_counter guesses, which is even faster than I predicted.\n";
		
		} else {
			my $actual = $game_counter - $counter;
			print "But not as good as I predicted because it took me $actual guesses more than I thought it would.\n";
		}
		
		exit();
	}

	elsif ($response eq 'H') {
		$bottom = $guess;
		$game_counter ++;
		Guess();
	}

	elsif ($response eq 'L') {
		$top = $guess;
		$game_counter ++;
		Guess();
	} 

	else {
		print "I don't understand.  Please choose \"H, L, or C\"\n";
		Guess();
	}
}

print "I can guess your number.\n";

Setup();

my $counter = 0;

Guess();

