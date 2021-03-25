# Exercise solutions

>![info](../images/info.svg) Exercise related files are available from [exercises folder of learn_ruby_oneliners repo](https://github.com/learnbyexample/learn_ruby_oneliners/tree/master/exercises).

<br>

# One-liner introduction

**a)** For the input file `ip.txt`, display all lines containing `is`.

```bash
$ cat ip.txt
Hello World
How are you
This game is good
Today is sunny
12345
You are funny

$ ruby -ne 'print if /is/' ip.txt
This game is good
Today is sunny
```

**b)** For the input file `ip.txt`, display first field of lines *not* containing `y`. Consider space as the field separator for this file.

```bash
$ ruby -ane 'puts $F[0] if !/y/' ip.txt
Hello
This
12345
```

**c)** For the input file `ip.txt`, display all lines containing no more than 2 fields.

```bash
$ ruby -ane 'print if $F.size < 3' ip.txt
Hello World
12345
```

**d)** For the input file `ip.txt`, display all lines containing `is` in the second field.

```bash
$ ruby -ane 'print if $F[1] =~ /is/' ip.txt
Today is sunny
```

**e)** For each line of the input file `ip.txt`, replace first occurrence of `o` with `0`.

```bash
$ ruby -pe 'sub(/o/, "0")' ip.txt
Hell0 World
H0w are you
This game is g0od
T0day is sunny
12345
Y0u are funny
```

**f)** For the input file `table.txt`, calculate and display the product of numbers in the last field of each line. Consider space as the field separator for this file.

```bash
$ cat table.txt
brown bread mat hair 42
blue cake mug shirt -7
yellow banana window shoes 3.14

$ ruby -ane 'BEGIN{p = 1}; p *= $F[-1].to_f; END{puts p}' table.txt
-923.1600000000001
```

**g)** Append `.` to all the input lines for the given `stdin` data.

```bash
$ printf 'last\nappend\nstop\n' | ruby -pe 'sub(/$/, ".")'
last.
append.
stop.
```

**h)** Use contents of `s` variable to display all matching lines from the input file `ip.txt`. Assume that `s` doesn't have any regexp metacharacters. Construct the solution such that there's at least one word character immediately preceding the contents of `s` variable.

```bash
$ s='is'

$ r="$s" ruby -ne 'print if /\B#{ENV["r"]}/' ip.txt
This game is good
```

**i)** Use `system` to display contents of filename present in second field (space separated) of the given input line.

```bash
$ s='report.log ip.txt sorted.txt'
$ echo "$s" | ruby -ane 'system("cat #{$F[1]}")'
Hello World
How are you
This game is good
Today is sunny
12345
You are funny

$ s='power.txt table.txt'
$ echo "$s" | ruby -ane 'system("cat #{$F[1]}")'
brown bread mat hair 42
blue cake mug shirt -7
yellow banana window shoes 3.14
```

<br>

# Line processing

**a)** Remove only the third line of given input.

```bash
$ # can also use: ruby -ne 'print if $. != 3'
$ seq 34 37 | ruby -pe 'next if $. == 3'
34
35
37
```

**b)** Display only fourth, fifth, sixth and seventh lines for the given input.

```bash
$ seq 65 78 | ruby -ne 'print if 4..7'
68
69
70
71
```

**c)** For the input file `ip.txt`, replace all occurrences of `are` with `are not` and `is` with `is not` only from line number **4** till end of file. Also, only the lines that were changed should be displayed in the output.

```bash
$ cat ip.txt
Hello World
How are you
This game is good
Today is sunny
12345
You are funny

$ ruby -ne 'print if $. >= 4 && $_.gsub!(/are|is/, "\\0 not")' ip.txt
Today is not sunny
You are not funny
```

**d)** For the given `stdin`, display only the first three lines. Avoid processing lines that are not relevant.

```bash
$ seq 14 25 | ruby -pe 'exit if $. > 3'
14
15
16
```

**e)** For the input file `ip.txt`, display all lines from start of the file till the first occurrence of `game`.

```bash
$ ruby -ne 'print; exit if /game/' ip.txt
Hello World
How are you
This game is good
```

**f)** For the input file `ip.txt`, display all lines that contain `is` but not `good`.

```bash
$ ruby -ne 'print if /is/ && !/good/' ip.txt
Today is sunny
```

**g)** For the input file `ip.txt`, extract the word before the whole word `is` as well as the word after it. If such a match is found, display the two words around `is` in reversed order. For example, `hi;1 is--234 bye` should be converted to `234:1`. Assume that whole word `is` will not be present more than once in a single line.

```bash
$ ruby -ne 'puts "#{$2}:#{$1}" if /(\w+)\W+is\W+(\w+)/' ip.txt
good:game
sunny:Today
```

**h)** For the given input string, replace `0xA0` with `0x7F` and `0xC0` with `0x1F`.

```bash
$ s='start address: 0xA0, func1 address: 0xC0'

$ echo "$s" | ruby -ne 'print gsub(/0xA0/, "0x7F").gsub(/0xC0/, "0x1F")'
start address: 0x7F, func1 address: 0x1F
```

**i)** For the input file `text.txt`, replace all occurrences of `in` with `an` and write back the changes to `text.txt` itself. The original contents should get saved to `text.txt.orig`

```bash
$ cat text.txt
can ran want plant
tin fin fit mine line
$ ruby -i.orig -pe 'gsub(/in/, "an")' text.txt

$ cat text.txt
can ran want plant
tan fan fit mane lane
$ cat text.txt.orig
can ran want plant
tin fin fit mine line
```

**j)** For the input file `text.txt`, replace all occurrences of `an` with `in` and write back the changes to `text.txt` itself. Do not create backups for this exercise. Note that you should have solved the previous exercise before starting this one.

```bash
$ cat text.txt
can ran want plant
tan fan fit mane lane
$ ruby -i -pe 'gsub(/an/, "in")' text.txt

$ cat text.txt
cin rin wint plint
tin fin fit mine line
$ diff text.txt text.txt.orig
1c1
< cin rin wint plint
---
> can ran want plant
```

**k)** Find the starting index of first occurrence of `is` or `the` or `was` or `to` for each input line of the file `idx.txt`. Assume all input lines will match at least one of these terms.

```bash
$ cat idx.txt
match after the last newline character
and then you want to test
this is good bye then
you were there to see?

$ ruby -ne 'puts $_.index(/is|the|was|to/)' idx.txt
12
4
2
9
```

**l)** Display all lines containing `[4]*` for the given `stdin` data.

```bash
$ printf '2.3/[4]*6\n2[4]5\n5.3-[4]*9\n' | ruby -ne 'print if $_.include?("[4]*")'
2.3/[4]*6
5.3-[4]*9
```

**m)** For the given input string, replace all lowercase alphabets to `x` only for words starting with `m`.

```bash
$ s='ma2T3a a2p kite e2e3m meet'

$ echo "$s" | ruby -pe 'gsub(/\bm\w*+/) {$&.tr("a-z", "x")}'
xx2T3x a2p kite e2e3m xxxx
```

**n)** For the input file `ip.txt`, delete all characters other than lowercase vowels and newline character. Perform this transformation only between a line containing `you` up to line number `4` (inclusive).

```bash
$ ruby -pe '$_.tr!("^aeiou\n", "") if /you/..4' ip.txt
Hello World
oaeou
iaeioo
oaiu
12345
You are funny
```

<br>

# Field separators

**a)** Extract only the contents between `()` or `)(` from each input line. Assume that `()` characters will be present only once every line.

```bash
$ cat brackets.txt
foo blah blah(ice) 123 xyz$ 
(almond-pista) choco
yo )yoyo( yo

$ ruby -F'[()]' -ane 'puts $F[1]' brackets.txt
ice
almond-pista
yoyo
```

**b)** For the input file `scores.csv`, extract `Name` and `Physics` fields in the format shown below.

```bash
$ cat scores.csv
Name,Maths,Physics,Chemistry
Blue,67,46,99
Lin,78,83,80
Er,56,79,92
Cy,97,98,95
Ort,68,72,66
Ith,100,100,100

$ ruby -F, -ane 'puts $F.values_at(0,2) * ":"' scores.csv
Name:Physics
Blue:46
Lin:83
Er:79
Cy:98
Ort:72
Ith:100
```

**c)** For the input file `scores.csv`, display names of those who've scored above `70` in Maths.

```bash
$ ruby -F, -ane 'puts $F[0] if $F[1].to_i > 70' scores.csv
Lin
Cy
Ith
```

**d)** Display the number of word characters for the given inputs. Word definition here is same as used in regular expressions. Can you construct a solution with `gsub` and one without substitution functions?

```bash
$ # solve using gsub
$ echo 'hi there' | ruby -ne 'puts gsub(/\W+/, "").size'
7

$ # solve without using substitution functions
$ echo 'u-no;co%."(do_12:as' | ruby -ne 'puts $_.scan(/\w/).size'
12
```

**e)** Construct a solution that works for both the given sample inputs and the corresponding output shown.

```bash
$ s1='1 "grape" and "mango" and "guava"'
$ s2='("a 1""d""c-2""b")'

$ echo "$s1" | ruby -ne 'puts $_.scan(/"[^"]+"/).sort * ","'
"grape","guava","mango"
$ echo "$s2" | ruby -ne 'puts $_.scan(/"[^"]+"/).sort * ","'
"a 1","b","c-2","d"
```

**f)** Display only the third and fifth characters from each input line.

```bash
$ printf 'restore\ncat one\ncricket' | ruby -lne 'print $_[2], $_[4]'
so
to
ik
```

**g)** Transform the given input file `fw.txt` to get the output as shown below. If second field is empty (i.e. contains only space characters), replace it with `NA`.

```bash
$ cat fw.txt
1.3  rs   90  0.134563
3.8           6
5.2  ye       8.2387
4.2  kt   32  45.1

$ ruby -ne 'a = $_.unpack("a3x2a2x7a*");
            a[1] = "NA" if a[1] == "  ";
            puts a * ","' fw.txt
1.3,rs,0.134563
3.8,NA,6
5.2,ye,8.2387
4.2,kt,45.1
```

**h)** For the input file `scores.csv`, display the header as well as any row which contains `b` or `t` (irrespective of case) in the first field.

```bash
$ ruby -F, -ane 'print if $.==1 || $F[0].match?(/[bt]/i)' scores.csv
Name,Maths,Physics,Chemistry
Blue,67,46,99
Ort,68,72,66
Ith,100,100,100
```

**i)** Extract all whole words that contains `42` but not at the edge of a word. Assume a word cannot contain `42` more than once.

```bash
$ s='hi42bye nice1423 bad42 cool_42a 42fake'
$ echo "$s" | ruby -ne 'puts $_.scan(/\w+42\w+/)'
hi42bye
nice1423
cool_42a
```

**j)** For the input file `scores.csv`, add another column named `GP` which is calculated out of `100` by giving `50%` weightage to `Maths` and `25%` each for `Physics` and `Chemistry`.

```bash
$ ruby -F, -lane '$F.append($.==1 ? "GP" : ($F[1].to_f/2 + ($F[2].to_f+$F[3].to_f)/4));
                  puts $F * ","' scores.csv
Name,Maths,Physics,Chemistry,GP
Blue,67,46,99,69.75
Lin,78,83,80,79.75
Er,56,79,92,70.75
Cy,97,98,95,96.75
Ort,68,72,66,68.5
Ith,100,100,100,100.0
```

**k)** For the input file `mixed_fs.txt`, retain only first two fields from each input line. The input and output field separators should be space for first two lines and `,` for the rest of the lines.

```bash
$ cat mixed_fs.txt
rose lily jasmine tulip
pink blue white yellow
car,mat,ball,basket
light green,brown,black,purple

$ ruby -ne 'f = $.<3? " " : ","; puts $_.split(f)[0..1] * f' mixed_fs.txt
rose lily
pink blue
car,mat
light green,brown
```

**l)** For the given space separated numbers, filter only numbers in the range `20` to `1000` (inclusive).

```bash
$ echo '20 -983 5 756 634223' | ruby -ane 'puts $F.map(&:to_i).grep(20..1000) * " "'
20 756
```

**m)** For the given space separated words, randomize the order of characters for each word.

```bash
$ s='this is a sample sentence'

$ # sample randomized output shown here, could be different for you
$ echo "$s" | ruby -ane 'puts $F.map {|s| s.chars.shuffle * ""} * " "'
shti si a salemp sneentce
```

**n)** For the given input file `words.txt`, filter all lines containing characters in ascending and descending order.

```bash
$ cat words.txt
bot
art
are
boat
toe
flee
reed

$ # ascending order
$ ruby -lne 'print if $_ == $_.chars.sort * ""' words.txt
bot
art

$ # descending order
$ ruby -lne 'print if $_ == $_.chars.sort.reverse * ""' words.txt
toe
reed
```

**o)** For the given space separated words, extract the three longest words.

```bash
$ s='I bought two bananas and three mangoes'

$ echo "$s" | ruby -ane 'puts $F.max_by(3) {_1.size}'
mangoes
bananas
bought
```

**p)** Convert the contents of `split.txt` as shown below.

```bash
$ cat split.txt
apple,1:2:5,mango
wry,4,look
pencil,3:8,paper

$ ruby -F, -lane '$F[1].split(/:/).each {puts [$F[0],_1,$F[2]] * ","}' split.txt
apple,1,mango
apple,2,mango
apple,5,mango
wry,4,look
pencil,3,paper
pencil,8,paper
```

<br>

# Record separators

**a)** The input file `jumbled.txt` consists of words separated by various delimiters. Display all words that contain `an` or `at` or `in` or `it`, one per line.

```bash
$ cat jumbled.txt
overcoats;furrowing-typeface%pewter##hobby
wavering:concession/woof\retailer

$ ruby -0777 -ne 'puts $_.scan(/\w*[ai][nt]\w*/)' jumbled.txt
overcoats
furrowing
wavering
```

**b)** Emulate `paste -sd,` with `ruby`.

```bash
$ # this command joins all input lines with ',' character
$ paste -sd, ip.txt
Hello World,How are you,This game is good,Today is sunny,12345,You are funny
$ # make sure there's no ',' at end of the line
$ # and that there's a newline character at the end of the line
$ ruby -lpe '$\ = $<.eof ? "\n" : ","' ip.txt
Hello World,How are you,This game is good,Today is sunny,12345,You are funny

$ # if there's only one line in input, again make sure there's no trailing ','
$ # and that there's a newline character at the end of the line
$ printf 'foo' | paste -sd,
foo
$ printf 'foo' | ruby -lpe '$\ = $<.eof ? "\n" : ","'
foo
```

**c)** For the input file `sample.txt`, extract all paragraphs with words starting with `do`.

```bash
$ cat sample.txt
Hello World

Good day
How are you

Just do-it
Believe it

Today is sunny
Not a bit funny
No doubt you like it too

Much ado about nothing
He he he

$ # note that there's no extra empty line at the end of expected output
$ ruby -l -00 -ne '(print $s, $_; $s="\n") if /\bdo/' sample.txt
Just do-it
Believe it

Today is sunny
Not a bit funny
No doubt you like it too
```

**d)** For the input file `sample.txt`, change all paragraphs into single line by joining lines using `.` and a space character as the separator. And add a final `.` to each paragraph.

```bash
$ # note that there's no extra empty line at the end of expected output
$ ruby -F'\n' -00 -lane '$\ = $<.eof ? ".\n" : ".\n\n"; print $F * ". "' sample.txt
Hello World.

Good day. How are you.

Just do-it. Believe it.

Today is sunny. Not a bit funny. No doubt you like it too.

Much ado about nothing. He he he.
```

**e)** For the given input, use `;;` as record separators and `:` as field separators. Display all records with second field having an integer greater than `50`.

```bash
$ s='mango:100;;apple:25;;grapes:75'

$ # note that the output has ;; at the end but not newline character
$ printf "$s" | ruby -F: -lane 'BEGIN{$/=$\=";;"}; print if $F[1].to_i > 50'
mango:100;;grapes:75;;
```

<br>

# Multiple file input

**a)** Print the last field of first two lines for the input files passed as arguments to the `ruby` script. Assume space as the field separators for these two files. To make the output more informative, print filenames and a separator as shown in the output below. Assume input files will have at least two lines.

```bash
$ # assume table.txt ip.txt are passed as file inputs
$ ruby -lane 'puts ">#{ARGF.filename}<" if $.==1;
              puts $F[-1];
              (puts "----------"; ARGF.close) if $.==2' table.txt ip.txt
>table.txt<
42
-7
----------
>ip.txt<
World
you
----------
```

**b)** For the given list of input files, display all filenames that contain `at` or `fun` in the third field in any of the input lines. Assume space as the field separator and note that some lines may not have three fields.

```bash
$ # assume sample.txt secrets.txt ip.txt table.txt are passed as file inputs
$ # you'll need $F[2] && $F[2].match?(/at|fun/) if you want to use match? method
$ ruby -lane '(puts ARGF.filename; ARGF.close) if $F[2] =~ /at|fun/' sample.txt secrets.txt ip.txt table.txt
secrets.txt
ip.txt
table.txt
```

**c)** Print the first two lines for each of the input files `ip.txt`, `sample.txt` and `table.txt`. Also, add a separator between the results as shown below (note that the separator isn't present at the end of the output). Assume input files will have at least two lines.

```bash
$ ruby -pe 'print $s if $.==1; (ARGF.close; $s="---\n") if $.==2
           ' ip.txt sample.txt table.txt
Hello World
How are you
---
Hello World

---
brown bread mat hair 42
blue cake mug shirt -7
```

<br>

# Processing multiple records

**a)** For the input file `sample.txt`, print a matching line containing `do` only if the previous line is empty and the line before that contains `you`.

```bash
$ ruby -lne 'print if $p2=~/you/ && $p1=="";
             $p2=$p1; $p1=$_' sample.txt
Just do-it
Much ado about nothing
```

**b)** Print only the second matching line respectively for the search terms `do` and `not` for the input file `sample.txt`. Match these terms case insensitively.

```bash
$ ruby -ne 'BEGIN{d=n=0};
            print if /do/i && (d+=1)==2;
            print if /not/i && (n+=1)==2' sample.txt
No doubt you like it too
Much ado about nothing
```

**c)** For the input file `sample.txt`, print the matching lines containing `are` or `bit` as well as `n` lines around the matching lines. The value for `n` is passed to the `ruby` command as an environment value.

```bash
$ n=1 ruby -e 'BEGIN{n=ENV["n"].to_i}; ip=readlines;
               ip.each_with_index { |s, i| c=i-n; c=0 if c<0;
               puts ip[c..i+n] if s.match?(/are|bit/) }' sample.txt
Good day
How are you

Today is sunny
Not a bit funny
No doubt you like it too

$ # note that first and last line are empty for this case
$ n=2 ruby -e 'BEGIN{n=ENV["n"].to_i}; ip=readlines;
               ip.each_with_index { |s, i| c=i-n; c=0 if c<0;
               puts ip[c..i+n] if s.match?(/are|bit/) }' sample.txt

Good day
How are you

Just do-it

Today is sunny
Not a bit funny
No doubt you like it too

```

**d)** For the input file `broken.txt`, print all lines between the markers `top` and `bottom`. The first `ruby` command shown below doesn't work because it is matching till end of file if second marker isn't found. Assume that the input file cannot have two `top` markers without a `bottom` marker appearing in between and vice-versa.

```bash
$ cat broken.txt
top
3.14
bottom
---
top
1234567890
bottom
top
Hi there
Have a nice day
Good bye

$ # wrong output
$ ruby -ne '$f=false if /bottom/; print if $f; $f=true if /top/' broken.txt
3.14
1234567890
Hi there
Have a nice day
Good bye

$ # expected output
$ tac broken.txt | ruby -ne '$f=false if /top/; print if $f; $f=true if /bottom/' | tac
3.14
1234567890
```

**e)** For the input file `concat.txt`, extract contents from a line starting with ``%%% `` until but not including the next such line. The block to be extracted is indicated by variable `n` passed as an environment value.

```bash
$ cat concat.txt
%%% addr.txt
How are you
This game is good
Today %%% is sunny
%%% broken.txt
top %%%
1234567890
bottom
%%% sample.txt
Just %%% do-it
Believe it
%%% mixed_fs.txt
pink blue white yellow
car,mat,ball,basket

$ n=2 ruby -ne 'BEGIN{n=ENV["n"].to_i; c=0};
                c+=1 if /\A%%% /; print if c==n' concat.txt
%%% broken.txt
top %%%
1234567890
bottom
$ n=4 ruby -ne 'BEGIN{n=ENV["n"].to_i; c=0};
                c+=1 if /\A%%% /; print if c==n' concat.txt
%%% mixed_fs.txt
pink blue white yellow
car,mat,ball,basket
```

**f)** For the input file `ruby.md`, replace all occurrences of `ruby` (irrespective of case) with `Ruby`. But, do not replace any matches between ` ```ruby ` and ` ``` ` lines (`ruby` in these markers shouldn't be replaced either).

```bash
$ # can also use: ruby -pe 'gsub(/ruby/i, "Ruby") if !(/```ruby$/../```$/)'
$ ruby -pe '$f=true if /```ruby$/; gsub(/ruby/i, "Ruby") if !$f;
            $f=false if /```$/' ruby.md > out.md
$ diff -sq out.md expected.md
Files out.md and expected.md are identical
```

**g)** Print the last two lines for each of the input files `ip.txt`, `sample.txt` and `table.txt`. Also, add a separator between the results as shown below (note that the separator isn't present at the end of the output). Assume input files will have at least two lines.

```bash
$ ruby -ne '(print $s,$p,$_; $s="---\n") if ARGF.eof;
            $p=$_' ip.txt sample.txt table.txt
12345
You are funny
---
Much ado about nothing
He he he
---
blue cake mug shirt -7
yellow banana window shoes 3.14
```

<br>

# Two file processing

**a)** Use contents of `match_words.txt` file to display matching lines from `jumbled.txt` and `sample.txt`. The matching criteria is that the second word of lines from these files should match the third word of lines from `match_words.txt`.

```bash
$ cat match_words.txt
%whole(Hello)--{doubt}==ado==
just,\joint*,concession<=nice

$ # 'concession' is one of the third words from 'match_words.txt'
$ # and second word from 'jumbled.txt'
$ ruby -rset -ne 'BEGIN{s=Set.new}; words = $_.scan(/\w+/);
                  (s.add(words[2]); next) if ARGV.size==2;
                  print if s.include?(words[1])
                 ' match_words.txt jumbled.txt sample.txt
wavering:concession/woof\retailer
No doubt you like it too
```

**b)** Interleave contents of `secrets.txt` with the contents of a file passed as `stdin` in the format as shown below.

```bash
$ ruby -ne 'print $s, $_; puts STDIN.gets; $s="---\n"' <table.txt secrets.txt
stag area row tick
brown bread mat hair 42
---
deaf chi rate tall glad
blue cake mug shirt -7
---
Bi tac toe - 42
yellow banana window shoes 3.14
```

**c)** The file `search_terms.txt` contains one search string per line (these have no regexp metacharacters). Construct a solution that reads this file and displays search terms (matched case insensitively) that were found in all of the other input file arguments. Note that these terms should be matched with any part of the line, not just whole words.

```bash
$ cat search_terms.txt
hello
row
you
is
at

$ # ip: search_terms.txt jumbled.txt mixed_fs.txt secrets.txt table.txt oops.txt
$ ruby -rset -lne 'BEGIN{s1=Set.new; s2=Set.new; c=ARGV.size-1};
             (s1.add($_); next) if ARGV.size==c;
             s1.each { |k| s2.add(k) if /#{k}/i };
             (s1 = s1 & s2; s2 = Set.new) if ARGF.eof; END { puts s1.to_a }
             ' search_terms.txt jumbled.txt mixed_fs.txt secrets.txt table.txt oops.txt
row
at

$ # ip: search_terms.txt ip.txt sample.txt oops.txt
$ ruby -rset -lne 'BEGIN{s1=Set.new; s2=Set.new; c=ARGV.size-1};
             (s1.add($_); next) if ARGV.size==c;
             s1.each { |k| s2.add(k) if /#{k}/i };
             (s1 = s1 & s2; s2 = Set.new) if ARGF.eof; END { puts s1.to_a }
             ' search_terms.txt ip.txt sample.txt oops.txt
hello
you
is
```

**d)** For the input file `ip.txt`, print all lines that contain `are` and the line that comes after such a line, if any. Use `gets` method to construct the solution.

```bash
$ # note that there shouldn't be an empty line at the end of the output
$ ruby -ne '(print; print gets) if /are/' ip.txt
How are you
This game is good
You are funny
```

**Bonus:** Will `grep -A1 'is' ip.txt` give identical results for your solution with `is` as the search term? If not, why?

No, it will not give identical results because `grep` will work for overlapping cases too.

**e)** Replace third to fifth lines of input file `ip.txt` with second to fourth lines from file `para.txt`

```bash
$ ruby -ne 'print if 2..4' para.txt | ruby -pe '
            print STDIN.read if $.==3; $_ = "" if 3..5' ip.txt
Hello World
How are you
Start working on that
project you always wanted
to, do not let it end
You are funny
```

**f)** Insert one line from `jumbled.txt` before every two lines of `idx.txt`

```bash
$ ruby -ne 's = $_; print STDIN.gets if $. % 2 == 1; print s' <jumbled.txt idx.txt
overcoats;furrowing-typeface%pewter##hobby
match after the last newline character
and then you want to test
wavering:concession/woof\retailer
this is good bye then
you were there to see?
```

**g)** Use entire contents of `match.txt` to search `error.txt` and replace with contents of `jumbled.txt`. Partial lines should NOT be matched.

```bash
$ cat match.txt
print+this
but not that
$ cat error.txt
print+this
but not that or this
print+this
but not that
if print+this
but not that
print+this
but not that

$ ruby -0777 -ne 'ARGV.size==2 ? s=$_ : ARGV.size==1 ? r=$_ :
                  print(gsub(/^#{Regexp.escape(s)}/) {r})
                 ' match.txt jumbled.txt error.txt
print+this
but not that or this
overcoats;furrowing-typeface%pewter##hobby
wavering:concession/woof\retailer
if print+this
but not that
overcoats;furrowing-typeface%pewter##hobby
wavering:concession/woof\retailer
```

<br>

# Dealing with duplicates

**a)** Retain only first copy of a line for the input file `lines.txt`. Case should be ignored while comparing lines. For example `hi there` and `HI TheRE` will be considered as duplicates.

```bash
$ cat lines.txt
Go There
come on
go there
---
2 apples and 5 mangoes
come on!
---
2 Apples
COME ON

$ # same as: ruby -e 'puts readlines.uniq(&:downcase)' lines.txt
$ ruby -rset -ne 'BEGIN{s=Set.new}; print if s.add?($_.downcase)' lines.txt
Go There
come on
---
2 apples and 5 mangoes
come on!
2 Apples
```

**b)** Retain only first copy of a line for the input file `twos.txt`. Assume space as field separator with two fields on each line. Compare the lines irrespective of order of the fields. For example, `hehe haha` and `haha hehe` will be considered as duplicates.

```bash
$ cat twos.txt
hehe haha
door floor
haha hehe
6;8 3-4
true blue
hehe bebe
floor door
3-4 6;8
tru eblue
haha hehe

$ # can also use: ruby -rset -lane 'BEGIN{s=Set.new};
$ #    print if s.add?($F[0] > $F[1] ? $_ : "#{$F[1]} #{$F[0]}")' twos.txt
$ ruby -e 'puts readlines.uniq {_1.split.sort}' twos.txt
hehe haha
door floor
6;8 3-4
true blue
hehe bebe
tru eblue
```

**c)** For the input file `twos.txt`, display only unique lines. Assume space as field separator with two fields on each line. Compare the lines irrespective of order of the fields. For example, `hehe haha` and `haha hehe` will be considered as duplicates.

```bash
$ ruby -lane 'BEGIN{h=Hash.new(0)};
              h[$F[0] > $F[1] ? $_ : "#{$F[1]} #{$F[0]}"] += 1;
              END{ h.each_key{|k| puts k if h[k]==1} }' twos.txt
true blue
hehe bebe
tru eblue
```

