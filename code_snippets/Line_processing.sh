## Regexp based filtering

printf 'gate\napple\nwhat\n' | ruby -ne '/at$/ && print'

printf 'gate\napple\nwhat\n' | ruby -ne '$_ =~ /at$/ && print'

cat paths.txt

ruby -ne 'print if /\/foo\/a\//' paths.txt

ruby -ne 'print if %r{/foo/a/}' paths.txt

ruby -ne 'print if !%r#/foo/a/#' paths.txt

## Extracting matched portions

cat programming_quotes.txt

ruby -ne 'puts $& if /\bt\w*[et]\b/' programming_quotes.txt

ruby -ne 'puts $~.captures * "::" if /not (.+)y(.+)/i' programming_quotes.txt

## match? method

ruby -ne 'print if $_.match?(/on\b/)' programming_quotes.txt

## tr method

echo 'Uryyb Jbeyq' | ruby -pe '$_.tr!("a-zA-Z", "n-za-mN-ZA-M")'

echo 'foo:123:baz' | ruby -pe '$_.tr!("^0-9\n", "-")'

echo 'foo:123:baz' | ruby -pe '$_.tr!("^0-9\n", "")'

s='orange apple appleseed cab'

echo "$s" | ruby -pe 'gsub(/\b(?!apple\b)\w++/) {$&.tr("a-z", "1-9")}'

## Conditional substitution

printf '1,2,3,4\na,b,c,d\n' | ruby -pe 'gsub(/,/, "-") if !/2/'

ruby -ne 'print gsub(/by/, "**") if /not/' programming_quotes.txt

ruby -ne 'print if $_.gsub!(/1/, "one")' programming_quotes.txt

## Multiple conditions

ruby -ne 'print if /not/ && !/it/' programming_quotes.txt

ruby -ane 'print if /twice/ || $F.size > 12' programming_quotes.txt

## next

ruby -ne '(puts "%% #{$_}"; next) if /\bpar/;
          puts /s/ ? "X" : "Y"' word_anchors.txt

## exit

ruby -ne 'print; exit if /you/' programming_quotes.txt

ruby -pe 'exit if /you/' programming_quotes.txt

tac programming_quotes.txt | ruby -ne 'print; exit if /not/' | tac

printf 'sea\neat\ndrop\n' | ruby -ne 'print; exit(2) if /at/'

echo $?

ruby -pe 'exit if /cake/' table.txt

ruby -pe 'exit if /cake/; END{puts "bye"}' table.txt

ruby -pe 'BEGIN{puts "hi"; exit; puts "hello"}; END{puts "bye"}' table.txt

## Line number based processing

ruby -ne 'print if $. == 3' programming_quotes.txt

ruby -ne 'print if $. == 2 || $. == 5' programming_quotes.txt

printf 'gates\nnot\nused\n' | ruby -pe '$_.tr!("a-z", "*") if $. == 2'

seq 14 25 | ruby -ne 'print if $. >= 10'

ruby -ne 'print if $<.eof' programming_quotes.txt

ruby -ne 'puts "#{$.}:#{$_}" if $<.eof' programming_quotes.txt

ruby -ne 'print if $<.eof' programming_quotes.txt table.txt

seq 3542 4623452 | ruby -ne '(print; exit) if $. == 2452'

seq 3542 4623452 | ruby -ne 'print if $. == 250; (print; exit) if $. == 2452'

time seq 3542 4623452 | ruby -ne '(print; exit) if $. == 2452' > f1

time seq 3542 4623452 | ruby -ne 'print if $. == 2452' > f2

## Flip-Flop operator

seq 14 25 | ruby -ne 'print if 3..5'

seq 14 25 | ruby -ne 'print if (3...5).include?($.)'

ruby -ne 'print if /are/../by/' programming_quotes.txt

ruby -ne 'print if 5../use/' programming_quotes.txt

ruby -ne 'print if !(/ll/..$<.eof)' programming_quotes.txt table.txt

ruby -ne 'print if 9../worth/' programming_quotes.txt

ruby -ne 'print if /affect/../XYZ/' programming_quotes.txt

## Working with fixed strings

echo 'int a[5]' | ruby -ne 'print if /a[5]/'

echo 'int a[5]' | ruby -ne 'print if $_.include?("a[5]")'

echo 'int a[5]' | ruby -pe 'sub(/a[5]/, "b")'

echo 'int a[5]' | ruby -pe 'sub("a[5]", "b")'

ruby -e 'a=5; puts "value of a:\t#{a}"'

echo 'int #{a}' | ruby -ne 'print if $_.include?(%q/#{a}/)'

echo 'int #{a}' | ruby -pe 'sub(%q/#{a}/, "b")'

echo 'int #{a}' | s='#{a}' ruby -ne 'print if $_.include?(ENV["s"])'

echo 'int #{a\\}' | s='#{a\\}' ruby -pe 'sub(ENV["s"], "b")'

echo 'int a' | s='x\\y\0z' ruby -pe 'sub(/a/, ENV["s"])'

echo 'int a' | s='x\\y\0z' ruby -pe 'sub(/a/) {ENV["s"]}'

cat eqns.txt

s='a+b' ruby -ne 'print if $_.start_with?(ENV["s"])' eqns.txt

s='a+b' ruby -lne 'print if $_.end_with?(ENV["s"])' eqns.txt

ruby -ne 'print if $_.index("a+b")' eqns.txt

ruby -ne 'print if $_.index("a+b")==0' eqns.txt

ruby -ne '$i = $_.index("="); print if $i && $i < 6' eqns.txt

s='a+b' ruby -ne 'print if $_.index(ENV["s"], 1)' eqns.txt

printf 'a.b\na+b\n' | ruby -lne 'print if /^a.b$/'

printf 'a.b\na+b\n' | ruby -lne 'print if $_ == %q/a.b/'

printf '1 a.b\n2 a+b\n' | ruby -lane 'print if $F[1] != %q/a.b/'

## In-place file editing

cat colors.txt

ruby -i.bkp -pe 'sub(/blue/, "green")' colors.txt

cat colors.txt

cat colors.txt.bkp

cat t1.txt

cat t2.txt

ruby -i.bkp -pe 'sub(/bad/, "good")' t1.txt t2.txt

ls t?.*

cat t1.txt

cat t2.txt

cat fruits.txt

ruby -i -pe 'gsub(/an/, "AN")' fruits.txt

cat fruits.txt

