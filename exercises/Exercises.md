# Exercises

>![info](../images/info.svg) For solutions, see [Exercise_solutions.md](https://github.com/learnbyexample/learn_ruby_oneliners/blob/master/exercises/Exercise_solutions.md).

<br>

# One-liner introduction

**1)** For the input file `ip.txt`, display all lines containing `is`.

```bash
$ cat ip.txt
Hello World
How are you
This game is good
Today is sunny
12345
You are funny

##### add your solution here
This game is good
Today is sunny
```

**2)** For the input file `ip.txt`, display the first field of lines *not* containing `y`. Consider space as the field separator for this file.

```bash
##### add your solution here
Hello
This
12345
```

**3)** For the input file `ip.txt`, display all lines containing no more than 2 fields.

```bash
##### add your solution here
Hello World
12345
```

**4)** For the input file `ip.txt`, display all lines containing `is` in the second field.

```bash
##### add your solution here
Today is sunny
```

**5)** For each line of the input file `ip.txt`, replace the first occurrence of `o` with `0`.

```bash
##### add your solution here
Hell0 World
H0w are you
This game is g0od
T0day is sunny
12345
Y0u are funny
```

**6)** For the input file `table.txt`, calculate and display the product of numbers in the last field of each line. Consider space as the field separator for this file.

```bash
$ cat table.txt
brown bread mat hair 42
blue cake mug shirt -7
yellow banana window shoes 3.14

##### add your solution here
-923.1600000000001
```

**7)** Append `.` to all the input lines for the given stdin data.

```bash
$ printf 'last\nappend\nstop\ntail\n' | ##### add your solution here
last.
append.
stop.
tail.
```

**8)** Use contents of the `s` variable to display matching lines from the input file `ip.txt`. Assume that `s` doesn't have any regexp metacharacters. Construct the solution such that there's at least one word character immediately preceding the contents of the `s` variable.

```bash
$ s='is'

##### add your solution here
This game is good
```

**9)** Use `system` to display the contents of the filename present in the second field of the given input line. Consider space as the field separator.

```bash
$ s='report.log ip.txt sorted.txt'
$ echo "$s" | ##### add your solution here
Hello World
How are you
This game is good
Today is sunny
12345
You are funny

$ s='power.txt table.txt'
$ echo "$s" | ##### add your solution here
brown bread mat hair 42
blue cake mug shirt -7
yellow banana window shoes 3.14
```

<br>

# Line processing

**1)** For the given input, display except the third line.

```bash
$ seq 34 37 | ##### add your solution here
34
35
37
```

**2)** Display only the fourth, fifth, sixth and seventh lines for the given input.

```bash
$ seq 65 78 | ##### add your solution here
68
69
70
71
```

**3)** For the input file `ip.txt`, replace all occurrences of `are` with `are not` and `is` with `is not` only from line number **4** till the end of file. Also, only the lines that were changed should be displayed in the output.

```bash
$ cat ip.txt
Hello World
How are you
This game is good
Today is sunny
12345
You are funny

##### add your solution here
Today is not sunny
You are not funny
```

**4)** For the given stdin, display only the first three lines. Avoid processing lines that are not relevant.

```bash
$ seq 14 25 | ##### add your solution here
14
15
16
```

**5)** For the input file `ip.txt`, display all lines from the start of the file till the first occurrence of `game`.

```bash
##### add your solution here
Hello World
How are you
This game is good
```

**6)** For the input file `ip.txt`, display all lines that contain `is` but not `good`.

```bash
##### add your solution here
Today is sunny
```

**7)** For the input file `ip.txt`, extract the word before the whole word `is` as well as the word after it. If such a match is found, display the two words around `is` in reversed order. For example, `hi;1 is--234 bye` should be converted to `234:1`. Assume that the whole word `is` will not be present more than once in a single line.

```bash
##### add your solution here
good:game
sunny:Today
```

**8)** For the input file `hex.txt`, replace all occurrences of `0xA0` with `0x50` and `0xFF` with `0x7F`.

```bash
$ cat hex.txt
start: 0xA0, func1: 0xA0
end: 0xFF, func2: 0xB0
restart: 0xA010, func3: 0x7F

##### add your solution here
start: 0x50, func1: 0x50
end: 0x7F, func2: 0xB0
restart: 0x5010, func3: 0x7F
```

**9)** For the input file `text.txt`, replace all occurrences of `in` with `an` and write back the changes to `text.txt` itself. The original contents should get saved to `text.txt.orig`.

```bash
$ cat text.txt
can ran want plant
tin fin fit mine line

##### add your solution here

$ cat text.txt
can ran want plant
tan fan fit mane lane
$ cat text.txt.orig
can ran want plant
tin fin fit mine line
```

**10)** For the input file `text.txt`, replace all occurrences of `an` with `in` and write back the changes to `text.txt` itself. Do not create backups for this exercise. Note that you should have solved the previous exercise before starting this one.

```bash
$ cat text.txt
can ran want plant
tan fan fit mane lane

##### add your solution here

$ cat text.txt
cin rin wint plint
tin fin fit mine line
$ diff text.txt text.txt.orig
1c1
< cin rin wint plint
---
> can ran want plant
```

**11)** Find the starting index of first occurrence of `is` or `the` or `was` or `to` for each input line of the file `idx.txt`. Assume that every input line will match at least one of these terms.

```bash
$ cat idx.txt
match after the last newline character
and then you want to test
this is good bye then
you were there to see?

##### add your solution here
12
4
2
9
```

**12)** Display all lines containing `[4]*` for the given stdin data.

```bash
$ printf '2.3/[4]*6\n2[4]5\n5.3-[4]*9\n' | ##### add your solution here
2.3/[4]*6
5.3-[4]*9
```

**13)** For the given input string, change all lowercase alphabets to `x` only for words starting with `m`.

```bash
$ s='ma2T3a a2p kite e2e3m meet'

$ echo "$s" | ##### add your solution here
xx2T3x a2p kite e2e3m xxxx
```

**14)** For the input file `ip.txt`, delete all characters other than lowercase vowels and the newline character. Perform this transformation only between a line containing `you` up to line number `4` (inclusive).

```bash
##### add your solution here
Hello World
oaeou
iaeioo
oaiu
12345
You are funny
```

**15)** For the input file `sample.txt`, display from the start of the file till the first occurrence of `are`, excluding the matching line.

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

##### add your solution here
Hello World

Good day
```

**16)** For the input file `sample.txt`, display from the last occurrence of `do` till the end of the file.

```bash
##### add your solution here
Much ado about nothing
He he he
```

**17)** For the input file `sample.txt`, display from the 9th line till a line containing `you`.

```bash
##### add your solution here
Today is sunny
Not a bit funny
No doubt you like it too
```

**18)** Display only the odd numbered lines from `ip.txt`.

```bash
##### add your solution here
Hello World
This game is good
12345
```

**19)** For the `table.txt` file, print only the line number for lines containing `air` or `win`.

```bash
$ cat table.txt
brown bread mat hair 42
blue cake mug shirt -7
yellow banana window shoes 3.14

##### add your solution here
1
3
```

**20)** For the input file `table.txt`, calculate the sum of numbers in the last column, excluding the second line.

```bash
##### add your solution here
45.14
```

**21)** Print the second and fourth line for every block of five lines.

```bash
$ seq 15 | ##### add your solution here
2
4
7
9
12
14
```

**22)** For the input file `ip.txt`, display all lines containing `e` or `u` but not both.

```bash
##### add your solution here
Hello World
This game is good
Today is sunny
```

<br>

# Field separators

**1)** For the input file `brackets.txt`, extract only the contents between `()` or `)(` from each input line. Assume that `()` characters will be present only once every line.

```bash
$ cat brackets.txt
foo blah blah(ice) 123 xyz$ 
(almond-pista) choco
yo )yoyo( yo

##### add your solution here
ice
almond-pista
yoyo
```

**2)** For the input file `scores.csv`, extract `Name` and `Physics` fields in the format shown below.

```bash
$ cat scores.csv
Name,Maths,Physics,Chemistry
Blue,67,46,99
Lin,78,83,80
Er,56,79,92
Cy,97,98,95
Ort,68,72,66
Ith,100,100,100

##### add your solution here
Name:Physics
Blue:46
Lin:83
Er:79
Cy:98
Ort:72
Ith:100
```

**3)** For the input file `scores.csv`, display names of those who've scored above `70` in Maths.

```bash
##### add your solution here
Lin
Cy
Ith
```

**4)** Display the number of word characters for the given inputs. Word definition here is same as used in regular expressions. Can you construct a solution with `gsub` and one without the substitution functions?

```bash
# solve using gsub
$ echo 'hi there' | ##### add your solution here
7

# solve without using the substitution functions
$ echo 'u-no;co%."(do_12:as' | ##### add your solution here
12
```

**5)** For the input file `quoted.txt`, extract the sequence of characters surrounded by double quotes and display them in the format shown below.

```bash
$ cat quoted.txt
1 "grape" and "mango" and "guava"
("c 1""d""a-2""b")

##### add your solution here
"grape","guava","mango"
"a-2","b","c 1","d"
```

**6)** Display only the third and fifth characters from each input line.

```bash
$ printf 'restore\ncat one\ncricket' | ##### add your solution here
so
to
ik
```

**7)** Transform the given input file `fw.txt` to get the output as shown below. If the second field is empty (i.e. contains only space characters), replace it with `NA`.

```bash
$ cat fw.txt
1.3  rs   90  0.134563
3.8           6
5.2  ye       8.2387
4.2  kt   32  45.1

##### add your solution here
1.3,rs,0.134563
3.8,NA,6
5.2,ye,8.2387
4.2,kt,45.1
```

**8)** For the input file `scores.csv`, display the header as well as any row which contains `b` or `t` (irrespective of case) in the first field.

```bash
##### add your solution here
Name,Maths,Physics,Chemistry
Blue,67,46,99
Ort,68,72,66
Ith,100,100,100
```

**9)** Extract all whole words containing `42` but not at the edge of a word. Assume a word cannot contain `42` more than once.

```bash
$ s='hi42bye nice1423 bad42 cool_42a 42fake'
$ echo "$s" | ##### add your solution here
hi42bye
nice1423
cool_42a
```

**10)** For the input file `scores.csv`, add another column named **GP** which is calculated out of 100 by giving 50% weightage to Maths and 25% each for Physics and Chemistry.

```bash
##### add your solution here
Name,Maths,Physics,Chemistry,GP
Blue,67,46,99,69.75
Lin,78,83,80,79.75
Er,56,79,92,70.75
Cy,97,98,95,96.75
Ort,68,72,66,68.5
Ith,100,100,100,100.0
```

**11)** For the input file `mixed_fs.txt`, retain only the first two fields from each input line. The input and output field separators should be space for first two lines and `,` for the rest of the lines.

```bash
$ cat mixed_fs.txt
rose lily jasmine tulip
pink blue white yellow
car,mat,ball,basket
light green,brown,black,purple
apple,banana,cherry

##### add your solution here
rose lily
pink blue
car,mat
light green,brown
apple,banana
```

**12)** For the given space separated numbers, filter only numbers in the range `20` to `1000` (inclusive).

```bash
$ s='20 -983 5 756 634223 1000'

$ echo "$s" | ##### add your solution here
20 756 1000
```

**13)** For the given space separated words, randomize the order of characters for each word.

```bash
$ s='this is a sample sentence'

# sample randomized output shown here, could be different for you
$ echo "$s" | ##### add your solution here
shti si a salemp sneentce
```

**14)** For the given input file `words.txt`, filter all lines containing characters in ascending and descending order.

```bash
$ cat words.txt
bot
art
are
boat
toe
flee
reed

# ascending order
##### add your solution here
bot
art

# descending order
##### add your solution here
toe
reed
```

**15)** For the given space separated words, extract the three longest words.

```bash
$ s='I bought two bananas and three mangoes'

$ echo "$s" | ##### add your solution here
mangoes
bananas
bought
```

**16)** Convert the contents of `split.txt` as shown below.

```bash
$ cat split.txt
apple,1:2:5,mango
wry,4,look
pencil,3:8,paper

##### add your solution here
apple,1,mango
apple,2,mango
apple,5,mango
wry,4,look
pencil,3,paper
pencil,8,paper
```

**17)** For the input file `varying_fields.txt`, construct a solution to get the output shown below.

```bash
$ cat varying_fields.txt
hi,bye,there,was,here,to
1,2,3,4,5

##### add your solution here
hi:bye:to
1:2:5
```

**18)** The `fields.txt` file has fields separated by the `:` character. Delete `:` and the last field if there is a digit character anywhere before the last field. Solution shouldn't use the substitution functions.

```bash
$ cat fields.txt
42:cat
twelve:a2b
we:be:he:0:a:b:bother
apple:banana-42:cherry:
dragon:unicorn:centaur

##### add your solution here
42
twelve:a2b
we:be:he:0:a:b
apple:banana-42:cherry
dragon:unicorn:centaur
```

**19)** The sample string shown below uses `cat` as the field separator (irrespective of case). Use space as the output field separator and add `42` as the last field.

```bash
$ s='applecatfigCaT12345cAtbanana'

$ echo "$s" | ##### add your solution here
apple fig 12345 banana 42
```

**20)** For the input file `sample.txt`, filter lines containing 5 or more lowercase vowels.

```bash
##### add your solution here
How are you
Believe it
No doubt you like it too
Much ado about nothing
```

<br>

# Record separators

**1)** The input file `jumbled.txt` consists of words separated by various delimiters. Display the last four words that contain `an` or `at` or `in` or `it`, one per line.

```bash
$ cat jumbled.txt
overcoats;furrowing-typeface%pewter##hobby
wavering:concession/woof\retailer
joint[]seer{intuition}titanic

##### add your solution here
wavering
joint
intuition
titanic
```

**2)** Emulate `paste -sd,` with Ruby.

```bash
# this command joins all input lines with the ',' character
$ paste -sd, ip.txt
Hello World,How are you,This game is good,Today is sunny,12345,You are funny

# make sure there's no ',' at the end of the line
# and that there's a newline character at the end of the line
##### add your solution here
Hello World,How are you,This game is good,Today is sunny,12345,You are funny

# if there's only one line in input, again make sure there's no trailing ','
# and that there's a newline character at the end of the line
$ printf 'fig' | paste -sd,
fig
$ printf 'fig' | ##### add your solution here
fig
```

**3)** For the input file `sample.txt`, extract all paragraphs having words starting with `do`.

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

# note that there's no extra empty line at the end of the output
##### add your solution here
Just do-it
Believe it

Today is sunny
Not a bit funny
No doubt you like it too
```

**4)** For the input file `sample.txt`, change each paragraph to a single line by joining lines using `.` and a space character as the separator. Also, add a final `.` to each paragraph.

```bash
# note that there's no extra empty line at the end of the output
##### add your solution here
Hello World.

Good day. How are you.

Just do-it. Believe it.

Today is sunny. Not a bit funny. No doubt you like it too.

Much ado about nothing. He he he.
```

**5)** For the given input, use `;;` as the record separators and `:` as the field separators. Filter records whose second field is greater than `50`.

```bash
$ s='mango:100;;apple:25;;grapes:75'

# note that the output has ;; at the end, not a newline character
$ printf "$s" | ##### add your solution here
mango:100;;grapes:75;;
```

**6)** The input file `f1.txt` has varying amount of empty lines between the records. Change them to be always two empty lines. Also, remove empty lines at the start and end of the file.

```bash
##### add your solution here
hello


world


apple
banana
cherry


tea coffee
chocolate
```

**7)** The sample string shown below uses `cat` as the record separator. Display only the even numbered records separated by a single empty line.

```bash
$ s='applecatfigcat12345catbananacatguava:cat:mangocat3'
$ echo "$s" | ##### add your solution here
fig

banana

:mango
```

<br>

# Multiple file input

**1)** Print the last field of first two lines for the input files `table.txt` and `ip.txt`. Assume space as the field separators for these two files. To make the output more informative, print filenames and a separator as shown in the output below. Assume that the input files will have at least two lines.

```bash
# table.txt ip.txt are passed as file inputs
##### add your solution here
>table.txt<
42
-7
----------
>ip.txt<
World
you
----------
```

**2)** For the input files `sample.txt`, `secrets.txt`, `ip.txt` and `table.txt`, display only the names of files that contain `at` or `fun` in the third field. Assume space as the field separator.

```bash
##### add your solution here
secrets.txt
ip.txt
table.txt
```

**3)** Print the first two lines from the input files `ip.txt`, `sample.txt` and `table.txt`. Also, add a separator between the results as shown below (note that the separator isn't present at the end of the output). Assume that the input files will have at least two lines.

```bash
##### add your solution here
Hello World
How are you
---
Hello World

---
brown bread mat hair 42
blue cake mug shirt -7
```

**4)** Print only the second field of the third line, if any, from these input files: `ip.txt`, `sample.txt` and `copyright.txt`. Consider space as the field separator.

```bash
##### add your solution here
game
day
bla
```

<br>

# Processing multiple records

**1)** For the input file `sample.txt`, print lines containing `do` only if the previous line is empty and the line before that contains `you`.

```bash
##### add your solution here
Just do-it
Much ado about nothing
```

**2)** For the input file `sample.txt`, match lines containing `do` or `not` case insensitively. Each of these terms occur multiple times in the file. The goal is to print only the second occurrences of these terms (independent of each other).

```bash
# for reference, here are all the matches
$ grep -i 'do' sample.txt
Just do-it
No doubt you like it too
Much ado about nothing
$ grep -i 'not' sample.txt
Not a bit funny
Much ado about nothing

##### add your solution here
No doubt you like it too
Much ado about nothing
```

**3)** For the input file `sample.txt`, print the matching lines containing `are` or `bit` as well as `n` lines around the matching lines. The value for `n` is passed to the Ruby command as an environment value.

```bash
$ n=1 ##### add your solution here
Good day
How are you

Today is sunny
Not a bit funny
No doubt you like it too

# note that the first and last line are empty for this case
$ n=2 ##### add your solution here

Good day
How are you

Just do-it

Today is sunny
Not a bit funny
No doubt you like it too

```

**4)** For the input file `broken.txt`, print all lines between the markers `top` and `bottom`. The first Ruby command shown below doesn't work because it is matching till the end of file as the second marker isn't found. Assume that the input file cannot have two `top` markers without a `bottom` marker appearing in between and vice-versa.

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

# wrong output
$ ruby -ne '$f=false if /bottom/; print if $f; $f=true if /top/' broken.txt
3.14
1234567890
Hi there
Have a nice day
Good bye

# expected output
##### add your solution here
3.14
1234567890
```

**5)** For the input file `concat.txt`, extract contents from a line starting with ``%%% `` until but not including the next such line. The block to be extracted is indicated by the variable `n` passed as an environment value.

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

$ n=2 ##### add your solution here
%%% broken.txt
top %%%
1234567890
bottom
$ n=4 ##### add your solution here
%%% mixed_fs.txt
pink blue white yellow
car,mat,ball,basket
```

**6)** For the input file `ruby.md`, replace all occurrences of `ruby` (irrespective of case) with `Ruby`. But, do not replace any matches between ` ```ruby ` and ` ``` ` lines (`ruby` in these markers shouldn't be replaced either). Save the output in `out.md`.

```bash
##### add your solution here, redirect the output to 'out.md'
$ diff -sq out.md expected.md
Files out.md and expected.md are identical
```

**7)** Print the last two lines for each of the input files `ip.txt`, `sample.txt` and `table.txt`. Also, add a separator between the results as shown below (note that the separator isn't present at the end of the output). Assume that the input files will have at least two lines.

```bash
##### add your solution here
12345
You are funny
---
Much ado about nothing
He he he
---
blue cake mug shirt -7
yellow banana window shoes 3.14
```

**8)** For the input file `lines.txt`, delete the line that comes after a whole line containing `---`. Assume that such lines won't occur consecutively.

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

##### add your solution here
Go There
come on
go there
---
come on!
---
COME ON
```

**9)** For the input file `result.csv`, use `---` to separate entries with the same name in the first column. Assume that the lines with the same first column value will always be next to each other.

```bash
$ cat result.csv
Amy,maths,89
Amy,physics,75
Joe,maths,79
John,chemistry,77
John,physics,91
Moe,maths,81
Ravi,physics,84
Ravi,chemistry,70
Yui,maths,92

##### add your solution here
Amy,maths,89
Amy,physics,75
---
Joe,maths,79
---
John,chemistry,77
John,physics,91
---
Moe,maths,81
---
Ravi,physics,84
Ravi,chemistry,70
---
Yui,maths,92
```

**10)** The input file `multisort.csv` has two fields separated by the comma character. Sort this file based on the number of `:` characters in the second field. Use alphabetic order as the tie-breaker if there are multiple lines with the same number of `:` characters in the second field.

```bash
$ cat multisort.csv
papaya,2
apple,4:5:2
mango,100
dark:chocolate,12:32
cherry,1:2:1:4:2:1
almond,3:14:6:28
banana,23:8

##### add your solution here
mango,100
papaya,2
banana,23:8
dark:chocolate,12:32
apple,4:5:2
almond,3:14:6:28
cherry,1:2:1:4:2:1
```

<br>

# Two file processing

**1)** Use the contents of `match_words.txt` file to display matching lines from `jumbled.txt` and `sample.txt`. The matching criteria is that the second word of lines from these files should match the third word of lines from `match_words.txt`.

```bash
$ cat match_words.txt
%whole(Hello)--{doubt}==ado==
just,\joint*,concession<=nice

# 'concession' is one of the third words from 'match_words.txt'
# and second word from 'jumbled.txt'
##### add your solution here
wavering:concession/woof\retailer
No doubt you like it too
```

**2)** Interleave the contents of `secrets.txt` with the contents of a file passed as stdin in the format as shown below.

```bash
##### add your solution here, use 'table.txt' as stdin
stag area row tick
brown bread mat hair 42
---
deaf chi rate tall glad
blue cake mug shirt -7
---
Bi tac toe - 42
yellow banana window shoes 3.14
```

**3)** The file `search_terms.txt` contains one search string per line, and these terms have no regexp metacharacters. Construct a solution that reads this file and displays the search terms (matched case insensitively) that were found in every file passed as the arguments after `search_terms.txt`. Note that these terms should be matched anywhere in the line (so, don't use word boundaries).

```bash
$ cat search_terms.txt
hello
row
you
is
at

# ip: search_terms.txt jumbled.txt mixed_fs.txt secrets.txt table.txt oops.txt
##### add your solution here
row
at

# ip: search_terms.txt ip.txt sample.txt oops.txt
##### add your solution here
hello
you
is
```

**4)** For the input file `ip.txt`, print all lines that contain `are` and the line that comes after such a line, if any. Use the `gets` method to construct the solution.

```bash
# note that there shouldn't be an empty line at the end of the output
##### add your solution here
How are you
This game is good
You are funny
```

**Bonus:** Will `grep -A1 'is' ip.txt` give identical results for your solution with `is` as the search term? If not, why?

**5)** Replace the third to fifth lines of the input file `ip.txt` with the second to fourth lines from the file `para.txt`.

```bash
##### add your solution here
Hello World
How are you
Start working on that
project you always wanted
to, do not let it end
You are funny
```

**6)** Insert one line from `jumbled.txt` before every two lines of `copyright.txt`.

```bash
##### add your solution here
overcoats;furrowing-typeface%pewter##hobby
bla bla 2015 bla
blah 2018 blah
wavering:concession/woof\retailer
bla bla bla
copyright: 2018
```

**7)** Use the entire contents of `match.txt` to search `error.txt` and replace matching portions with the contents of `jumbled.txt`. Partial lines should NOT be matched.

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

##### add your solution here
print+this
but not that or this
overcoats;furrowing-typeface%pewter##hobby
wavering:concession/woof\retailer
joint[]seer{intuition}titanic
if print+this
but not that
overcoats;furrowing-typeface%pewter##hobby
wavering:concession/woof\retailer
joint[]seer{intuition}titanic
```

**8)** Display lines from `scores.csv` by matching the first field based on a list of names from the `names.txt` file. Also, change the output field separator to a space character.

```bash
$ cat names.txt
Lin
Cy
Ith

##### add your solution here
Lin 78 83 80
Cy 97 98 95
Ith 100 100 100
```

**9)** The `result.csv` file has three columns — name, subject and mark. The `criteria.txt` file has two columns — name and subject. Match lines from `result.csv` based on the two columns from `criteria.txt` provided the mark column is greater than 80.

```bash
$ cat result.csv
Amy,maths,89
Amy,physics,75
Joe,maths,79
John,chemistry,77
John,physics,91
Moe,maths,81
Ravi,physics,84
Ravi,chemistry,70
Yui,maths,92

$ cat criteria.txt
Amy maths
John chemistry
John physics
Ravi chemistry
Yui maths

##### add your solution here
Amy,maths,89
John,physics,91
Yui,maths,92
```

**10)** Insert the contents of `hex.txt` before a line matching `cake` of `table.txt`.

```bash
##### add your solution here
brown bread mat hair 42
start: 0xA0, func1: 0xA0
end: 0xFF, func2: 0xB0
restart: 0xA010, func3: 0x7F
blue cake mug shirt -7
yellow banana window shoes 3.14
```

**11)** For the input file `ip.txt`, replace lines containing `are` with the contents of `hex.txt`.

```bash
##### add your solution here
Hello World
start: 0xA0, func1: 0xA0
end: 0xFF, func2: 0xB0
restart: 0xA010, func3: 0x7F
This game is good
Today is sunny
12345
start: 0xA0, func1: 0xA0
end: 0xFF, func2: 0xB0
restart: 0xA010, func3: 0x7F
```

<br>

# Dealing with duplicates

**1)** Retain only the first copy of a line for the input file `lines.txt`. Case should be ignored while comparing the lines. For example, `hi there` and `HI TheRE` should be considered as duplicates.

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

##### add your solution here
Go There
come on
---
2 apples and 5 mangoes
come on!
2 Apples
```

**2)** Retain only the first copy of a line for the input file `twos.txt`. Assume space as the field separator with exactly two fields per line. Compare the lines irrespective of the order of the fields. For example, `hehe haha` and `haha hehe` should be considered as duplicates.

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

##### add your solution here
hehe haha
door floor
6;8 3-4
true blue
hehe bebe
tru eblue
```

**3)** For the input file `twos.txt`, display only the unique lines. Assume space as the field separator with exactly two fields per line. Compare the lines irrespective of the order of the fields. For example, `hehe haha` and `haha hehe` should be considered as duplicates.

```bash
##### add your solution here
true blue
hehe bebe
tru eblue
```

