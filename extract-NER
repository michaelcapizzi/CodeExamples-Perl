#use diagnostics;

#to open for linux
open (my $data, "/home/mcapizzi/Google_Drive_Arizona/Programming/538/HW_4_corpus.txt") or die "Where is it?!?!";
#to open for windows
#open (my $data, "C:/Users/mcapizzi/Documents/Google_Drive_Arizona/Programming/538/HW_4_corpus.txt") or die "Where is it?!?!";

my $intext = 0;

#create hash to capture matches
my %entities = ();

#create counters
my $person_count = 0;
my $organization_count = 0;
my $location_count = 0;
my $misc_count = 0;

while ($line = <$data>) {
#clears whitespace
$line =~ s/^\s+//;
#skips file information lines
	if ($line =~ /^<TEXT>/) {
		$intext = 1
	} elsif ($line =~ m!^</TEXT>!) {
		$intext = 0;
	} elsif ($intext) {
#while loop will allow for multiple matches in a line
#max regex to catch all Named Entities (catches 463 without stop word filter)
		while ($line =~ /(([A-Z][A-z]+[-\d\.]*)( ((and|&amp;|of|[A-Z].) )*[0-9A-Z][A-z]*)*)/g) {
#store $#s in new variables
			my $entire = $1;
			my $first_word = $2;
			my $rest = $3;
#regex to filter "stop words" at beginning of sentence (reduces catches to 365)
			unless ($first_word =~ /(The|An+|On|In|At|Under|Before|After|Among|When|What|Who|With|Besides|Without|Neither|Although|Even|All|But|Nevertheless|However|Moreover|Yet|For|From|This|That|It|There|He|She|They)/) {
#regexes for PER
	#catches titles
				if ($first_word =~ /(Mr\.|Mayor|Governor|Sen.*|Messrs\.|Judge|Miss|Ms\.|Mrs\.|Rev\.|Dr\.)/g) {
	#clears whitespace after title
					$rest =~ s/ //g;
					unless (exists $entities{$rest}) {
						$entities{$rest} = PER;
						$person_count ++;
					}
	#catches middle initials
				} elsif ($rest =~ /[A-Z]\./) {
					unless (exists $entities{$rest}) {
						$entities{$rest} = PER;
						$person_count ++;
					}
	#catches Jr. Sr. III etc.
				} elsif ($rest =~ /(Jr|Sr|I+)/g) {
					unless (exists $entities{$entire}) { 
						$entities{$entire} = PER;
						$person_count++;
					}
	#catches job titles
				} elsif ($' =~ /^(, (vice|director|president|chair|spokes))/) {
					unless (exists $entities{$entire}) { 
						$entities{$entire} = PER;
						$person_count++;
					}
#regexes for ORG
	#catches features in name
				} elsif ($entire =~ /(Ins|ity|Co|&amp;|Res|ion|LTD|stry|Ltd|Inc)/g) {
					unless (exists $entities{$entire}) { 
						$entities{$entire} = ORG;
						$organization_count++;
					}
	#catches said (since PER has already been resolved)
				} elsif ($' =~ /^( said)/ or $` =~ /(said )$/) {
					unless (exists $entities{$entire}) { 
						$entities{$entire} = ORG;   
						$organization_count++;
					}
	#catches signs of a job title before match
				} elsif ($` =~ /((chair|director|spokes|president) (of|for) )$/g) {
					unless (exists $entities{$entire}) { 
						$entities{$entire} = ORG;
						$organization_count++;
					}
#regexes for LOC
	#catches "in" before match
				} elsif ($` =~ /(in )$/) {
					unless (exists $entities{$entire}) { 
						unless ($entire =~ /(January|February|March|April|May|June|July|August|September|October|November|December)/) {
							$entities{$entire} = LOC;   
							$location_count++;
						}
					}
#everything else is MISC
				} else {
					unless (exists $entities{$entire}) { 
						$entities{$entire} = MISC;
						$misc_count++;
					}
				}
			}
		}
	}
}

#print output

print "\n";

print "There were a total of "; print scalar keys %entities ; print " entity matches","\n","\n";
print "There were $person_count PER matches:\n";
for (keys %entities) {
	if ($entities{$_} eq "PER") {
		print "<$_> ";
	}
}
print "\n","\n";

print "There were $organization_count ORG matches:\n";
for (keys %entities) {
	if ($entities{$_} eq "ORG") {
		print "<$_> ";
	}
}
print "\n","\n";
print "There were $location_count LOC matches:\n";
for (keys %entities) {
	if ($entities{$_} eq "LOC") {
		print "<$_> ";
	}
}
print "\n","\n";
print "There were $misc_count MISC matches:\n";
for (keys %entities) {
	if ($entities{$_} eq "MISC") {
		print "<$_> ";
	}
}

print "\n";
