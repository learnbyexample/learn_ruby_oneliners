# Preface

As per [ruby-lang.org](https://www.ruby-lang.org/en/about/), Ruby is based on programming languages like Perl, Smalltalk, Eiffel, Ada, and Lisp. This book focuses on using Ruby from the command line, similar to Perl one-liners usage.

You'll learn about various command line options and Ruby features that make it possible to write compact cli scripts. Learning to use Ruby from the command line will also allow you to construct solutions where Ruby is just another tool in the shell ecosystem.

## Prerequisites

You should be comfortable with programming basics and have prior experience working with Ruby. You should know concepts like blocks, be familiar with string/array/hash/enumerable methods, regular expressions etc. You can check out my free book on [Ruby Regexp](https://github.com/learnbyexample/Ruby_Regexp) if you wish to learn regular expressions in depth.

You should also have prior experience working with command line and `bash` shell and be familiar with concepts like file redirection, command pipeline and so on.

## Conventions

* The examples presented here have been tested with **Ruby version 3.0.0** and includes features not available in earlier versions.
* Code snippets shown are copy pasted from **bash** shell and modified for presentation purposes. Some commands are preceded by comments to provide context and explanations. Blank lines have been added to improve readability, only `real` time is shown for speed comparisons and so on.
* External links are provided for further reading throughout the book. Not necessary to immediately visit them. They have been chosen with care and would help, especially during re-reads.
* The [learn_ruby_oneliners repo](https://github.com/learnbyexample/learn_ruby_oneliners) has all the code snippets and files used in examples and exercises and other details related to the book. If you are not familiar with `git` command, click the **Code** button on the webpage to get the files.

## Acknowledgements

* [ruby-lang documentation](https://www.ruby-lang.org/en/documentation/) — manuals and tutorials
* [/r/ruby/](https://www.reddit.com/r/ruby/) — helpful forum for beginners and experienced programmers alike
* [stackoverflow](https://stackoverflow.com/) — for getting answers to pertinent questions on Ruby, one-liners, etc
* [tex.stackexchange](https://tex.stackexchange.com/) — for help on [pandoc](https://github.com/jgm/pandoc/) and `tex` related questions
* [LibreOffice Draw](https://www.libreoffice.org/discover/draw/) — cover image
* [pngquant](https://pngquant.org/) and [svgcleaner](https://github.com/RazrFalcon/svgcleaner) for optimizing images
* [Warning](https://commons.wikimedia.org/wiki/File:Warning_icon.svg) and [Info](https://commons.wikimedia.org/wiki/File:Info_icon_002.svg) icons by [Amada44](https://commons.wikimedia.org/wiki/User:Amada44) under public domain
* [softwareengineering.stackexchange](https://softwareengineering.stackexchange.com/questions/39/whats-your-favourite-quote-about-programming) and [skolakoda](https://skolakoda.org/programming-quotes) for programming quotes

A heartfelt thanks to all my readers. Your valuable support has significantly eased my financial concerns and allows me to continue writing books.

## Feedback and Errata

I would highly appreciate if you'd let me know how you felt about this book, it would help to improve this book as well as my future attempts. Also, please do let me know if you spot any error or typo.

Issue Manager: [https://github.com/learnbyexample/learn_ruby_oneliners/issues](https://github.com/learnbyexample/learn_ruby_oneliners/issues)

E-mail: learnbyexample.net@gmail.com

Twitter: https://twitter.com/learn_byexample

## Author info

Sundeep Agarwal is a freelance trainer, author and mentor. His previous experience includes working as a Design Engineer at Analog Devices for more than 5 years. You can find his other works, primarily focused on Linux command line, text processing, scripting languages and curated lists, at [https://github.com/learnbyexample](https://github.com/learnbyexample). He has also been a technical reviewer for [Command Line Fundamentals](https://www.packtpub.com/application-development/command-line-fundamentals) book and video course published by Packt.

**List of books:** https://learnbyexample.github.io/books/

## License

This work is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-nc-sa/4.0/)

Code snippets are available under [MIT License](https://github.com/learnbyexample/learn_ruby_oneliners/blob/master/LICENSE)

Resources mentioned in Acknowledgements section above are available under original licenses.

## Book version

1.6

See [Version_changes.md](https://github.com/learnbyexample/learn_ruby_oneliners/blob/master/Version_changes.md) to track changes across book versions.

# One-liner introduction

This chapter will give an overview of `ruby` syntax for command line usage and some examples to show what kind of problems are typically suited for one-liners.

## Why use Ruby for one-liners?

I assume you are already familiar with use cases where command line is more productive compared to GUI. See also this series of articles titled [Unix as IDE](https://sanctum.geek.nz/arabesque/series/unix-as-ide/).

A shell utility like `bash` provides built-in commands and scripting features to make it easier to solve and automate various tasks. External \*nix commands like `grep`, `sed`, `awk`, `sort`, `find`, `parallel` etc can be combined to work with each other. Depending upon your familiarity with those tools, you can either use `ruby` as a single replacement or complement them for specific use cases.

Here's some one-liners (options will be explained later):

* `ruby -e 'puts readlines.uniq' *.txt` — retain only one copy if lines are duplicated from the given list of input file(s)
* `ruby -e 'puts readlines.uniq {|s| s.split[1]}' *.txt` — retain only first copy of duplicate lines using second field as duplicate criteria
* `ruby -rcommonregex -ne 'puts CommonRegex.get_links($_)' *.md` — extract only the URLs, using a third-party [CommonRegexRuby](https://github.com/talyssonoc/CommonRegexRuby) library
* [stackoverflow: merge duplicate key values while preserving order](https://stackoverflow.com/q/63954081/4082052) — where I provide a simpler `ruby` solution compared to `awk`
* [unix.stackexchange: pair each line of file](https://unix.stackexchange.com/q/506815/109046) — an example where `ruby`'s vast built-in features makes it easier to write a solution

The main advantage of `ruby` over tools like `grep`, `sed` and `awk` includes feature rich regular expression engine, standard library and third-party libraries. If you don't already know the syntax and idioms for `sed` and `awk`, learning command line options for `ruby` would be the easier option. Another advantage is that `ruby` is more portable, given the many differences between GNU, BSD, Mac and other such implementations. The main disadvantage is that `ruby` is likely to be verbose and slower for features that are supported out of the box by those tools.

## Command line options

| **Option**       | **Description** |
| ---------------- | --------------- |
| `-0[octal]`      | specify record separator (`\0`, if no argument) |
| `-a`             | autosplit mode with `-n` or `-p` (splits `$_` into `$F`) |
| `-c`             | check syntax only |
| `-Cdirectory`    | cd to directory before executing your script |
| `-d`             | set debugging flags (set `$DEBUG` to true) |
| `-e 'command'`   | one line of script. Several `-e`'s allowed. Omit [programfile] |
| `-Eex[:in]`      | specify the default external and internal character encodings |
| `-Fpattern`      | `split()` pattern for autosplit (`-a`) |
| `-i[extension]`  | edit `ARGV` files in place (make backup if extension supplied) |
| `-Idirectory`    | specify `$LOAD_PATH` directory (may be used more than once) |
| `-l`             | enable line ending processing |
| `-n`             | assume `'while gets(); ... end'` loop around your script |
| `-p`             | assume loop like `-n` but print line also like `sed` |
| `-rlibrary`      | require the library before executing your script |
| `-s`             | enable some switch parsing for switches after script name |
| `-S`             | look for the script using PATH environment variable |
| `-v`             | print the version number, then turn on verbose mode |
| `-w`             | turn warnings on for your script |
| `-W[level=2\|:category]`    | set warning level; 0=silence, 1=medium, 2=verbose |
| `-x[directory]`  | strip off text before #!ruby line and perhaps cd to directory |
| `--jit`          | enable JIT with default options (experimental) |
| `--jit-[option]` | enable JIT with an option (experimental) |
| `-h`             | show this message, `--help` for more info |

This chapter will show examples with `-e`, `-n`, `-p` and `-a` options. Some more options will be covered in later chapters, but not all of them are discussed in this book.

## Executing Ruby code

If you want to execute a `ruby` program file, one way is to pass the filename as argument to the `ruby` command.

```bash
$ echo 'puts "Hello Ruby"' > hello.rb
$ ruby hello.rb
Hello Ruby
```

For short programs, you can also directly pass the code as an argument to the `-e` option.

```bash
$ ruby -e 'puts "Hello Ruby"'
Hello Ruby

$ # multiple statements can be issued separated by ;
$ ruby -e 'x=25; y=12; puts x**y'
59604644775390625
$ # or use -e option multiple times
$ ruby -e 'x=25' -e 'y=12' -e 'puts x**y'
59604644775390625
```

## Filtering

`ruby` one-liners can be used for filtering lines matched by a regexp, similar to `grep`, `sed` and `awk`. And similar to many command line utilities, `ruby` can accept input from both `stdin` and file arguments.

```bash
$ # sample stdin data
$ printf 'gate\napple\nwhat\nkite\n'
gate
apple
what
kite

$ # print all lines containing 'at'
$ # same as: grep 'at' and sed -n '/at/p' and awk '/at/'
$ printf 'gate\napple\nwhat\nkite\n' | ruby -ne 'print if /at/'
gate
what

$ # print all lines NOT containing 'e'
$ # same as: grep -v 'e' and sed -n '/e/!p' and awk '!/e/'
$ printf 'gate\napple\nwhat\nkite\n' | ruby -ne 'print if !/e/'
what
```

By default, `grep`, `sed` and `awk` will automatically loop over input content line by line (with `\n` as the line distinguishing character). The `-n` or `-p` option will enable this feature for `ruby`. As seen before, the `-e` option accepts code as command line argument. Many shortcuts are available to reduce the amount of typing needed.

In the above examples, a regular expression (defined by the pattern between a pair of forward slashes) has been used to filter the input. When the input string isn't specified in a conditional context (for example: `if`), the test is performed against global variable `$_`, which has the contents of the input line (the correct term would be input **record**, see [Record separators](#record-separators) chapter). To summarize, in a conditional context:

* `/regexp/` is a shortcut for `$_ =~ /regexp/`
* `!/regexp/` is a shortcut for `$_ !~ /regexp/`

`$_` is also the default argument for `print` method, which is why it is generally preferred in one-liners over `puts` method. More such defaults that apply to the `print` method will be discussed later.

>![info](images/info.svg) See [ruby-doc: Pre-defined global variables](https://ruby-doc.org/core-3.0.0/doc/globals_rdoc.html) for documentation on `$_`, `$&`, etc.

Here's an example with file input instead of `stdin`.

```bash
$ cat table.txt
brown bread mat hair 42
blue cake mug shirt -7
yellow banana window shoes 3.14

$ # same as: grep -oE '[0-9]+$' table.txt
$ ruby -ne 'puts $& if /\d+$/' table.txt
42
7
14
```

>![info](images/info.svg) The [learn_ruby_oneliners repo](https://github.com/learnbyexample/learn_ruby_oneliners/tree/master/example_files) has all the files used in examples.

## Substitution

Use `sub` and `gsub` methods for search and replace requirements. By default, these methods operate on `$_` when the input string isn't provided. For these examples, `-p` option is used instead of `-n` option, so that the value of `$_` is automatically printed after processing each input line.

```bash
$ # for each input line, change only first ':' to '-'
$ # same as: sed 's/:/-/' and awk '{sub(/:/, "-")} 1'
$ printf '1:2:3:4\na:b:c:d\n' | ruby -pe 'sub(/:/, "-")'
1-2:3:4
a-b:c:d

$ # for each input line, change all ':' to '-'
$ # same as: sed 's/:/-/g' and awk '{gsub(/:/, "-")} 1'
$ printf '1:2:3:4\na:b:c:d\n' | ruby -pe 'gsub(/:/, "-")'
1-2-3-4
a-b-c-d
```

You might wonder how `$_` is modified without the use of `!` methods. The reason is that these methods are part of Kernel (see [ruby-doc: Kernel](https://ruby-doc.org/core-3.0.0/Kernel.html) for details) and are available only when `-n` or `-p` options are used.

* `sub(/regexp/, repl)` is a shortcut for `$_.sub(/regexp/, repl)` and `$_` will be updated if substitution succeeds
* `gsub(/regexp/, repl)` is a shortcut for `$_.gsub(/regexp/, repl)` and `$_` gets updated if substitution succeeds

>![info](images/info.svg) This book assumes you are already familiar with regular expressions. If not, you can check out my free [Ruby Regexp](https://learnbyexample.github.io/Ruby_Regexp/) book.

## Field processing

Consider the sample input file shown below with fields separated by a single space character.

```bash
$ cat table.txt
brown bread mat hair 42
blue cake mug shirt -7
yellow banana window shoes 3.14
```

Here's some examples that is based on specific field rather than the entire line. The `-a` option will cause the input line to be split based on whitespaces and the field contents can be accessed using `$F` global variable. Leading and trailing whitespaces will be suppressed and won't result in empty fields. More details is discussed in [Default field separation](#default-field-separation) section.

```bash
$ # print the second field of each input line
$ # same as: awk '{print $2}' table.txt
$ ruby -ane 'puts $F[1]' table.txt
bread
cake
banana

$ # print lines only if last field is a negative number
$ # same as: awk '$NF<0' table.txt
$ ruby -ane 'print if $F[-1].to_f < 0' table.txt
blue cake mug shirt -7

$ # change 'b' to 'B' only for the first field
$ # same as: awk '{gsub(/b/, "B", $1)} 1' table.txt
$ ruby -ane '$F[0].gsub!(/b/, "B"); puts $F * " "' table.txt
Brown bread mat hair 42
Blue cake mug shirt -7
yellow banana window shoes 3.14
```

## BEGIN and END

You can use a `BEGIN{}` block when you need to execute something before input is read and a `END{}` block to execute something after all of the input has been processed.

```bash
$ # same as: awk 'BEGIN{print "---"} 1; END{print "%%%"}'
$ # note the use of ; after BEGIN block
$ seq 4 | ruby -pe 'BEGIN{puts "---"}; END{puts "%%%"}'
---
1
2
3
4
%%%
```

## ENV hash

When it comes to automation and scripting, you'd often need to construct commands that can accept input from user, file, output of a shell command, etc. As mentioned before, this book assumes `bash` as the shell being used. To access environment variables of the shell, you can call the special hash variable `ENV` with the name of the environment variable as a string key.

```bash
$ # existing environment variable
$ # output shown here is for my machine, would differ for you
$ ruby -e 'puts ENV["HOME"]'
/home/learnbyexample
$ ruby -e 'puts ENV["SHELL"]'
/bin/bash

$ # defined along with ruby command
$ # note that the variable is placed before the shell command
$ word='hello' ruby -e 'puts ENV["word"]'
hello
$ # the input characters are preserved as is
$ ip='hi\nbye' ruby -e 'puts ENV["ip"]'
hi\nbye
```

Here's another example when a regexp is passed as an environment variable content.

```bash
$ cat word_anchors.txt
sub par
spar
apparent effort
two spare computers
cart part tart mart

$ # assume 'r' is a shell variable that has to be passed to the ruby command
$ r='\Bpar\B'
$ rgx="$r" ruby -ne 'print if /#{ENV["rgx"]}/' word_anchors.txt
apparent effort
two spare computers
```

You can also make use of the `-s` option to assign a global variable.

```bash
$ r='\Bpar\B'
$ ruby -sne 'print if /#{$rgx}/' -- -rgx="$r" word_anchors.txt
apparent effort
two spare computers
```

>![info](images/info.svg) As an example, see my repo [ch: command help](https://github.com/learnbyexample/command_help/blob/master/ch) for a practical shell script, where commands are constructed dynamically.

## Executing external commands

You can call external commands using the `system` Kernel method. See [ruby-doc: system](https://ruby-doc.org/core-3.0.0/Kernel.html#method-i-system) for documentation.

```bash
$ ruby -e 'system("echo Hello World")'
Hello World

$ ruby -e 'system("wc -w <word_anchors.txt")'
12

$ ruby -e 'system("seq -s, 10 > out.txt")'
$ cat out.txt
1,2,3,4,5,6,7,8,9,10
```

Return value of `system` or global variable `$?` can be used to act upon the exit status of the command issued.

```bash
$ ruby -e 'es=system("ls word_anchors.txt"); puts es'
word_anchors.txt
true
$ ruby -e 'system("ls word_anchors.txt"); puts $?'
word_anchors.txt
pid 6087 exit 0
$ ruby -e 'system("ls xyz.txt"); puts $?'
ls: cannot access 'xyz.txt': No such file or directory
pid 6164 exit 2
```

To save the result of an external command, use backticks or `%x`.

```bash
$ ruby -e 'words = `wc -w <word_anchors.txt`; puts words'
12

$ ruby -e 'nums = %x/seq 3/; print nums'
1
2
3
```

>![info](images/info.svg) See also [stackoverflow: difference between exec, system and %x() or backticks](https://stackoverflow.com/q/6338908/4082052)

## Summary

This chapter introduced some of the common options for `ruby` cli usage, along with typical cli text processing examples. While specific purpose cli tools like `grep`, `sed` and `awk` are usually faster, `ruby` has a much more extensive standard library and ecosystem. And you do not have to learn a lot if you are comfortable with `ruby` but not familiar with those cli tools. The next section has a few exercises for you to practice the cli options and text processing use cases.

## Exercises

>![info](images/info.svg) Exercise related files are available from [exercises folder of learn_ruby_oneliners repo](https://github.com/learnbyexample/learn_ruby_oneliners/tree/master/exercises).

>![info](images/info.svg) All the exercises are also collated together in one place at [Exercises.md](https://github.com/learnbyexample/learn_ruby_oneliners/blob/master/exercises/Exercises.md). For solutions, see [Exercise_solutions.md](https://github.com/learnbyexample/learn_ruby_oneliners/blob/master/exercises/Exercise_solutions.md).

**a)** For the input file `ip.txt`, display all lines containing `is`.

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

**b)** For the input file `ip.txt`, display first field of lines *not* containing `y`. Consider space as the field separator for this file.

```bash
##### add your solution here
Hello
This
12345
```

**c)** For the input file `ip.txt`, display all lines containing no more than 2 fields.

```bash
##### add your solution here
Hello World
12345
```

**d)** For the input file `ip.txt`, display all lines containing `is` in the second field.

```bash
##### add your solution here
Today is sunny
```

**e)** For each line of the input file `ip.txt`, replace first occurrence of `o` with `0`.

```bash
##### add your solution here
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

##### add your solution here
-923.1600000000001
```

**g)** Append `.` to all the input lines for the given `stdin` data.

```bash
$ printf 'last\nappend\nstop\n' | ##### add your solution here
last.
append.
stop.
```

**h)** Use contents of `s` variable to display all matching lines from the input file `ip.txt`. Assume that `s` doesn't have any regexp metacharacters. Construct the solution such that there's at least one word character immediately preceding the contents of `s` variable.

```bash
$ s='is'

##### add your solution here
This game is good
```

**i)** Use `system` to display contents of filename present in second field (space separated) of the given input line.

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

# Line processing

Now that you are familiar with basic `ruby` cli usage, this chapter will dive deeper into line processing examples. You'll learn various ways for matching lines based on regular expressions, fixed string matching, line numbers, etc. You'll also see how to group multiple statements and learn about control flow keywords `next` and `exit`.

## Regexp based filtering

As mentioned before, in a conditional context:

* `/regexp/` is a shortcut for `$_ =~ /regexp/`
* `!/regexp/` is a shortcut for `$_ !~ /regexp/`

But, this is not applicable for all types of expressions. For example:

```bash
$ # /at$/ will be 'true' as it is treated as just a Regexp object here
$ printf 'gate\napple\nwhat\n' | ruby -ne '/at$/ && print'
gate
apple
what

$ # same as: ruby -ne 'print if /at$/'
$ printf 'gate\napple\nwhat\n' | ruby -ne '$_ =~ /at$/ && print'
what
```

If required, you can also use different delimiters with `%r`. Quoting from [ruby-doc: Percent Strings](https://ruby-doc.org/core-3.0.0/doc/syntax/literals_rdoc.html#label-Percent+Strings):

>If you are using `(`, `[`, `{`, `<` you must close it with `)`, `]`, `}`, `>` respectively. You may use most other non-alphanumeric characters for percent string delimiters such as `%`, `|`, `^`, etc.

```bash
$ cat paths.txt
/foo/a/report.log
/foo/y/power.log
/foo/abc/errors.log

$ ruby -ne 'print if /\/foo\/a\//' paths.txt
/foo/a/report.log

$ ruby -ne 'print if %r{/foo/a/}' paths.txt
/foo/a/report.log

$ ruby -ne 'print if !%r#/foo/a/#' paths.txt
/foo/y/power.log
/foo/abc/errors.log
```

## Extracting matched portions

You can use regexp related global variables to extract only the matching portions instead of filtering entire matching line. Consider this input file.

```bash
$ cat programming_quotes.txt
Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it by Brian W. Kernighan

Some people, when confronted with a problem, think - I know, I will
use regular expressions. Now they have two problems by Jamie Zawinski

A language that does not affect the way you think about programming,
is not worth knowing by Alan Perlis

There are 2 hard problems in computer science: cache invalidation,
naming things, and off-by-1 errors by Leon Bambrick
```

Here's some examples with regexp global variables.

```bash
$ # note that this will print only the first match for each input line
$ ruby -ne 'puts $& if /\bt\w*[et]\b/' programming_quotes.txt
twice
the
that

$ # extract only capture group portions
$ ruby -ne 'puts $~.captures * "::" if /not (.+)y(.+)/i' programming_quotes.txt
smart enough to debug it b:: Brian W. Kernighan
affect the way ::ou think about programming,
worth knowing b:: Alan Perlis
```

>![info](images/info.svg) See [Working with matched portions](https://learnbyexample.github.io/Ruby_Regexp/working-with-matched-portions.html) chapter from my book for examples with `match` method and regexp global variables.

## match? method

As seen in previous section, using `$_ =~ /regexp/` also sets global variables. If you just need `true` or `false` result, using `match?` method is better suited for performance reasons. The difference would be more visible for large input files.

```bash
$ # same result as: ruby -ne 'print if /on\b/'
$ ruby -ne 'print if $_.match?(/on\b/)' programming_quotes.txt
by definition, not smart enough to debug it by Brian W. Kernighan
There are 2 hard problems in computer science: cache invalidation,
naming things, and off-by-1 errors by Leon Bambrick
```

## tr method

The transliteration method `tr` allows you to specify per character transformation rule. See [ruby-doc: tr](https://ruby-doc.org/core-3.0.0/String.html#method-i-tr) for documentation.

```bash
$ # rot13
$ echo 'Uryyb Jbeyq' | ruby -pe '$_.tr!("a-zA-Z", "n-za-mN-ZA-M")'
Hello World

$ # use ^ at start of first argument to complement specified characters
$ echo 'foo:123:baz' | ruby -pe '$_.tr!("^0-9\n", "-")'
----123----

$ # use empty second argument to delete specified characters
$ echo 'foo:123:baz' | ruby -pe '$_.tr!("^0-9\n", "")'
123

$ # if second list is shorter than number of characters in the first list,
$ # the last character in the second list will be used to fill the gaps
$ s='orange apple appleseed cab'
$ echo "$s" | ruby -pe 'gsub(/\b(?!apple\b)\w++/) {$&.tr("a-z", "1-9")}'
991975 apple 199959554 312
```

## Conditional substitution

These examples combine line filtering and substitution in different ways. As noted before, `sub` and `gsub` Kernel methods update `$_` if substitution succeeds and always return the value of `$_`.

```bash
$ # change commas to hyphens if the input line does NOT contain '2'
$ # prints all input lines even if substitution fails
$ printf '1,2,3,4\na,b,c,d\n' | ruby -pe 'gsub(/,/, "-") if !/2/'
1,2,3,4
a-b-c-d

$ # prints filtered input lines even if substitution fails
$ # for example, the 2nd output line doesn't match 'by'
$ ruby -ne 'print gsub(/by/, "**") if /not/' programming_quotes.txt
** definition, not smart enough to debug it ** Brian W. Kernighan
A language that does not affect the way you think about programming,
is not worth knowing ** Alan Perlis

$ # print only if substitution succeeded
$ # $_.gsub! is required for this scenario
$ ruby -ne 'print if $_.gsub!(/1/, "one")' programming_quotes.txt
naming things, and off-by-one errors by Leon Bambrick
```

## Multiple conditions

It is good to remember that Ruby is a programming language. You have control structures and you can combine multiple conditions using logical operators, methods like `all?`, `any?`, etc. You don't have to create a single complex regexp.

```bash
$ ruby -ne 'print if /not/ && !/it/' programming_quotes.txt
A language that does not affect the way you think about programming,
is not worth knowing by Alan Perlis

$ ruby -ane 'print if /twice/ || $F.size > 12' programming_quotes.txt
Debugging is twice as hard as writing the code in the first place.
Some people, when confronted with a problem, think - I know, I will
```

## next

When `next` is executed, rest of the code will be skipped and the next input line will be fetched for processing. It doesn't affect `BEGIN` or `END` blocks as they are outside the file content loop.

```bash
$ ruby -ne '(puts "%% #{$_}"; next) if /\bpar/;
            puts /s/ ? "X" : "Y"' word_anchors.txt
%% sub par
X
Y
X
%% cart part tart mart
```

**Note** that `()` is used in the above example to group multiple statements to be executed for a single `if` condition. You'll see many more examples with `next` in coming chapters.

## exit

Using `exit` method will cause the `ruby` script to terminate immediately. This is useful to avoid processing unnecessary input content after a termination condition.

```bash
$ # quits after an input line containing 'you' is found
$ ruby -ne 'print; exit if /you/' programming_quotes.txt
Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,

$ # matching line won't be printed in this case
$ ruby -pe 'exit if /you/' programming_quotes.txt
Debugging is twice as hard as writing the code in the first place.
```

Use `tac` to get all lines starting from last occurrence of the search string with respect to entire file content.

```bash
$ tac programming_quotes.txt | ruby -ne 'print; exit if /not/' | tac
is not worth knowing by Alan Perlis

There are 2 hard problems in computer science: cache invalidation,
naming things, and off-by-1 errors by Leon Bambrick
```

You can optionally provide a status code along with the `exit` method.

```bash
$ printf 'sea\neat\ndrop\n' | ruby -ne 'print; exit(2) if /at/'
sea
eat
$ echo $?
2
```

Any code in `END` block will still be executed before exiting. This doesn't apply if `exit` was called from the `BEGIN` block.

```bash
$ ruby -pe 'exit if /cake/' table.txt
brown bread mat hair 42
$ ruby -pe 'exit if /cake/; END{puts "bye"}' table.txt
brown bread mat hair 42
bye

$ ruby -pe 'BEGIN{puts "hi"; exit; puts "hello"}; END{puts "bye"}' table.txt
hi
```

>![warning](images/warning.svg) Be careful if you want to use `exit` with multiple input files, as `ruby` will stop even if there are other files remaining to be processed.

## Line number based processing

Line numbers can also be used as a filtering criteria. It can be accessed using the `$.` global variable.

```bash
$ # print only the 3rd line
$ ruby -ne 'print if $. == 3' programming_quotes.txt
by definition, not smart enough to debug it by Brian W. Kernighan

$ # print 2nd and 5th line
$ ruby -ne 'print if $. == 2 || $. == 5' programming_quotes.txt
Therefore, if you write the code as cleverly as possible, you are,
Some people, when confronted with a problem, think - I know, I will

$ # transliterate only 2nd line
$ printf 'gates\nnot\nused\n' | ruby -pe '$_.tr!("a-z", "*") if $. == 2'
gates
***
used

$ # selecting from particular line number to end of input
$ seq 14 25 | ruby -ne 'print if $. >= 10'
23
24
25
```

The global variable `$<` contains the file handle for the current file input being processed. Use `eof` method to process lines based on end of file condition. See [ruby-doc: eof](https://ruby-doc.org/core-3.0.0/IO.html#method-i-eof) for documentation. You can also use `ARGF` instead of `$<` here, see [ARGV and ARGF](#argv-and-argf) section for details.

```bash
$ # same as: tail -n1 programming_quotes.txt
$ ruby -ne 'print if $<.eof' programming_quotes.txt
naming things, and off-by-1 errors by Leon Bambrick

$ ruby -ne 'puts "#{$.}:#{$_}" if $<.eof' programming_quotes.txt
12:naming things, and off-by-1 errors by Leon Bambrick

$ # multiple file example
$ # same as: tail -q -n1 programming_quotes.txt table.txt
$ ruby -ne 'print if $<.eof' programming_quotes.txt table.txt
naming things, and off-by-1 errors by Leon Bambrick
yellow banana window shoes 3.14
```

For large input files, use `exit` method to avoid processing unnecessary input lines.

```bash
$ seq 3542 4623452 | ruby -ne '(print; exit) if $. == 2452'
5993

$ seq 3542 4623452 | ruby -ne 'print if $. == 250; (print; exit) if $. == 2452'
3791
5993

$ # here is a sample time comparison
$ time seq 3542 4623452 | ruby -ne '(print; exit) if $. == 2452' > f1
real    0m0.050s
$ time seq 3542 4623452 | ruby -ne 'print if $. == 2452' > f2
real    0m0.847s
```

## Flip-Flop operator

You can use Flip-Flop operator to select between pair of matching conditions like line numbers and regexp. See [ruby-doc: Flip-Flop](https://ruby-doc.org/core-3.0.0/doc/syntax/control_expressions_rdoc.html#label-Flip-Flop) for syntax details.

```bash
$ # the range is automatically compared against $. in this context
$ seq 14 25 | ruby -ne 'print if 3..5'
16
17
18

$ # 'print if 3...5' gives same result as above,
$ # you can use include? method to exclude the end range
$ seq 14 25 | ruby -ne 'print if (3...5).include?($.)'
16
17

$ # the range is automatically compared against $_ in this context
$ # note that all the matching ranges are printed
$ ruby -ne 'print if /are/../by/' programming_quotes.txt
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it by Brian W. Kernighan
There are 2 hard problems in computer science: cache invalidation,
naming things, and off-by-1 errors by Leon Bambrick
```

>![info](images/info.svg) See [Records bounded by distinct markers](#records-bounded-by-distinct-markers) section for an alternate, flexible solution.

You can also mix line number and regexp conditions.

```bash
$ ruby -ne 'print if 5../use/' programming_quotes.txt
Some people, when confronted with a problem, think - I know, I will
use regular expressions. Now they have two problems by Jamie Zawinski

$ # same logic as: ruby -pe 'exit if /ll/'
$ # inefficient, but this will work for multiple file inputs
$ ruby -ne 'print if !(/ll/..$<.eof)' programming_quotes.txt table.txt
Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it by Brian W. Kernighan

brown bread mat hair 42
blue cake mug shirt -7
```

>![warning](images/warning.svg) Both conditions can match the same line too! Also, if the second condition doesn't match, lines starting from first condition to the last line of the input will be matched.

```bash
$ # 'worth' matches the 9th line
$ ruby -ne 'print if 9../worth/' programming_quotes.txt
is not worth knowing by Alan Perlis

$ # there's a line containing 'affect' but doesn't have matching pair
$ # so, all lines till the end of input is printed
$ ruby -ne 'print if /affect/../XYZ/' programming_quotes.txt
A language that does not affect the way you think about programming,
is not worth knowing by Alan Perlis

There are 2 hard problems in computer science: cache invalidation,
naming things, and off-by-1 errors by Leon Bambrick
```

## Working with fixed strings

To match strings literally, use the `include?` method for line filtering. Use string argument instead of regexp for fixed string matching with substitution methods.

```bash
$ echo 'int a[5]' | ruby -ne 'print if /a[5]/'
$ echo 'int a[5]' | ruby -ne 'print if $_.include?("a[5]")'
int a[5]

$ echo 'int a[5]' | ruby -pe 'sub(/a[5]/, "b")'
int a[5]
$ echo 'int a[5]' | ruby -pe 'sub("a[5]", "b")'
int b
```

The above example uses double quotes for the string argument, which allows escape sequences like `\t`, `\n`, etc and interpolation with `#{}`. This isn't the case with single quoted string values. Using single quotes within the script from command line requires messing with shell metacharacters. So, use `%q` instead or pass the fixed string to be matched as an environment variable, which can be accessed via the `ENV` hash.

```bash
$ # double quotes allow escape sequences and interpolation
$ ruby -e 'a=5; puts "value of a:\t#{a}"'
value of a:     5

$ # use %q as an alternate to specify single quoted string
$ echo 'int #{a}' | ruby -ne 'print if $_.include?(%q/#{a}/)'
int #{a}
$ echo 'int #{a}' | ruby -pe 'sub(%q/#{a}/, "b")'
int b

$ # or pass the string as environment variable
$ echo 'int #{a}' | s='#{a}' ruby -ne 'print if $_.include?(ENV["s"])'
int #{a}
$ # \\ is special within single quotes, so ENV is the better choice here
$ echo 'int #{a\\}' | s='#{a\\}' ruby -pe 'sub(ENV["s"], "b")'
int b
```

To provide a fixed string in replacement section, environment variable comes in handy again. Need to use block form, since `\` is special in the replacement section.

```bash
$ # \\ will be treated as \ and \0 will backreference entire matched portion
$ echo 'int a' | s='x\\y\0z' ruby -pe 'sub(/a/, ENV["s"])'
int x\yaz

$ # using block form will avoid above issues
$ echo 'int a' | s='x\\y\0z' ruby -pe 'sub(/a/) {ENV["s"]}'
int x\\y\0z
```

Use `start_with?` and `end_with?` methods to restrict the fixed string matching to the start or end of the input line. The line content in `$_` variable contains the `\n` line ending character as well. You can either use `chomp` method explicitly or use the `-l` command line option, which will be discussed in detail in [Record separators](#record-separators) chapter. For now, it is enough to know that `-l` will remove the line ending from `$_` and add it back when `print` is used.

```bash
$ cat eqns.txt
a=b,a-b=c,c*d
a+b,pi=3.14,5e12
i*(t+9-g)/8,4-a+b

$ # start of line
$ s='a+b' ruby -ne 'print if $_.start_with?(ENV["s"])' eqns.txt
a+b,pi=3.14,5e12

$ # end of line
$ # -l option is needed here to remove \n from $_
$ s='a+b' ruby -lne 'print if $_.end_with?(ENV["s"])' eqns.txt
i*(t+9-g)/8,4-a+b
```

Use `index` method if you need more control over the location of the matching strings. You can use either the return value (which gives you the index of the matching string) or use the optional second argument to specify an offset to start searching. See [ruby-doc: index](https://ruby-doc.org/core-3.0.0/String.html#method-i-index) for details.

```bash
$ # same as: $_.include?("a+b")
$ ruby -ne 'print if $_.index("a+b")' eqns.txt
a+b,pi=3.14,5e12
i*(t+9-g)/8,4-a+b

$ # same as: $_.start_with?("a+b")
$ ruby -ne 'print if $_.index("a+b")==0' eqns.txt
a+b,pi=3.14,5e12

$ # since 'index' returns 'nil' if there's no match,
$ # you need some more processing for < or <= numeric comparison
$ ruby -ne '$i = $_.index("="); print if $i && $i < 6' eqns.txt
a=b,a-b=c,c*d

$ # for > or >= comparison, use the optional second argument
$ s='a+b' ruby -ne 'print if $_.index(ENV["s"], 1)' eqns.txt
i*(t+9-g)/8,4-a+b
```

If you need to match entire input line or field, you can use comparison operators.

```bash
$ printf 'a.b\na+b\n' | ruby -lne 'print if /^a.b$/'
a.b
a+b
$ printf 'a.b\na+b\n' | ruby -lne 'print if $_ == %q/a.b/'
a.b

$ printf '1 a.b\n2 a+b\n' | ruby -lane 'print if $F[1] != %q/a.b/'
2 a+b
```

## In-place file editing

You can use the `-i` option to write back the changes to the input file instead of displaying the output on terminal. When an extension is provided as an argument to `-i`, the original contents of the input file gets preserved as per the extension given. For example, if the input file is `ip.txt` and `-i.orig` is used, `ip.txt.orig` will be the backup filename.

```bash
$ cat colors.txt
deep blue
light orange
blue delight

$ # no output on terminal as -i option is used
$ # space is NOT allowed between -i and the extension
$ ruby -i.bkp -pe 'sub(/blue/, "green")' colors.txt
$ # changes are written back to 'colors.txt'
$ cat colors.txt
deep green
light orange
green delight

$ # original file is preserved in 'colors.txt.bkp'
$ cat colors.txt.bkp
deep blue
light orange
blue delight
```

Multiple input files are treated individually and the changes are written back to respective files.

```bash
$ cat t1.txt
have a nice day
bad morning
what a pleasant evening
$ cat t2.txt
worse than ever
too bad

$ ruby -i.bkp -pe 'sub(/bad/, "good")' t1.txt t2.txt
$ ls t?.*
t1.txt  t1.txt.bkp  t2.txt  t2.txt.bkp

$ cat t1.txt
have a nice day
good morning
what a pleasant evening
$ cat t2.txt
worse than ever
too good
```

Sometimes backups are not desirable. Using `-i` option on its own will not create backups. Be careful though, as changes made cannot be undone. In such cases, test the command with sample input before using `-i` option on actual file. You could also use the option with backup, compare the differences with a `diff` program and then delete the backup.

```bash
$ cat fruits.txt
banana
papaya
mango

$ ruby -i -pe 'gsub(/an/, "AN")' fruits.txt
$ cat fruits.txt
bANANa
papaya
mANgo
```

## Summary

This chapter showed various examples of processing only lines of interest instead of entire input file. Filtering can be specified using a regexp, fixed string, line number or a combination of them. You also saw how to combine multiple statements using `()` for compact cli usage. `next` and `exit` are often needed to control the flow of code. The `-i` option is handy for in-place editing.

## Exercises

**a)** Remove only the third line of given input.

```bash
$ seq 34 37 | ##### add your solution here
34
35
37
```

**b)** Display only fourth, fifth, sixth and seventh lines for the given input.

```bash
$ seq 65 78 | ##### add your solution here
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

##### add your solution here
Today is not sunny
You are not funny
```

**d)** For the given `stdin`, display only the first three lines. Avoid processing lines that are not relevant.

```bash
$ seq 14 25 | ##### add your solution here
14
15
16
```

**e)** For the input file `ip.txt`, display all lines from start of the file till the first occurrence of `game`.

```bash
##### add your solution here
Hello World
How are you
This game is good
```

**f)** For the input file `ip.txt`, display all lines that contain `is` but not `good`.

```bash
##### add your solution here
Today is sunny
```

**g)** For the input file `ip.txt`, extract the word before the whole word `is` as well as the word after it. If such a match is found, display the two words around `is` in reversed order. For example, `hi;1 is--234 bye` should be converted to `234:1`. Assume that whole word `is` will not be present more than once in a single line.

```bash
##### add your solution here
good:game
sunny:Today
```

**h)** For the given input string, replace `0xA0` with `0x7F` and `0xC0` with `0x1F`.

```bash
$ s='start address: 0xA0, func1 address: 0xC0'

$ echo "$s" | ##### add your solution here
start address: 0x7F, func1 address: 0x1F
```

**i)** For the input file `text.txt`, replace all occurrences of `in` with `an` and write back the changes to `text.txt` itself. The original contents should get saved to `text.txt.orig`

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

**j)** For the input file `text.txt`, replace all occurrences of `an` with `in` and write back the changes to `text.txt` itself. Do not create backups for this exercise. Note that you should have solved the previous exercise before starting this one.

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

**k)** Find the starting index of first occurrence of `is` or `the` or `was` or `to` for each input line of the file `idx.txt`. Assume all input lines will match at least one of these terms.

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

**l)** Display all lines containing `[4]*` for the given `stdin` data.

```bash
$ printf '2.3/[4]*6\n2[4]5\n5.3-[4]*9\n' | ##### add your solution here
2.3/[4]*6
5.3-[4]*9
```

**m)** For the given input string, replace all lowercase alphabets to `x` only for words starting with `m`.

```bash
$ s='ma2T3a a2p kite e2e3m meet'

$ echo "$s" | ##### add your solution here
xx2T3x a2p kite e2e3m xxxx
```

**n)** For the input file `ip.txt`, delete all characters other than lowercase vowels and newline character. Perform this transformation only between a line containing `you` up to line number `4` (inclusive).

```bash
##### add your solution here
Hello World
oaeou
iaeioo
oaiu
12345
You are funny
```

# Field separators

This chapter will dive deep into field processing. You'll learn how to set input and output field separators, how to use regexps for defining fields and how to work with fixed length fields.

## Default field separation

By default, the `-a` option splits based on one or more sequence of **whitespace** characters. In addition, whitespaces at the start or end of input gets trimmed and won't be part of field contents. Using `-a` is equivalent to `$F = $_.split`. From [ruby-doc: split](https://ruby-doc.org/core-3.0.0/String.html#method-i-split):

>If pattern is a single space, *str* is split on whitespace, with leading and trailing whitespace and runs of contiguous whitespace characters ignored...If pattern is `nil`, the value of `$;` is used. If `$;` is `nil` (which is the default), *str* is split on whitespace as if `' '` were specified.

```bash
$ echo '   a   b   c   ' | ruby -ane 'puts $F.size'
3
$ # note that leading whitespaces isn't part of field content
$ echo '   a   b   c   ' | ruby -ane 'puts $F[0]'
a
$ # note that trailing whitespaces isn't part of field content
$ echo '   a   b   c   ' | ruby -ane 'puts $F[-1] + "."'
c.

$ # here's another example with more whitespace characters thrown in
$ printf '     one \t\f\v two\t\r\tthree  ' | ruby -ane 'puts $F.size'
3
$ printf '     one \t\f\v two\t\r\tthree  ' | ruby -ane 'puts $F[1] + "."'
two.
```

## Input field separator

You can use the `-F` command line option to specify a custom field separator. The value passed to the option will be treated as a regexp. Note that `-a` option is also necessary for `-F` option to work.

```bash
$ # use ':' as input field separator
$ echo 'goal:amazing:whistle:kwality' | ruby -F: -ane 'puts $F[0], $F[-1]'
goal
kwality

$ # use quotes to avoid clashes with shell special characters
$ echo 'one;two;three;four' | ruby -F';' -ane 'puts $F[2]'
three

$ echo 'load;err_msg--\ant,r2..not' | ruby -F'\W+' -ane 'puts $F[2]'
ant

$ echo 'hi.bye.hello' | ruby -F'\.' -ane 'puts $F[1]'
bye

$ # count number of vowels for each input line
$ printf 'COOL\nnice car\n' | ruby -F'(?i)[aeiou]' -ane 'puts $F.size - 1'
2
3
```

No need to use field separation to access individual characters. See [ruby-doc: Encoding](https://ruby-doc.org/core-3.0.0/Encoding.html) for details on handling different string encodings.

```bash
$ echo 'apple' | ruby -ne 'puts $_[0]'
a

$ ruby -e 'puts Encoding.default_external'
UTF-8
$ LC_ALL=C ruby -e 'puts Encoding.default_external'
US-ASCII

$ echo 'fox:αλεπού' | ruby -ne 'puts $_[4..5]'
αλ
$ # use -E option to explicitly specify external/internal encodings
$ echo 'fox:αλεπού' | ruby -E UTF-8:UTF-8 -ne 'puts $_[4..5]'
αλ
```

>![warning](images/warning.svg) If the custom field separator with `-F` option doesn't affect the newline character, then the last element can contain the newline character.

```bash
$ # last element will not have newline character with default -a
$ # as leading/trailing whitespaces are trimmed with default split
$ echo 'cat dog' | ruby -ane 'puts "[#{$F[-1]}]"'
[dog]

$ # last element will have newline character since field separator is ':'
$ echo 'cat:dog' | ruby -F: -ane 'puts "[#{$F[-1]}]"'
[dog
]
$ # unless the input itself doesn't have newline character
$ printf 'cat:dog' | ruby -F: -ane 'puts "[#{$F[-1]}]"'
[dog]
```

The newline character can also show up as the content of last field.

```bash
$ # both leading and trailing whitespaces are trimmed
$ echo '  a b   c   ' | ruby -ane 'puts $F.size'
3

$ # leading empty element won't be removed here
$ # and last element will have newline character
$ echo ':a:b:c:' | ruby -F: -ane 'puts $F.size'
5
```

As mentioned before, the `-l` option is helpful if you wish to remove the newline character (more details will be discussed in [Record separators](#record-separators) chapter). A side effect of removing the newline character before applying `split` is that a trailing empty field will also get removed (you can explicitly call `split` method with `-1` as limit to prevent this).

```bash
$ # -l will remove the newline character
$ echo 'cat:dog' | ruby -F: -lane 'puts "[#{$F[-1]}]"'
[dog]
$ # -l will also cause 'print' method to append the newline character
$ echo 'cat:dog' | ruby -F: -lane 'print "[#{$F[-1]}]"'
[dog]

$ # since newline character is chomped, last element is empty
$ # which is then removed due to default 'split' behavior
$ echo ':a:b:c:' | ruby -F: -lane 'puts $F.size'
4
$ # explicit call to split with -1 as limit will preserve the empty element
$ echo ':a:b:c:' | ruby -lane 'puts $_.split(/:/, -1).size'
5
```

## Output field separator

There are a few ways to affect the separator to be used while displaying multiple values. The value of `$,` global variable is used as the separator when multiple arguments are passed to the `print` method. This is usually used in combination with `-l` option so that a newline character is appended automatically as well. The `join` method also uses `$,` as the default value.

```bash
$ ruby -lane 'BEGIN{$, = " "}; print $F[0], $F[2]' table.txt
brown mat
blue mug
yellow window
```

The other options include manually building the output string within double quotes. Or, use the `join` method. Note that `-l` option is used in the examples below as a good practice even when not needed.

```bash
$ ruby -lane 'puts "#{$F[0]} #{$F[2]}"' table.txt
brown mat
blue mug
yellow window

$ echo 'Sample123string42with777numbers' | ruby -F'\d+' -lane 'puts $F.join(",")'
Sample,string,with,numbers

$ s='goal:amazing:whistle:kwality'
$ echo "$s" | ruby -F: -lane 'puts $F.values_at(-1, 1, 0).join("-")'
kwality-amazing-goal
$ # you can also use the '*' operator
$ echo "$s" | ruby -F: -lane '$F.append(42); puts $F * "::"'
goal::amazing::whistle::kwality::42
```

## scan method

The `-F` option uses the `split` method to get field values from input content. In contrast, `scan` method allows you to define what should the fields be made up of. And `scan` method does not have the concept of removing empty trailing fields nor does it have arguments like `limit`.

```bash
$ s='Sample123string42with777numbers'

$ # define fields to be one or more consecutive digits
$ echo "$s" | ruby -lne 'puts $_.scan(/\d+/)[1]'
42

$ # define fields to be one or more consecutive alphabets
$ echo "$s" | ruby -lne 'puts $_.scan(/[a-z]+/i) * ","'
Sample,string,with,numbers
```

A simple `split` fails for `csv` input where fields can contain embedded delimiter characters. For example, a field content `"fox,42"` when `,` is the delimiter.

```bash
$ s='eagle,"fox,42",bee,frog'

$ # simply using , as separator isn't sufficient
$ echo "$s" | ruby -F, -lane 'puts $F[1]'
"fox
```

While [ruby-doc: CSV](https://ruby-doc.org/stdlib-3.0.0/libdoc/csv/rdoc/CSV.html) library should be preferred for robust `csv` parsing, `scan` can be used for simple workarounds.

```bash
$ echo "$s" | ruby -lne 'puts $_.scan(/"[^"]*"|[^,]+/)[1]'
"fox,42"
```

## Fixed width processing

The `unpack` method is more than just a different way of using string slicing. It supports various formats and pre-processing, see [ruby-doc: unpack](https://ruby-doc.org/core-3.0.0/String.html#method-i-unpack) for details.

In the example below, `a` indicates arbitrary binary string. The optional number that follows indicates length of the field.

```bash
$ cat items.txt
apple   fig banana
50      10  200

$ # here field widths have been assigned such that
$ # extra spaces are placed at the end of each field
$ ruby -ne 'puts $_.unpack("a8a4a6") * ","' items.txt
apple   ,fig ,banana
50      ,10  ,200
$ ruby -ne 'puts $_.unpack("a8a4a6")[1]' items.txt
fig 
10  
```

You can specify characters to be ignored with `x` followed by optional length.

```bash
$ # first field is 5 characters
$ # then 3 characters are ignored and 3 characters for second field
$ # then 1 character is ignored and 6 characters for third field
$ ruby -ne 'puts $_.unpack("a5x3a3xa6") * ","' items.txt
apple,fig,banana
50   ,10 ,200
```

Using `*` will cause remaining characters of that particular format to be consumed. Here `Z` is used to process ASCII NUL separated string.

```bash
$ printf 'banana\x0050\x00' | ruby -ne 'puts $_.unpack("Z*Z*") * ":"'
banana:50

$ # first field is 5 characters, then 3 characters are ignored
$ # all the remaining characters are assigned to second field
$ ruby -ne 'puts $_.unpack("a5x3a*") * ","' items.txt
apple,fig banana
50   ,10  200
```

Unpacking isn't always needed, simple string slicing might suffice.

```bash
$ echo 'b 123 good' | ruby -ne 'puts $_[2,3]'
123
$ echo 'b 123 good' | ruby -ne 'puts $_[6,4]'
good

$ # replacing arbitrary slice
$ echo 'b 123 good' | ruby -lpe '$_[2,3] = "gleam"'
b gleam good
```

## Assorted field processing methods

Having seen command line options and features commonly used for field processing, this section will highlight some of the built-in array and Enumerable methods. There's just too many to meaningfully cover them in all in detail, so consider this to be just a brief overview of features.

First up, regexp based field selection. `grep(cond)` and `grep_v(cond)` are specialized filter methods that perform `cond === object` test check. See [stackoverflow: What does the === operator do in Ruby?](https://stackoverflow.com/q/4467538/4082052) for more details.

```bash
$ s='goal:amazing:42:whistle:kwality:3.14'

$ # fields containing 'in' or 'it' or 'is'
$ echo "$s" | ruby -F: -lane 'puts $F.grep(/i[nts]/) * ":"'
amazing:whistle:kwality

$ # fields NOT containing a digit character
$ echo "$s" | ruby -F: -lane 'puts $F.grep_v(/\d/) * ":"'
goal:amazing:whistle:kwality
```

The `map` method helps to transform each element according to the logic passed to it.

```bash
$ s='goal:amazing:42:whistle:kwality:3.14'
$ echo "$s" | ruby -F: -lane 'puts $F.map(&:upcase) * ":"'
GOAL:AMAZING:42:WHISTLE:KWALITY:3.14

$ # you can also use numbered parameters: {_1.to_i ** 2}
$ echo '23 756 -983 5' | ruby -ane 'puts $F.map {|n| n.to_i ** 2} * " "'
529 571536 966289 25

$ echo 'AaBbCc' | ruby -lne 'puts $_.chars.map(&:ord) * " "'
65 97 66 98 67 99

$ echo '3.14,17,6' | ruby -F, -ane 'puts $F.map(&:to_f).sum'
26.14
```

The `filter` method (which has other aliases and opposites too) is handy to construct all kinds of selection conditions. You can combine with `map` by using the `filter_map` method.

```bash
$ s='hour hand band mat heated pineapple'

$ echo "$s" | ruby -ane 'puts $F.filter {|w| w[0]!="h" && w.size<6}'
band
mat

$ echo "$s" | ruby -ane 'puts $F.filter_map {|w|
                w.gsub(/[ae]/, "X") if w[0]=="h"}'
hour
hXnd
hXXtXd
```

The `reduce` method can be used to perform an action against all the elements of an array and get a singular value as the result.

```bash
$ # sum of input numbers with initial value of 100
$ echo '3.14,17,6' | ruby -F, -lane 'puts $F.map(&:to_f).reduce(100, :+)'
126.14

$ # product of input numbers
$ echo '3.14,17,6' | ruby -F, -lane 'puts $F.map(&:to_f).reduce(:*)'
320.28000000000003
$ echo '3.14,17,6' | ruby -F, -lane 'puts $F.reduce(1) {|op,n| op*n.to_f}'
320.28000000000003
```

Here's some examples with `sort`, `sort_by` and `uniq` methods for arrays and strings.

```bash
$ s='floor bat to dubious four'
$ echo "$s" | ruby -ane 'puts $F.sort * ":"'
bat:dubious:floor:four:to
$ echo "$s" | ruby -ane 'puts $F.sort_by(&:size) * ":"'
to:bat:four:floor:dubious

$ # numeric sort example
$ echo '23 756 -983 5' | ruby -lane 'puts $F.sort_by(&:to_i) * ":"'
-983:5:23:756

$ echo 'foobar' | ruby -lne 'puts $_.chars.sort.reverse * ""'
roofba

$ s='try a bad to good i teal by nice how'
$ # longer words first, ascending alphabetic order as tie-breaker
$ echo "$s" | ruby -ane 'puts $F.sort { |a, b|
                [b.size, a] <=> [a.size, b] } * ":"'
good:nice:teal:bad:how:try:by:to:a:i

$ s='3,b,a,3,c,d,1,d,c,2,2,2,3,1,b'
$ # note that the input order of elements is preserved
$ echo "$s" | ruby -F, -lane 'puts $F.uniq * ","'
3,b,a,c,d,1,2
```

Here's an example for sorting in descending order based on header column names.

```bash
$ cat marks.txt
Dept    Name    Marks
ECE     Raj     53
ECE     Joel    72
EEE     Moi     68
CSE     Surya   81
EEE     Tia     59
ECE     Om      92
CSE     Amy     67

$ ruby -ane 'idx = $F.each_index.sort {|i,j| $F[j] <=> $F[i]} if $.==1;
             puts $F.values_at(*idx) * "\t"' marks.txt
Name    Marks   Dept
Raj     53      ECE
Joel    72      ECE
Moi     68      EEE
Surya   81      CSE
Tia     59      EEE
Om      92      ECE
Amy     67      CSE
```

The `shuffle` method randomizes the order of elements.

```bash
$ s='floor bat to dubious four'
$ echo "$s" | ruby -ane 'puts $F.shuffle * ":"'
bat:floor:dubious:to:four

$ echo 'foobar' | ruby -lne 'print $_.chars.shuffle * ""'
bofrao
```

Use `sample` method to get one or more elements of an array in random order.

```bash
$ s='hour hand band mat heated pineapple'

$ echo "$s" | ruby -ane 'puts $F.sample'
band
$ echo "$s" | ruby -ane 'puts $F.sample(2)'
pineapple
hand
```

## Summary

This chapter discussed various ways in which you can split (or define) the input into fields and manipulate them. There's many more examples to be discussed related to fields in upcoming chapters.

## Exercises

**a)** Extract only the contents between `()` or `)(` from each input line. Assume that `()` characters will be present only once every line.

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

##### add your solution here
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
##### add your solution here
Lin
Cy
Ith
```

**d)** Display the number of word characters for the given inputs. Word definition here is same as used in regular expressions. Can you construct a solution with `gsub` and one without substitution functions?

```bash
$ # solve using gsub
$ echo 'hi there' | ##### add your solution here
7

$ # solve without using substitution functions
$ echo 'u-no;co%."(do_12:as' | ##### add your solution here
12
```

**e)** Construct a solution that works for both the given sample inputs and the corresponding output shown.

```bash
$ s1='1 "grape" and "mango" and "guava"'
$ s2='("a 1""d""c-2""b")'

$ echo "$s1" | ##### add your solution here
"grape","guava","mango"
$ echo "$s2" | ##### add your solution here
"a 1","b","c-2","d"
```

**f)** Display only the third and fifth characters from each input line.

```bash
$ printf 'restore\ncat one\ncricket' | ##### add your solution here
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

##### add your solution here
1.3,rs,0.134563
3.8,NA,6
5.2,ye,8.2387
4.2,kt,45.1
```

**h)** For the input file `scores.csv`, display the header as well as any row which contains `b` or `t` (irrespective of case) in the first field.

```bash
##### add your solution here
Name,Maths,Physics,Chemistry
Blue,67,46,99
Ort,68,72,66
Ith,100,100,100
```

**i)** Extract all whole words that contains `42` but not at the edge of a word. Assume a word cannot contain `42` more than once.

```bash
$ s='hi42bye nice1423 bad42 cool_42a 42fake'
$ echo "$s" | ##### add your solution here
hi42bye
nice1423
cool_42a
```

**j)** For the input file `scores.csv`, add another column named `GP` which is calculated out of `100` by giving `50%` weightage to `Maths` and `25%` each for `Physics` and `Chemistry`.

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

**k)** For the input file `mixed_fs.txt`, retain only first two fields from each input line. The input and output field separators should be space for first two lines and `,` for the rest of the lines.

```bash
$ cat mixed_fs.txt
rose lily jasmine tulip
pink blue white yellow
car,mat,ball,basket
light green,brown,black,purple

##### add your solution here
rose lily
pink blue
car,mat
light green,brown
```

**l)** For the given space separated numbers, filter only numbers in the range `20` to `1000` (inclusive).

```bash
$ echo '20 -983 5 756 634223' | ##### add your solution here
20 756
```

**m)** For the given space separated words, randomize the order of characters for each word.

```bash
$ s='this is a sample sentence'

$ # sample randomized output shown here, could be different for you
$ echo "$s" | ##### add your solution here
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
##### add your solution here
bot
art

$ # descending order
##### add your solution here
toe
reed
```

**o)** For the given space separated words, extract the three longest words.

```bash
$ s='I bought two bananas and three mangoes'

$ echo "$s" | ##### add your solution here
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

##### add your solution here
apple,1,mango
apple,2,mango
apple,5,mango
wry,4,look
pencil,3,paper
pencil,8,paper
```

# Record separators

So far, you've seen examples where `ruby` automatically splits input line by line based on the `\n` newline character. Just like you can control how those lines are further split into fields using `-a`, `-F` options and other features, `ruby` provides a way to control what constitutes a line in the first place. In `ruby` parlance, the term **record** is used to describe the contents that gets placed in the `$_` global variable.

## Input record separator

By default, newline character is used as input record separator. You can change the `$/` global variable to specify a different input record separator. Unlike field separators, you can only use string, regexp isn't allowed.

```bash
$ # changing input record separator to comma
$ # note the content of second record, newline is just another character
$ # also note that by default record separator stays with the record contents
$ printf 'this,is\na,sample' | ruby -ne 'BEGIN{$/ = ","}; puts "#{$.})#{$_}"'
1)this,
2)is
a,
3)sample

$ # use -l option to chomp the record separator
$ printf 'this,is\na,sample' | ruby -lne 'BEGIN{$/ = ","}; puts "#{$.})#{$_}"'
1)this
2)is
a
3)sample
```

Here's a multicharacter example:

```bash
$ cat report.log
blah blah Error: second record starts
something went wrong
some more details Error: third record
details about what went wrong

$ # uses 'Error:' as the input record separator
$ # prints all the records that contains 'something'
$ ruby -lne 'BEGIN{$/ = "Error:"}; print if /something/' report.log
 second record starts
something went wrong
some more details 
```

## Single character separator with -0 option

The `-0` command line option can be used to specify a single character record separator, represented with zero to three octal digits.

```bash
$ s='this:is:a:sample:string'

$ # '072' is octal for : character
$ # -l is used to chomp the separator
$ echo "$s" | ruby -0072 -lne 'puts "#{$.}) #{$_}"'
1) this
2) is
3) a
4) sample
5) string

$ # print all records containing 'a'
$ echo "$s" | ruby -0072 -lne 'puts $_ if /a/'
a
sample
```

>![info](images/info.svg) The character that gets appended to `print` method when `-l` is used is based on the value of input record separator at that point. Here's some examples to clarify this point.

```bash
$ s='this:is:a:sample:string'

$ # here record separator is still the default \n when -l is used
$ # so \n gets appended for 'print' method usage
$ # note that chomp doesn't depend on the order
$ # same as: echo "$s" | ruby -lne 'BEGIN{$/=":"}; print if /a/'
$ echo "$s" | ruby -l -0072 -ne 'print if /a/'
a
sample

$ # here -l is defined after -0, so : gets appended for 'print'
$ echo "$s" | ruby -0072 -lne 'print if /a/'
a:sample:
```

Recall that default `-a` will split input record based on whitespaces and remove leading/trailing whitespaces. Now that you've seen how input record separator can be something other than newline, here's an example to show the full effect of default record splitting.

```bash
$ # ':' character is the input record separator here
$ s='   a\t\tb\n\t\n:1000\n\n\n\n123 7777:x  y \n \n z  '
$ printf '%b' "$s" | ruby -0072 -lane 'puts $F * ","'
a,b
1000,123,7777
x,y,z
```

>![info](images/info.svg) Note that by default `chomp` will remove `\r\n` line endings as well from the input record. But, you'll get only `\n` in the output if you are relying on the `-l` option.

```bash
$ printf 'apple\r\nfig\r\n' | cat -v
apple^M
fig^M

$ printf 'apple\r\nfig\r\n' | ruby -lne 'print' | cat -v
apple
fig
```

## NUL separator and slurping

If the `-0` option is used without an argument, the ASCII NUL character will be considered as the input record separator.

```bash
$ printf 'foo\0bar\0' | cat -v
foo^@bar^@

$ # could also be golfed to: ruby -l0pe ''
$ printf 'foo\0bar\0' | ruby -l -0 -ne 'print'
foo
bar
```

Any octal value of `400` and above will cause the entire input to be slurped as a single string. Idiomatically, `777` is used. Slurping entire file makes it easier to solve some problems, but be careful to not use it for large files that might not fit available memory.

```bash
$ cat paths.txt
/foo/a/report.log
/foo/y/power.log
/foo/abc/errors.log
$ ruby -0777 -pe 'sub(%r{(?<!\A)/.+/}m, "/")' paths.txt
/foo/errors.log

$ # replicate entire input as many times as needed
$ seq 2 | ruby -0777 -ne 'print $_ * 2'
1
2
1
2
```

## Paragraph mode

As a special case, using `-00` or setting `$/` to empty string will invoke paragraph mode. Two or more consecutive newline characters will act as the record separator. Consider the `programming_quotes.txt` sample file, shown here again for convenience:

```bash
$ cat programming_quotes.txt
Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it by Brian W. Kernighan

Some people, when confronted with a problem, think - I know, I will
use regular expressions. Now they have two problems by Jamie Zawinski

A language that does not affect the way you think about programming,
is not worth knowing by Alan Perlis

There are 2 hard problems in computer science: cache invalidation,
naming things, and off-by-1 errors by Leon Bambrick
```

Here's some examples of processing the input file paragraph wise.

```bash
$ # all paragraphs containing 'you'
$ # note that the record separator is preserved as there's no chomp
$ ruby -00 -ne 'print if /you/' programming_quotes.txt
Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it by Brian W. Kernighan

A language that does not affect the way you think about programming,
is not worth knowing by Alan Perlis

$ # all paragraphs containing exactly two lines
$ ruby -F'\n' -00 -ane 'print if $F.size == 2' programming_quotes.txt
Some people, when confronted with a problem, think - I know, I will
use regular expressions. Now they have two problems by Jamie Zawinski

A language that does not affect the way you think about programming,
is not worth knowing by Alan Perlis

There are 2 hard problems in computer science: cache invalidation,
naming things, and off-by-1 errors by Leon Bambrick
```

If the paragraphs are separated by more than two consecutive newlines, the extra newlines will not be part of the record content.

```bash
$ s='a\n\n\n\n\n\n\n\n12\n34\n\nhi\nhello\n'

$ # note that -l option isn't being used here
$ printf '%b' "$s" | ruby -00 -ne 'print if $. <= 2'
a

12
34

```

Any leading newlines (only newlines, not other whitespace characters) in the input data file will be trimmed and not lead to empty records. This is similar to how `-a` treats whitespaces for default field separation.

```bash
$ s='\n\n\na\n\n12\n34\n\nhi\nhello\n\n\n\n'

$ # note that -l is used to chomp the record separator here
$ printf '%b' "$s" | ruby -00 -lne 'puts "#{$_}\n---" if $. <= 2'
a
---
12
34
---

$ # max. of two trailing newlines will be preserved if -l isn't used
$ printf '%b' "$s" | ruby -00 -lne 'puts "#{$_}\n---" if $<.eof'
hi
hello
---

$ printf '%b' "$s" | ruby -00 -ne 'END{puts $.}'
3
$ printf '%b' "$s" | ruby -00 -ne 'BEGIN{$/="\n\n"}; END{puts $.}'
5
```

If you wish to avoid the extra empty line at the end of the output for paragraph mode (or similar situations with other custom record separators), you can either post process the output to remove the extra empty line or add some logic like shown below.

```bash
$ # single paragraph output, no empty line at the end
$ ruby -l -00 -ne '(print $s, $_; $s="\n") if /code/' programming_quotes.txt
Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it by Brian W. Kernighan

$ # multiple paragraph output with empty line between the paragraphs
$ ruby -l -00 -ne '(print $s, $_; $s="\n") if /you/' programming_quotes.txt
Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it by Brian W. Kernighan

A language that does not affect the way you think about programming,
is not worth knowing by Alan Perlis
```

## Output record separator

You can use `$\` to specify the string that gets appended to the `print` method. This is will override changes due to `-l` option, if any.

```bash
$ # recall that input record separator isn't removed by default
$ seq 2 | ruby -ne 'print'
1
2
$ # this will add four more characters after the already present newline
$ seq 2 | ruby -ne 'BEGIN{$\ = "---\n"}; print'
1
---
2
---

$ # change NUL record separator to dot and newline
$ # -l here helps to chomp the NUL character
$ # -l also sets NUL to be added to print, but gets overridden in BEGIN block
$ printf 'foo\0bar\0' | ruby -0 -lpe 'BEGIN{$\ = ".\n"}'
foo.
bar.
```

Many a times, you need to change output record separator depending upon contents of input record or some other condition. The `cond ? expr1 : expr2` ternary operator is often used in such scenarios. The below example assumes that input is evenly divisible, you'll have to add more logic if that is not the case.

```bash
$ # same as: ruby -pe 'sub(/\n/, "-") if $. % 3 != 0'
$ seq 6 | ruby -lpe '$\ = $. % 3 != 0 ? "-" : "\n"'
1-2-3
4-5-6
```

## Summary

This chapter showed you how to change the way input content is split into records and how to set the string to be appended when `print` is used. The paragraph mode is useful for processing multiline records separated by one or more empty lines. You also learned how to set ASCII NUL as the record separator and how to slurp entire input as a single string.

## Exercises

**a)** The input file `jumbled.txt` consists of words separated by various delimiters. Display all words that contain `an` or `at` or `in` or `it`, one per line.

```bash
$ cat jumbled.txt
overcoats;furrowing-typeface%pewter##hobby
wavering:concession/woof\retailer

##### add your solution here
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
##### add your solution here
Hello World,How are you,This game is good,Today is sunny,12345,You are funny

$ # if there's only one line in input, again make sure there's no trailing ','
$ # and that there's a newline character at the end of the line
$ printf 'foo' | paste -sd,
foo
$ printf 'foo' | ##### add your solution here
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
##### add your solution here
Just do-it
Believe it

Today is sunny
Not a bit funny
No doubt you like it too
```

**d)** For the input file `sample.txt`, change all paragraphs into single line by joining lines using `.` and a space character as the separator. And add a final `.` to each paragraph.

```bash
$ # note that there's no extra empty line at the end of expected output
##### add your solution here
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
$ printf "$s" | ##### add your solution here
mango:100;;grapes:75;;
```

# Multiple file input

You have seen control structures like `BEGIN`, `END` and methods like `next` and `exit` that affect the entire input contents. This chapter will discuss features that help to make decisions around individual files when there are multiple files passed as input.

## ARGV and ARGF

The `ARGV` array contains the list of files passed to the `ruby` script. Once an input file is processed, it is removed from this list. You can dynamically manipulate this array if you wish to change the flow of input being processed. The `$*` global variable can also be used instead of `ARGV`.

```bash
$ # note that only -e option is used here
$ # can also use 'puts $*' instead of 'puts ARGV'
$ ruby -e 'puts ARGV' f[1-3].txt greeting.txt
f1.txt
f2.txt
f3.txt
greeting.txt

$ # ARGV continuously ejects the filename being processed
$ # f1.txt and f2.txt have 1 line each, table.txt has 3 lines
$ ruby -ne 'puts "#{ARGV.size}: " + ARGV * ","' f[12].txt table.txt
2: f2.txt,table.txt
1: table.txt
0: 
0: 
0: 
```

`ARGF` (or the `$<` global variable) represents the filehandle of the current file (that was passed as an argument to the `ruby` script) being processed. If `ARGV` is empty, then `ARGF` will process `stdin` data if available. If you explicitly call the `close` method on `ARGF`, it will reset the `$.` variable. See [ruby-doc: ARGF](https://ruby-doc.org/core-3.0.0/ARGF.html) for documentation.

```bash
$ # logic to do something at the start of each input file
$ # can also use $<.eof instead of ARGF.eof
$ ruby -ne 'puts "--- #{ARGF.filename} ---" if $. == 1;
            print;
            ARGF.close if ARGF.eof' greeting.txt table.txt
--- greeting.txt ---
Hi there
Have a nice day
Good bye
--- table.txt ---
brown bread mat hair 42
blue cake mug shirt -7
yellow banana window shoes 3.14

$ # do something at the end of a file
$ # same as: tail -q -n1 greeting.txt table.txt
$ ruby -ne 'print if ARGF.eof' greeting.txt table.txt
Good bye
yellow banana window shoes 3.14
```

Here's some more examples.

```bash
$ # same as: awk 'FNR==2{print; nextfile}' greeting.txt table.txt
$ ruby -ne '(print; ARGF.close) if $.==2' greeting.txt table.txt
Have a nice day
blue cake mug shirt -7

$ # same as: head -q -n1 and awk 'FNR>1{nextfile} 1'
$ # can also use: ruby -pe 'ARGF.close'
$ ruby -pe 'ARGF.close if $.>=1' greeting.txt table.txt
Hi there
brown bread mat hair 42
```

You can use methods like `read`, `readline`, `readlines`, `gets`, etc to explicitly get data from specific filehandle. `ARGF` is the default source for some of these methods like `readlines`, `gets`, etc as they are part of Kernel (see [ruby-doc: Kernel](https://ruby-doc.org/core-3.0.0/Kernel.html) for details).

```bash
$ # note that only -e option is used
$ # same as: ruby -e 'puts ARGF.gets' greeting.txt
$ ruby -e 'puts gets' greeting.txt
Hi there

$ ruby -e 'puts gets, "---", ARGF.read' greeting.txt
Hi there
---
Have a nice day
Good bye

$ ruby -e 'puts readlines' greeting.txt
Hi there
Have a nice day
Good bye

$ ruby -e 'puts ARGF.readchar' greeting.txt
H
```

## STDIN

The `STDIN` filehandle is useful to distinguish between files passed as argument and `stdin` data. See [Comparing records](#comparing-records) section for more examples.

```bash
$ # with no file arguments, readline works on stdin data
$ printf 'apple\nmango\n' | ruby -e 'puts readline'
apple

$ # with file arguments, readline doesn't work on stdin data
$ printf 'apple\nmango\n' | ruby -e 'puts readline' greeting.txt
Hi there

$ # use STDIN to work on stdin data irrespective of file arguments
$ printf 'apple\nmango\n' | ruby -e 'puts STDIN.readline' greeting.txt
apple
```

## Skipping remaining contents per file

You have seen examples where `exit` method is used to avoid processing unnecessary records for the current and any other files yet to be processed. Sometimes, you need to skip only contents for the current file and move on to next file for processing. The `close` method seen previously comes in handy for such cases.

```bash
$ # print filename if it contains 'I' anywhere in the file
$ # same as: grep -l 'I' f[1-3].txt greeting.txt
$ # same as: ruby -0777 -ne 'puts ARGF.filename if /I/'
$ # but slurping is dependent on size of input files and available memory
$ ruby -ne '(puts ARGF.filename; ARGF.close) if /I/' f[1-3].txt greeting.txt
f1.txt
f2.txt

$ # print filename if it contains a word ending with 'e'
$ # and 'bat' or 'mat' (irrespective of case) anywhere in the file
$ # same as: ruby -0777 -ne 'puts ARGF.filename if /(?=.*?e\b)(?i).*[bm]at/m'
$ ruby -ne '$m1=true if /e\b/; $m2=true if /[bm]at/i;
            (puts ARGF.filename; $m1=$m2=false; ARGF.close; next) if $m1 && $m2;
            $m1=$m2=false if ARGF.eof' f[1-3].txt greeting.txt
f3.txt
```

## Summary

This chapter introduced features for processing multiple file inputs and constructing file level decisions. These will show up in many more examples in coming chapters as well.

## Exercises

**a)** Print the last field of first two lines for the input files passed as arguments to the `ruby` script. Assume space as the field separators for these two files. To make the output more informative, print filenames and a separator as shown in the output below. Assume input files will have at least two lines.

```bash
$ # assume table.txt ip.txt are passed as file inputs
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

**b)** For the given list of input files, display all filenames that contain `at` or `fun` in the third field in any of the input lines. Assume space as the field separator and note that some lines may not have three fields.

```bash
$ # assume sample.txt secrets.txt ip.txt table.txt are passed as file inputs
##### add your solution here
secrets.txt
ip.txt
table.txt
```

**c)** Print the first two lines for each of the input files `ip.txt`, `sample.txt` and `table.txt`. Also, add a separator between the results as shown below (note that the separator isn't present at the end of the output). Assume input files will have at least two lines.

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

# Processing multiple records

Often, you need to consider multiple lines at a time to make a decision, such as the paragraph mode examples seen earlier. Sometimes, you need to match a particular record and then get records surrounding the matched record. Solution to these type of problems often take the form of state machines. See [softwareengineering: FSM examples](https://softwareengineering.stackexchange.com/questions/47806/examples-of-finite-state-machines) if you are not familiar with state machines.

## Processing consecutive records

You might need a condition that should satisfy something for one record and something else for the very next record. There are many ways to tackle this problem. One possible solution is to use a variable to save the previous record and then create the required conditional expression using the variable and `$_` which already has the current record content.

```bash
$ # match and print two consecutive records
$ # first record should contain 'as' and second record should contain 'not'
$ # note that this will not work if you use normal variable instead of $p
$ ruby -ne 'puts $p, $_ if /not/ && $p=~/as/; $p = $_' programming_quotes.txt
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it by Brian W. Kernighan

$ # same filtering as above, but print only the first record
$ ruby -ne 'puts $p if /not/ && $p=~/as/; $p = $_' programming_quotes.txt
Therefore, if you write the code as cleverly as possible, you are,

$ # same filtering as above, but print only the second record
$ ruby -ne 'print if /not/ && $p=~/as/; $p = $_' programming_quotes.txt
by definition, not smart enough to debug it by Brian W. Kernighan
```

## Context matching

Sometimes you want not just the matching records, but the records relative to the matches as well. For example, it could be to see the comments at start of a function block that was matched while searching a program file. Or, it could be to see extended information from a log file while searching for a particular error message.

Consider this sample input file:

```bash
$ cat context.txt
blue
    toy
    flower
    sand stone
light blue
    flower
    sky
    water
language
    english
    hindi
    spanish
    tamil
programming language
    python
    kotlin
    ruby
```

**Case 1:** Here's an example that emulates `grep --no-group-separator -A<n>` functionality. The `$n && $n>=0 && $n-=1` trick used in the example below works like this:

* If `$n` hasn't been initialized yet, the expression becomes `false` and thus prevents `nil` being compared to a number
* If `$n=1`
    * `1>=0 &&  0` --> evaluates to `true` and `$n` becomes `0`
    * `0>=0 && -1` --> evaluates to `true` and `$n` becomes `-1`
    * `-1>=0 &&  ` --> evaluates to `false` and `$n` no longer changes

```bash
$ # same as: grep --no-group-separator -A1 'blue'
$ # print matching line as well as the one that follows it
$ ruby -ne '$n=1 if /blue/; print if $n && $n>=0 && $n-=1' context.txt
blue
    toy
light blue
    flower

$ # for overlapping cases, $n gets re-assigned before $n becomes negative
$ ruby -ne '$n=1 if /toy|flower/; print if $n && $n>=0 && $n-=1' context.txt
    toy
    flower
    sand stone
    flower
    sky
```

Once you've understood the above examples, the rest of the examples in this section should be easier to comprehend. They are all variations of the logic used above and re-arranged to solve the use case being discussed.

**Case 2:** Print `n` records after the matching record. This is similar to previous case, except that the matching record isn't printed.

```bash
$ # print 2 lines after matching line
$ # note that comparison here is $n>0 and not $n>=0
$ ruby -ne 'print if $n && $n>0 && $n-=1; $n=2 if /language/' context.txt
    english
    hindi
    python
    kotlin
```

**Case 3:** Here's how to print `n`th record after the matching record.

```bash
$ # print only the 3rd line found after matching line
$ # overlapping cases won't work as $n gets re-assigned before going to 0
$ ruby -ne 'print if $n.to_i>0 && ($n-=1)==0; $n=3 if /language/' context.txt
    spanish
    ruby
```

**Case 4:** Printing the matched record and `n` records before it.

```bash
$ # this won't work if there are less than n records before a match
$ ruby -e 'ip=readlines; n=2; ip.each_with_index { |s, i|
           puts ip[i-n..i] if s.match?(/stone/) }' context.txt
    toy
    flower
    sand stone

$ # this will work even if there are less than n records before a match
$ ruby -e 'ip=readlines; n=2; ip.each_with_index { |s, i|
           c=i-n; c=0 if c<0;
           puts ip[c..i] if s.match?(/toy/) }' context.txt
blue
    toy
```

To prevent confusion with overlapping cases, you can add a separation line between the results.

```bash
$ ruby -e 'ip=readlines; n=2; ip.each_with_index { |s, i|
           c=i-n; c=0 if c<0;
           (print $s; puts ip[c..i]; $s="---\n") if s.match?(/toy|flower/) }
          ' context.txt
blue
    toy
---
blue
    toy
    flower
---
    sand stone
light blue
    flower
```

**Case 5:** Print `n`th record before the matching record.

```bash
$ ruby -e 'ip=readlines; n=2; ip.each_with_index { |s, i| c=i-n;
           puts ip[c] if c>=0 && s.match?(/language/) }' context.txt
    sky
    spanish

$ # if the count is small enough, you can save them in variables
$ # this one prints 2nd line before the matching line
$ # $.>2 is needed as first 2 records shouldn't be considered for a match
$ ruby -ne 'print $p2 if $.>2 && /toy|flower/; $p2=$p1; $p1=$_' context.txt
blue
    sand stone
```

You can also use the logic from **Case 3** by applying `tac` twice. This avoids the need to use an array variable.

```bash
$ tac context.txt | ruby -ne 'print if $n.to_i>0 && ($n-=1)==0;
                    $n=2 if /language/' | tac
    sky
    spanish
```

## Records bounded by distinct markers

This section will cover cases where the input file will always contain the same number of starting and ending patterns and arranged in alternating fashion. For example, there cannot be two starting patterns appearing without an ending pattern between them and vice versa. Zero or more records of text can appear inside such groups as well as in between the groups.

The sample file shown below will be used to illustrate examples in this section. For simplicity, assume that the starting pattern is marked by `start` and the ending pattern by `end`. They have also been given group numbers to make it easier to visualize the transformation between input and output for the commands discussed in this section.

```bash
$ cat uniform.txt
mango
icecream
--start 1--
1234
6789
**end 1**
how are you
have a nice day
--start 2--
a
b
c
**end 2**
par,far,mar,tar
```

**Case 1:** Processing all the groups of records based on the distinct markers, including the records matched by markers themselves. For simplicity, the below command will just print all such records.

```bash
$ ruby -ne '$f=true if /start/; print if $f; $f=false if /end/' uniform.txt
--start 1--
1234
6789
**end 1**
--start 2--
a
b
c
**end 2**
```

>![info](images/info.svg) You can also use `ruby -ne 'print if /start/../end/'` but compared to Flip-Flop operator, the state machine format is more suitable to adapt for various cases to follow.

**Case 2:** Processing all the groups of records but excluding the records matched by markers themselves.

```bash
$ ruby -ne '$f=false if /end/; print "* ", $_ if $f;
            $f=true if /start/' uniform.txt
* 1234
* 6789
* a
* b
* c
```

**Case 3-4:** Processing all the groups of records but excluding one of the markers.

```bash
$ ruby -ne '$f=true if /start/; $f=false if /end/; print if $f' uniform.txt
--start 1--
1234
6789
--start 2--
a
b
c

$ ruby -ne 'print if $f; $f=true if /start/; $f=false if /end/' uniform.txt
1234
6789
**end 1**
a
b
c
**end 2**
```

The next four cases are obtained by just using `if !$f` instead of `if $f` from the cases shown above.

**Case 5:** Processing all input records except the groups of records bound by the markers.

```bash
$ # same as: ruby -ne 'print if !(/start/../end/)'
$ ruby -ne '$f=true if /start/; print if !$f; $f=false if /end/' uniform.txt
mango
icecream
how are you
have a nice day
par,far,mar,tar
```

**Case 6** Processing all input records except the groups of records between the markers.

```bash
$ ruby -ne '$f=false if /end/; print if !$f; $f=true if /start/' uniform.txt
mango
icecream
--start 1--
**end 1**
how are you
have a nice day
--start 2--
**end 2**
par,far,mar,tar
```

**Case 7-8:** Similar to case 6, but include only one of the markers.

```bash
$ ruby -ne 'print if !$f; $f=true if /start/; $f=false if /end/' uniform.txt
mango
icecream
--start 1--
how are you
have a nice day
--start 2--
par,far,mar,tar

$ ruby -ne '$f=true if /start/; $f=false if /end/; print if !$f' uniform.txt
mango
icecream
**end 1**
how are you
have a nice day
**end 2**
par,far,mar,tar
```

## Specific blocks

Instead of working with all the groups (or blocks) bound by the markers, this section will discuss how to choose blocks based on additional criteria.

Here's how you can process only the first matching block.

```bash
$ ruby -ne '$f=true if /start/; print if $f; exit if /end/' uniform.txt
--start 1--
1234
6789
**end 1**

$ # use other tricks discussed in previous section as needed
$ ruby -ne 'exit if /end/; print if $f; $f=true if /start/' uniform.txt
1234
6789
```

Getting last block alone involves lot more work, unless you happen to know how many blocks are present in the input file.

```bash
$ # reverse input linewise, change the order of comparison, reverse again
$ # can't be used if record separator has to be something other than newline
$ tac uniform.txt | ruby -ne '$f=true if /end/; print if $f; exit if /start/' | tac
--start 2--
a
b
c
**end 2**

$ # or, save the blocks in a buffer and print the last one alone
$ # << operator concatenates given string to the variable in-place
$ ruby -ne '($f=true; buf=$_; next) if /start/;
            buf << $_ if $f;
            $f=false if /end/;
            END{print buf}' uniform.txt
--start 2--
a
b
c
**end 2**
```

Only the `n`th block.

```bash
$ seq 30 | ruby -ne 'BEGIN{n=2; c=0}; c+=1 if /4/; (print; exit if /6/) if c==n'
14
15
16
```

All blocks greater than `n`th block.

```bash
$ seq 30 | ruby -ne 'BEGIN{n=1; c=0}; ($f=true; c+=1) if /4/;
                     print if $f && c>n; $f=false if /6/'
14
15
16
24
25
26
```

Excluding `n`th block.

```bash
$ seq 30 | ruby -ne 'BEGIN{n=2; c=0}; ($f=true; c+=1) if /4/;
                     print if $f && c!=n; $f=false if /6/'
4
5
6
24
25
26
```

All blocks, only if the block matches an additional condition.

```bash
$ # additional condition here is '15' as one of the lines in the block
$ seq 30 | ruby -ne '($f=true; buf=$_; next) if /4/;
                     buf << $_ if $f;
                     ($f=false; print buf if buf.match?(/^15$/)) if /6/;'
14
15
16
```

## Broken blocks

Sometimes, you can have markers in random order and mixed in different ways. In such cases, to work with blocks without any other marker present in between them, the buffer approach comes in handy again.

```bash
$ cat broken.txt
qqqqqqqqqqqqqqqq
error 1
hi
error 2
1234
6789
state 1
bye
state 2
error 3
xyz
error 4
abcd
state 3
zzzzzzzzzzzzzzzz

$ ruby -ne '($f=true; buf=$_; next) if /error/;
            buf << $_ if $f;
            (print buf if $f; $f=false) if /state/' broken.txt
error 2
1234
6789
state 1
error 4
abcd
state 3
```

## Summary

This chapter covered various examples of working with multiple records. State machines play an important role in deriving solutions for such cases. Knowing various corner cases is also crucial, otherwise a solution that works for one input may fail for others.

Next chapter will discuss use cases where you need to process a file input based on contents of another file.

## Exercises

**a)** For the input file `sample.txt`, print a matching line containing `do` only if the previous line is empty and the line before that contains `you`.

```bash
##### add your solution here
Just do-it
Much ado about nothing
```

**b)** Print only the second matching line respectively for the search terms `do` and `not` for the input file `sample.txt`. Match these terms case insensitively.

```bash
##### add your solution here
No doubt you like it too
Much ado about nothing
```

**c)** For the input file `sample.txt`, print the matching lines containing `are` or `bit` as well as `n` lines around the matching lines. The value for `n` is passed to the `ruby` command as an environment value.

```bash
$ n=1 ##### add your solution here
Good day
How are you

Today is sunny
Not a bit funny
No doubt you like it too

$ # note that first and last line are empty for this case
$ n=2 ##### add your solution here

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
##### add your solution here
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

**f)** For the input file `ruby.md`, replace all occurrences of `ruby` (irrespective of case) with `Ruby`. But, do not replace any matches between ` ```ruby ` and ` ``` ` lines (`ruby` in these markers shouldn't be replaced either).

```bash
##### add your solution here, redirect the output to 'out.md'
$ diff -sq out.md expected.md
Files out.md and expected.md are identical
```

**g)** Print the last two lines for each of the input files `ip.txt`, `sample.txt` and `table.txt`. Also, add a separator between the results as shown below (note that the separator isn't present at the end of the output). Assume input files will have at least two lines.

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

# Two file processing

This chapter focuses on solving problems which depend upon contents of two or more files. These are usually based on comparing records and fields. Sometimes, record number plays a role and some cases need entire file content. You'll also see examples with `-r` command line option and `gets` method.

## Comparing records

Consider the following input files which will be compared line wise in this section.

```bash
$ cat color_list1.txt
teal
light blue
green
yellow

$ cat color_list2.txt
light blue
black
dark green
yellow
```

The `-r` command line option allows to specify a library required for the script. `Set` class is handy for two file processing cases. See [ruby-doc: Set](https://ruby-doc.org/stdlib-3.0.0/libdoc/set/rdoc/Set.html) for documentation.

```bash
$ # common lines
$ # same as: grep -Fxf color_list1.txt color_list2.txt
$ # ARGV.size==1 will be true only for the first file (for two file input)
$ ruby -rset -ne 'BEGIN{s=Set.new}; (s.add($_); next) if ARGV.size==1;
                  print if s.include?($_)' color_list1.txt color_list2.txt
light blue
yellow

$ # lines from color_list2.txt not present in color_list1.txt
$ # same as: grep -vFxf color_list1.txt color_list2.txt
$ ruby -rset -ne 'BEGIN{s=Set.new}; (s.add($_); next) if ARGV.size==1;
                  print if !s.include?($_)' color_list1.txt color_list2.txt
black
dark green

$ # reversing the order of input files gives
$ # lines from color_list1.txt not present in color_list2.txt
$ ruby -rset -ne 'BEGIN{s=Set.new}; (s.add($_); next) if ARGV.size==1;
                  print if !s.include?($_)' color_list2.txt color_list1.txt
teal
green
```

Alternatively, you can store the contents of the two input files as arrays and use set operations between them.

```bash
$ # common lines, output order is based on array to the left of & operator
$ # note that only -e option is used and one of the files is passed as stdin
$ ruby -e 'f1=STDIN.readlines; f2=readlines;
           puts f1 & f2' <color_list1.txt color_list2.txt
light blue
yellow

$ # lines from color_list1.txt not present in color_list2.txt
$ ruby -e 'f1=STDIN.readlines; f2=readlines;
           puts f1 - f2' <color_list1.txt color_list2.txt
teal
green

$ # union of the two files, same as f1 | f2 if read as separate arrays
$ ruby -e 'puts readlines.uniq' color_list1.txt color_list2.txt
teal
light blue
green
yellow
black
dark green
```

## Comparing fields

In the previous section, you saw how to compare whole contents of records between two files. This section will focus on comparing only specific field(s). The below sample file will be one of the two file inputs for examples in this section. Consider whitespace as the field separator, so `-a` option is enough to get the fields.

```bash
$ cat marks.txt
Dept    Name    Marks
ECE     Raj     53
ECE     Joel    72
EEE     Moi     68
CSE     Surya   81
EEE     Tia     59
ECE     Om      92
CSE     Amy     67
```

To start with, here's a single field comparison. The problem statement is to fetch all the records from `marks.txt` if the first field matches any of the departments listed in `dept.txt` file.

```bash
$ cat dept.txt
CSE
ECE

$ # note that dept.txt is used to build the set first
$ ruby -rset -ane 'BEGIN{s=Set.new}; (s.add($F[0]); next) if ARGV.size==1;
                   print if s.include?($F[0])' dept.txt marks.txt
ECE     Raj     53
ECE     Joel    72
CSE     Surya   81
ECE     Om      92
CSE     Amy     67
```

For multiple field comparison, use subset of an array for comparison.

```bash
$ cat dept_name.txt
EEE Moi
CSE Amy
ECE Raj

$ ruby -rset -ane 'BEGIN{s=Set.new}; (s.add($F); next) if ARGV.size==1;
                   print if s.include?($F[0..1])' dept_name.txt marks.txt
ECE     Raj     53
EEE     Moi     68
CSE     Amy     67
```

In this example, one of the field is used for numerical comparison. `Hash` is needed here instead of `Set`.

```bash
$ cat dept_mark.txt
ECE 70
EEE 65
CSE 80

$ # match Dept and minimum marks specified in dept_mark.txt
$ # since the marks are consistently 2-digits, string comparison is enough
$ # otherwise, you need to convert to numbers before comparison
$ ruby -ane 'BEGIN{d={}}; (d[$F[0]]=$F[1]; next) if ARGV.size==1;
             print if d.key?($F[0]) && $F[2] >= d[$F[0]]' dept_mark.txt marks.txt
ECE     Joel    72
EEE     Moi     68
CSE     Surya   81
ECE     Om      92
```

Here's an example of adding a new field.

```bash
$ # adds a new grade column based on marks in 3rd column
$ ruby -lane 'BEGIN{g = %w[D C B A S]};
              $F.append($.==1 ? "Grade" : g[$F[-1].to_i/10 - 5]);
              print $F * "\t"' marks.txt
Dept    Name    Marks   Grade
ECE     Raj     53      D
ECE     Joel    72      B
EEE     Moi     68      C
CSE     Surya   81      A
EEE     Tia     59      D
ECE     Om      92      S
CSE     Amy     67      C
```

## gets

`gets` (or the `readline`) method allows you to read a record from a file on demand. This is most useful when you need something based on record number. The following example shows how you can replace `m`th line from a file with `n`th line from another file.

```bash
$ ruby -pe 'BEGIN{m=3; n=2; n.times {$s = STDIN.gets}};
            $_ = $s if $. == m' <greeting.txt table.txt
brown bread mat hair 42
blue cake mug shirt -7
Have a nice day
```

Here's an example where two files are processed simultaneously. This doesn't implement error detection for difference in number of lines between the two files though.

```bash
$ # print line from greeting.txt if last column of corresponding line
$ # from table.txt is a positive number
$ # STDIN.gets will override $_ which is why $_ is saved to another variable
$ ruby -ne 'a=$_; n = STDIN.gets.split[-1].to_f;
            print a if n > 0' <table.txt greeting.txt
Hi there
Good bye
```

## Multiline fixed string substitution

You can use file slurping for fixed string multiline search and replace requirements. Both `sub` and `gsub` methods allow matching fixed string if the first argument is a string instead of a regexp object. Since `\` is special in the replacement section, you'll have to use block form to provide the replacement string.

The below example is substituting complete lines. The solution will work for partial lines as well, provided there is no newline character at the end of `search.txt` and `repl.txt` files.

```bash
$ head -n2 table.txt > search.txt
$ cat repl.txt
2$1$&3\0x\\yz
wise ice go goa

$ ruby -0777 -ne 'ARGV.size==2 ? s=$_ : ARGV.size==1 ? r=$_ :
                  print(gsub(s) {r})
                 ' search.txt repl.txt table.txt
2$1$&3\0x\\yz
wise ice go goa
yellow banana window shoes 3.14
```

>![warning](images/warning.svg) Don't save contents of `search.txt` and `repl.txt` in shell variables for passing them to the `ruby` script. Trailing newlines and ASCII NUL characters will cause issues. See [stackoverflow: pitfalls of reading file into shell variable](https://stackoverflow.com/a/22607352/4082052) for details.

## Add file content conditionally

**Case 1:** replace each matching line with entire contents of `STDIN`.

```bash
$ # same as: sed -e '/[ot]/{r dept.txt' -e 'd}' greeting.txt
$ ruby -pe 'BEGIN{r = STDIN.read}; $_ = r if /[ot]/' <dept.txt greeting.txt
CSE
ECE
Have a nice day
CSE
ECE
```

**Case 2:** insert entire contents of `STDIN` before each matching line.

```bash
$ # same as: sed '/nice/e cat dept.txt' greeting.txt
$ ruby -pe 'BEGIN{r = STDIN.read}; print r if /nice/' <dept.txt greeting.txt
Hi there
CSE
ECE
Have a nice day
Good bye
```

**Case 3:** append entire contents of `STDIN` after each matching line.

```bash
$ # same as: sed '/nice/r dept.txt' greeting.txt
$ ruby -pe 'BEGIN{r = STDIN.read}; $_ << r if /nice/' <dept.txt greeting.txt
Hi there
Have a nice day
CSE
ECE
Good bye
```

## Summary

This chapter discussed use cases where you need to process the contents of two or more files based on entire record/file or field(s). The `ARGV.size==1` trick is handy for such cases (where the number is `n-1` to match first file passed among `n` input files). The `gets` method is helpful for record number based comparisons.

## Exercises

**a)** Use contents of `match_words.txt` file to display matching lines from `jumbled.txt` and `sample.txt`. The matching criteria is that the second word of lines from these files should match the third word of lines from `match_words.txt`.

```bash
$ cat match_words.txt
%whole(Hello)--{doubt}==ado==
just,\joint*,concession<=nice

$ # 'concession' is one of the third words from 'match_words.txt'
$ # and second word from 'jumbled.txt'
##### add your solution here
wavering:concession/woof\retailer
No doubt you like it too
```

**b)** Interleave contents of `secrets.txt` with the contents of a file passed as `stdin` in the format as shown below.

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

**c)** The file `search_terms.txt` contains one search string per line (these have no regexp metacharacters). Construct a solution that reads this file and displays search terms (matched case insensitively) that were found in all of the other input file arguments. Note that these terms should be matched with any part of the line, not just whole words.

```bash
$ cat search_terms.txt
hello
row
you
is
at

$ # ip: search_terms.txt jumbled.txt mixed_fs.txt secrets.txt table.txt oops.txt
##### add your solution here
row
at

$ # ip: search_terms.txt ip.txt sample.txt oops.txt
##### add your solution here
hello
you
is
```

**d)** For the input file `ip.txt`, print all lines that contain `are` and the line that comes after such a line, if any. Use `gets` method to construct the solution.

```bash
$ # note that there shouldn't be an empty line at the end of the output
##### add your solution here
How are you
This game is good
You are funny
```

**Bonus:** Will `grep -A1 'is' ip.txt` give identical results for your solution with `is` as the search term? If not, why?

**e)** Replace third to fifth lines of input file `ip.txt` with second to fourth lines from file `para.txt`

```bash
##### add your solution here
Hello World
How are you
Start working on that
project you always wanted
to, do not let it end
You are funny
```

**f)** Insert one line from `jumbled.txt` before every two lines of `idx.txt`

```bash
##### add your solution here
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

##### add your solution here
print+this
but not that or this
overcoats;furrowing-typeface%pewter##hobby
wavering:concession/woof\retailer
if print+this
but not that
overcoats;furrowing-typeface%pewter##hobby
wavering:concession/woof\retailer
```

# Dealing with duplicates

Often, you need to eliminate duplicates from an input file. This could be based on entire line content or based on certain fields. These are typically solved with `sort` and `uniq` commands. Advantage with `ruby` include regexp based field separators, record separator other than newline, input doesn't have to be sorted, and in general more flexibility because it is a programming language.

## Whole line duplicates

Using `uniq` method on `readlines` is the easiest and most compact solution if memory isn't an issue.

```bash
$ cat purchases.txt
coffee
tea
washing powder
coffee
toothpaste
tea
soap
tea

$ # note that -n or -p isn't needed here
$ # this will work for multiple input files as well
$ ruby -e 'puts readlines.uniq' purchases.txt
coffee
tea
washing powder
toothpaste
soap
```

If there are lots of duplicate lines and having whole input file in an array can cause memory issues, then using a `Set` might help.

```bash
$ # add? returns nil if element already exists, else adds to the set
$ ruby -rset -ne 'BEGIN{s=Set.new}; print if s.add?($_)' purchases.txt
coffee
tea
washing powder
toothpaste
soap
```

## Column wise duplicates

The `set` based solution is easy to adapt for removing field based duplicates. Just change `$_` to the required field(s) after setting the appropriate field separator. With `uniq`, you can use blocks to specify the condition.

```bash
$ cat duplicates.txt
brown,toy,bread,42
dark red,ruby,rose,111
blue,ruby,water,333
dark red,sky,rose,555
yellow,toy,flower,333
white,sky,bread,111
light red,purse,rose,333

$ # based on last field
$ # same as: ruby -e 'puts readlines.uniq {|s| s.split(",")[-1]}'
$ ruby -rset -F, -ane 'BEGIN{s=Set.new}; print if s.add?($F[-1])' duplicates.txt
brown,toy,bread,42
dark red,ruby,rose,111
blue,ruby,water,333
dark red,sky,rose,555
```

Multiple fields example.

```bash
$ # based on first and third field
$ # same as: ruby -e 'puts readlines.uniq {|s| s.split(",").values_at(0,2)}'
$ ruby -rset -F, -ane 'BEGIN{s=Set.new};
                       print if s.add?($F.values_at(0,2))' duplicates.txt
brown,toy,bread,42
dark red,ruby,rose,111
blue,ruby,water,333
yellow,toy,flower,333
white,sky,bread,111
light red,purse,rose,333
```

## Duplicate count

In this section, how many times a duplicate record is found plays a role in determining the output.

First up, printing only a specific numbered duplicate. As seen before, `Hash.new(0)` will initialize value of new key to `0`.

```bash
$ # print only the second occurrence of duplicates based on 2nd field
$ ruby -F, -ane 'BEGIN{h=Hash.new(0)};
                 print if (h[$F[1]]+=1)==2' duplicates.txt
blue,ruby,water,333
yellow,toy,flower,333
white,sky,bread,111

$ # print only the third occurrence of duplicates based on last field
$ ruby -F, -ane 'BEGIN{h=Hash.new(0)};
                 print if (h[$F[-1]]+=1)==3' duplicates.txt
light red,purse,rose,333
```

Next, printing only the last copy of duplicate. Since the count isn't known, the `tac` command comes in handy again.

```bash
$ # reverse the input line-wise, retain first copy and then reverse again
$ tac duplicates.txt | ruby -rset -F, -ane 'BEGIN{s=Set.new};
                       print if s.add?($F[-1])' | tac
brown,toy,bread,42
dark red,sky,rose,555
white,sky,bread,111
light red,purse,rose,333
```

To get all the records based on a duplicate count, you can pass the input file twice. Then use the two file processing trick to make decisions.

```bash
$ # all duplicates based on last column
$ ruby -F, -ane 'BEGIN{h=Hash.new(0)}; ARGV.size==1 ? h[$F[-1]]+=1 :
                 h[$F[-1]]>1 && print' duplicates.txt duplicates.txt
dark red,ruby,rose,111
blue,ruby,water,333
yellow,toy,flower,333
white,sky,bread,111
light red,purse,rose,333

$ # all duplicates based on last column, minimum 3 duplicates
$ ruby -F, -ane 'BEGIN{h=Hash.new(0)}; ARGV.size==1 ? h[$F[-1]]+=1 :
                 h[$F[-1]]>2 && print' duplicates.txt duplicates.txt
blue,ruby,water,333
yellow,toy,flower,333
light red,purse,rose,333

$ # only unique lines based on 3rd column
$ ruby -F, -ane 'BEGIN{h=Hash.new(0)}; ARGV.size==1 ? h[$F[2]]+=1 :
                 h[$F[2]]==1 && print' duplicates.txt duplicates.txt
blue,ruby,water,333
yellow,toy,flower,333
```

## Summary

This chapter showed how to work with duplicate contents, both record and field based. If you don't need regexp based separators and if your input is too big to handle, then specialized command line tools `sort` and `uniq` will be better suited.

## Exercises

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

##### add your solution here
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

##### add your solution here
hehe haha
door floor
6;8 3-4
true blue
hehe bebe
tru eblue
```

**c)** For the input file `twos.txt`, display only unique lines. Assume space as field separator with two fields on each line. Compare the lines irrespective of order of the fields. For example, `hehe haha` and `haha hehe` will be considered as duplicates.

```bash
##### add your solution here
true blue
hehe bebe
tru eblue
```

# Processing structured data

All the examples in previous chapters dealt with simple text formats separated by newline or some other sequence of characters. Such data could be linearly read and processed. However, formats like `json`, `csv`, `xml` and `html` have a specific structure that requires a custom parser before they can be made available for further processing. This chapter will give a brief overview of libraries to parse such structured inputs.

## JSON

The `JSON` built-in module helps you to process `json` data by converting it to a Ruby `hash` object. See [ruby-doc: JSON](https://ruby-doc.org/stdlib-3.0.0/libdoc/json/rdoc/JSON.html) for documentation.

Here's an example of converting possibly minified `json` input to a pretty printed output.

```bash
$ s='{"greeting":"hi","marks":[78,62,93]}'

# ARGF.read is an alternate for -0777 option to slurp entire input
$ echo "$s" | ruby -rjson -e 'ip = JSON.parse(ARGF.read);
                   puts JSON.pretty_generate(ip)'
{
  "greeting": "hi",
  "marks": [
    78,
    62,
    93
  ]
}
```

You can create a shortcut to make it easier for one-liners.

```bash
$ # check if shortcut is available
$ type rq
bash: type: rq: not found

$ # add this to your ~/.bashrc (or the file you use for aliases/functions)
$ rq() { ruby -rjson -e 'ip = JSON.parse(ARGF.read);'"$@" ; }

$ s='{"greeting":"hi","marks":[78,62,93]}'

$ # get value of given key
$ echo "$s" | rq 'puts ip["greeting"]'
hi
$ # you can even pass options after the code snippet
$ echo "$s" | rq 'print ip["marks"]' -l
[78, 62, 93]

$ # use JSON.pretty_generate(ip) if you need pretty output
$ echo "$s" | rq 'ip["marks"][1] = 100; puts JSON.generate(ip)'
{"greeting":"hi","marks":[78,100,93]}
```

Here's another example.

```bash
$ cat sample.json
{
    "fruit": "apple",
    "blue": ["toy", "flower", "sand stone"],
    "light blue": ["flower", "sky", "water"],
    "language": {
        "natural": ["english", "hindi", "spanish"],
        "programming": ["python", "kotlin", "ruby"]
    },
    "physics": 84
}

$ # process top-level keys not containing 'e'
$ rq 'ip.each {|k,v| puts "#{k}:#{v}" if !k.match?(/e/)}' sample.json
fruit:apple
physics:84

$ # process keys within 'language' key that contain 't'
$ rq 'ip["language"].each {|k,v| puts "#{k}:#{v}" if k.match?(/t/)}' sample.json
natural:["english", "hindi", "spanish"]
```

## CSV

The `CSV` built-in class comes in handy for processing `csv` files. See [ruby-doc: CSV](https://ruby-doc.org/stdlib-3.0.0/libdoc/csv/rdoc/CSV.html) for documentation.

Here's a simple example that parses entire input string in one shot.

```bash
$ s='eagle,"fox,42",bee,frog\n1,2,3,4'

$ printf '%b' "$s" | ruby -rcsv -le 'ip=CSV.new(ARGF.read); print ip.read'
[["eagle", "fox,42", "bee", "frog"], ["1", "2", "3", "4"]]

$ printf '%b' "$s" | ruby -rcsv -e 'ip=CSV.new(ARGF.read); puts ip.read[0][1]'
fox,42
```

Here's an example with newline character inside quoted fields. This example directly uses the input filename instead of passing it as command line argument to the `ruby` script.

```bash
$ cat newline.csv
apple,"1
2
3",good
guava,"32
54",nice

$ # this will parse entire input in one shot
$ ruby -rcsv -le 'ip=CSV.read("newline.csv"); print ip'
[["apple", "1\n2\n3", "good"], ["guava", "32\n54", "nice"]]

$ # this is better suited for large inputs
$ ruby -rcsv -e 'CSV.foreach("newline.csv"){ |row|
                 puts row[2] if row[0]=~/pp/ }'
good
```

You can change field separator using the `col_sep` option.

```bash

$ ruby -rcsv -e 'CSV.foreach("marks.txt", :col_sep => "\t"){ |r|
                 puts r * "," if r[0]=="ECE" }'
ECE,Raj,53
ECE,Joel,72
ECE,Om,92
```

The `headers` option will treat the first row as the header, useful for named field processing.

```bash
$ ruby -rcsv -e 'CSV.foreach("marks.txt", :headers => true, :col_sep => "\t"){
                 |r| puts r["Name"] }'
Raj
Joel
Moi
Surya
Tia
Om
Amy
```

You can automatically try to convert field value to given data type(s) using the `converters` option. See [ruby-doc: CSV Field Converters](https://ruby-doc.org/stdlib-3.0.0/libdoc/csv/rdoc/CSV.html#class-CSV-label-Field+Converters) for details.

```bash
$ ruby -rcsv -le 'CSV.foreach("marks.txt", :converters => :integer,
                  :col_sep => "\t"){ print _1 }'
["Dept", "Name", "Marks"]
["ECE", "Raj", 53]
["ECE", "Joel", 72]
["EEE", "Moi", 68]
["CSE", "Surya", 81]
["EEE", "Tia", 59]
["ECE", "Om", 92]
["CSE", "Amy", 67]
```

## XML and HTML

[nokogiri](https://nokogiri.org/) is a popular third-party library to parse `xml` and `html` formats. It also supports working with malformed data.

To parse an input, you can either pass the string or pass a filehandle. You can also pass `URI` filehandle for working with URLs directly.

Both XPath and CSS based selections are available. See also [XPath introduction](https://www.w3schools.com/xml/xpath_intro.asp) and [difference between XPath and CSS Selectors](https://johnresig.com/blog/xpath-css-selectors/). Here's some examples with `xpath` methods.

```bash
$ cat sample.xml
<doc>
    <greeting type="ask">Hi there. How are you?</greeting>
    <greeting type="reply">I am good.</greeting>
    <color>
        <blue>flower</blue>
        <blue>sand stone</blue>
        <light-blue>sky</light-blue>
        <light-blue>water</light-blue>
    </color>
</doc>

$ # all results for 'blue' tag
$ # note that ARGF filehandle is passed directly here
$ ruby -rnokogiri -e 'ip=Nokogiri.XML(ARGF);
        puts ip.xpath("//blue")' sample.xml
<blue>flower</blue>
<blue>sand stone</blue>

$ # selecting based on content of 'blue' tags
$ ruby -rnokogiri -e 'ip=Nokogiri.XML(ARGF);
        puts ip.xpath("//blue").grep(/stone/)' sample.xml
<blue>sand stone</blue>

$ # use 'at_xpath' instead of 'xpath' to get only the first result
$ # or use 'ip.xpath("//blue")[0]' to get specific elements
$ ruby -rnokogiri -e 'ip=Nokogiri.XML(ARGF);
        puts ip.at_xpath("//blue")' sample.xml
<blue>flower</blue>
```

Here's an example with `css` methods. Use `text` method to get the value of the selected tags.

```bash
$ ruby -rnokogiri -e 'ip=Nokogiri.XML(ARGF);
        puts ip.css("light-blue").map(&:text)' sample.xml
sky
water

$ ruby -rnokogiri -e 'ip=Nokogiri.XML(ARGF);
        puts ip.at_css("blue").text' sample.xml
flower
```

Here's an example of matching attributes.

```bash
$ # you can use //@type if you want all attributes that are named as 'type'
$ ruby -rnokogiri -e 'ip=Nokogiri.XML(ARGF);
        puts ip.xpath("//greeting/@type")' sample.xml
ask
reply

$ # match a specific attribute value
$ # same as: ip.css("greeting[type=\"ask\"]")
$ ruby -rnokogiri -e 'ip=Nokogiri.XML(ARGF);
        puts ip.xpath("//greeting[@type=\"ask\"]").text' sample.xml
Hi there. How are you?
```

Here's an example with `html` input.

```bash
$ s='https://learnbyexample.github.io/substitution-with-ripgrep/'
$ url="$s" ruby -rnokogiri -ropen-uri -e 'ip=Nokogiri.XML(URI.open(ENV["url"]));
                 puts ip.css("@href")[5..7]'
https://learnbyexample.github.io
https://learnbyexample.github.io/books
https://learnbyexample.github.io/tags
```

## Summary

This chapter showed basic examples of processing structured data like `json`, `csv`, `xml` and `html` using built-in and third-party libraries. As mentioned in the introduction chapter, using `ruby` one-liners for such tasks helps you avoid learning the syntax and idioms of a custom command line tool. Another advantage is that you have the entire ecosystem of a programming language at disposal once the structured input has been parsed. If performance becomes a concern, then custom cli tools like [jq](https://stedolan.github.io/jq/), [xsv](https://github.com/BurntSushi/xsv) and [xmlstarlet](http://xmlstar.sourceforge.net/doc/UG/xmlstarlet-ug.html) will come in handy.

No exercises for this final chapter (author is lazy and doesn't have much experience with these formats). So, I'll leave you with links for further reading and as a source of exercises.

* [stackoverflow: ruby+json](https://stackoverflow.com/questions/tagged/ruby+json?tab=Votes)
* [stackoverflow: ruby+csv](https://stackoverflow.com/questions/tagged/ruby+csv?tab=Votes)
* [stackoverflow: ruby+xml](https://stackoverflow.com/questions/tagged/ruby+xml?tab=Votes)
* [Illustrated jq tutorial](https://mosermichael.github.io/jq-illustrated/dir/content.html)
* [xmlstarlet tutorial](http://xmlstar.sourceforge.net/doc/UG/xmlstarlet-ug.html)

