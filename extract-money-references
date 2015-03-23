#use diagnostics;

############ extraction ##################

#to open for linux
open (my $data, "/home/mcapizzi/Google_Drive_Arizona/Programming/538/HW_3_corpus.txt") or die "Where is it?!?!";
#to open for windows
#open (my $data, "C:/Users/mcapizzi/Documents/Google_Drive_Arizona/Programming/538/HW_3_corpus.txt") or die "Where is it?!?!";

#US
my @number = ();
my @number_matches = ();
#Canadian
my @canadian_number = ();
my @canadian_matches = ();
#million
my @million = ();
my @million_matches = ();
#billion
my @billion = ();
my @billion_matches = ();
#trillion
my @trillion = (); 
my @trillion_matches = ();

while ($line = <$data>) {
#skips file information lines
	if ($line =~ /^[<@\/]/) {
		next;
	} else {
		$line =~ /C*\$\d+,*\d*\.*\d*/g;
##this line creates the problems!!!!
		if ($' =~ /[m|b|tr]illion/) {
			@million_matches = ($line =~ /\$\d+\.*\d* million/g);
			push (@million, @million_matches);
			@billion_matches = ($line =~ /\$\d+\.*\d* billion/g);
			push (@billion, @billion_matches);
			@trillion_matches = ($line =~ /\$\d+\.*\d* trillion/g);
			push (@trillion, @trillion_matches);
		} else {
			@number_matches = ($line =~ /\$\d+,*\d*\.*\d*/g);
			push (@number, @number_matches);
			@canadian_matches = ($line =~ /C\$\d+,*\d*\.*\d*/g);
			push (@canadian_number, @canadian_matches);
		}
	}	
}

close $data;

########## number  #####################

my @no_comma_number = ();

#strips comma
for (@number) {
	if ($_ =~ /,/) {
		$_ =~ s/(\d{0,3}),(\d{3}.*\d*)/$1$2/g;
		push (@no_comma_number, $_);
	} else {
		push (@no_comma_number, $_)
	}
}

#strips the dollar sign off for sorting
my @stripped_number = ();
for (@no_comma_number) {
	my $stripped = substr $_, 1;
	push (@stripped_number, $stripped);
}	

#sorts stripped array numerically
my @sorted_stripped_number = ();
@sorted_stripped_number = sort {$a <=> $b} @stripped_number;

############## Canadian number ###################

my @no_comma_canadian_number = ();

#strips comma
for (@canadian_number) {
	if ($_ =~ /,/) {
		$_ =~ s/(\d{0,3}),(\d{3}.*\d*)/$1$2/g;
		push (@no_comma_canadian_number, $_);
	} else {
		push (@no_comma_canadian_number, $_)
	}
}

#strips the dollar sign off for sorting
my @stripped_canadian_number = ();
for (@no_comma_canadian_number) {
	my $stripped = substr $_, 2;
	push (@stripped_canadian_number, $stripped);
}	

#print "@stripped_canadian_number\n";

#sorts stripped array numerically
my @sorted_stripped_canadian_number = ();
@sorted_stripped_canadian_number = sort {$a <=> $b} @stripped_canadian_number;

#print "@sorted_stripped_canadian_number\n";

#adds a C tag at end of number
my @tagged_canadian_number_dollars = ();
for (@sorted_stripped_canadian_number) {
	$_ =~ s/(.*)/$1C/;
	push (@tagged_canadian_number_dollars, $_)
}

##########US + Canadian#############
push (@sorted_stripped_number, @tagged_canadian_number_dollars);

@sorted_us_and_canadian = ();
@sorted_us_and_canadian = sort {$a <=> $b} @sorted_stripped_number;

#adds $ back to sorted array
my @final_number_dollars = ();
for (@sorted_us_and_canadian) {
	if ($_ =~ /C/) {
		my $stripped = substr $_, 0, -1;
		$stripped =~ s/(.*)/C\$$1/;
		push (@final_number_dollars, $stripped)
	} else {
		$_ =~ s/(.*)/\$$1/;
		push (@final_number_dollars, $_)
	}
}

########## million  #####################

#strips the dollar sign off for sorting
my @stripped_million = ();
for (@million) {
	my $stripped = substr $_, 1, -7;
	push (@stripped_million, $stripped);
}	

#sorts stripped array numerically
my @sorted_stripped_million = ();
@sorted_stripped_million = sort {$a <=> $b} @stripped_million;

#adds $ and "million" back to sorted array
my @final_million_dollars = ();
for (@sorted_stripped_million) {
	$_ =~ s/(.*)/\$$1million/;
	push (@final_million_dollars, $_);
}

################billion ####################

#strips the dollar sign off for sorting
my @stripped_billion = ();
for (@billion) {
	my $stripped = substr $_, 1, -7;
	push (@stripped_billion, $stripped);
}	

#sorts stripped array numerically
my @sorted_stripped_billion = ();
@sorted_stripped_billion = sort {$a <=> $b} @stripped_billion;

#adds $ and "billion" back to sorted array
my @final_billion_dollars = ();
for (@sorted_stripped_billion) {
	$_ =~ s/(.*)/\$$1billion/;
	push (@final_billion_dollars, $_);
}


################trillion ####################

#strips the dollar sign off for sorting
my @stripped_trillion = ();
for (@trillion) {
	my $stripped = substr $_, 1, -8;
	push (@stripped_trillion, $stripped);
}	

#sorts stripped array numerically
my @sorted_stripped_trillion = ();
@sorted_stripped_trillion = sort {$a <=> $b} @stripped_trillion;

#adds $ and "trillion" back to sorted array
my @final_trillion_dollars = ();
for (@sorted_stripped_trillion) {
	$_ =~ s/(.*)/\$$1trillion/;
	push (@final_trillion_dollars, $_);
}

################ put commas back in ##############

for (@final_number_dollars) {
	if ($_ =~ /\$\d{4,}.*/) {
		$_ =~ s/(C*\$.*)(\d{3})/$1,$2/g;
		push (@final_final_number_dollars, $_);
	} else {
		push (@final_final_number_dollars, $_);
	}
}

################final build of array

@total_sorted = ();

push (@total_sorted, @final_final_number_dollars);
push (@total_sorted, @final_million_dollars);
push (@total_sorted, @final_billion_dollars);
push (@total_sorted, @final_trillion_dollars);

sub median_total_sorted {
	$median_number = $#total_sorted / 2;
	if ($median_number =~ /\./) {
		$median_1 = int($median_number);
		$median_2 = $median_1 + 1;
		print "The median dollar amount is the average of $total_sorted[$median_1] and $total_sorted[$median_2].\n";
	} else {
		$median = $median_number;
		print "The median dollar amount is @total_sorted[$median].\n";
	}
}


#final outputs
print "There were $#total_sorted dollar instances in this corpus.\n";
my $manual_total = $#number + $#canadian_number + $#million + $#billion + $#trillion;
print "The manual total was $manual_total.\n";
print "The lowest dollar amount is $total_sorted[0].\n";
print "The highest dollar amount is $total_sorted[$#total_sorted].\n";
median_total_sorted;
print "\n";
print "Appendix:\n";
print "@total_sorted\n";
print "@number\n";
#print "@canadian_number\n";
#print "@million\n";
#print "@billion\n";
#print "@trillion\n";
