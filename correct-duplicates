
#### open file for reading ####

#to open for linux
open (my $data, "/home/mcapizzi/Google_Drive_Arizona/Programming/538/HW_2_data.txt") or die "Can't open!";
#to open for windows
#open (my $data, "C:/Users/mcapizzi/Documents/Google_Drive_Arizona/Programming/538/HW_2_data.txt") or die "Can't open!";

while ($line = <$data>) {
#split line into tokenized array
	@tokenized_array = split(" ", $line);
#count number of words in sentence using $index++
	my $index = 0;
	for (@tokenized_array) {
		$index++;
	}
#sets variables for reference later
	$sentence_number = $.;
	$word_count = $index - 1;
#for each word in the sentence
	for my $i (1..$word_count) {
#if the word is the same as the word before, move on to next word
		if (lc($tokenized_array[$i]) eq lc($tokenized_array[$i - 1])) {
			next;
#if word is not the same as the word before, look if it matches the next word
		} elsif (lc($tokenized_array[$i]) eq lc($tokenized_array[$i + 1])) {
			$word_to_test = $tokenized_array[$i];
			my $repeat_count = 1;
#for loop to count repetitions of the word
			for $j ($i..$word_count) {
				if (lc($word_to_test) eq lc($tokenized_array[$j + 1])) {
					$repeat_count++;
				} 
			}
#if/then to deal with 1 time v. 2+ times
			if ($repeat_count == 1) {
				print "Line $sentence_number\: word $i, \"$tokenized_array[$i]\" repeated $repeat_count time.\n";
			} else {
				print "Line $sentence_number\: word $i, \"$tokenized_array[$i]\" repeated $repeat_count times.\n";
			}
		}
	}

#### corrects file for overwriting ####

#finds doubles and replaces with single
#using lc() doesn't work
#	$lowercase_line = lc($line);
#	$lowercase_line =~ s/(\b\w+\b)(\s\1)+/\1/g;
	$line =~ s/(\b\w+\b)(\s\1)+/\1/g;


#for linux
	open (my $corrected_data, ">>", "/home/mcapizzi/Google_Drive_Arizona/Programming/538/HW_2_corrected_data.txt") or die "Can't create!";
#for windows
#	open (my $corrected_data, ">>", "C:/Users/mcapizzi/Documents/Google_Drive_Arizona/Programming/538/HW_2_corrected_data.txt") or die "Can't create!";
	print $corrected_data $line;
}

close $data;
close $corrected_data;
