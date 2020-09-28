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

printf 'foo:123:baz' | ruby -ne 'puts $_.tr("^0-9", "-")'

printf 'foo:123:baz' | ruby -ne 'puts $_.tr("^0-9", "")'

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

## Line numbers

ruby -ne 'print if $. == 3' programming_quotes.txt

ruby -ne 'print if $. == 2 || $. == 5' programming_quotes.txt

printf 'gates\nnot\nused\n' | ruby -pe 'gsub(/t/, "*") if $. == 2'

seq 14 25 | ruby -ne 'print if $. >= 10'

ruby -ne 'print if $<.eof' programming_quotes.txt

ruby -ne 'puts "#{$.}:#{$_}" if $<.eof' programming_quotes.txt

ruby -ne 'print if $<.eof' programming_quotes.txt table.txt

seq 14 25 | ruby -ne 'print if 3..5'

seq 14 25 | ruby -ne 'print if (3...5).include?($.)'

seq 3542 4623452 | ruby -ne '(print; exit) if $. == 2452'

seq 3542 4623452 | ruby -ne 'print if $. == 250; (print; exit) if $. == 2452'

time seq 3542 4623452 | ruby -ne '(print; exit) if $. == 2452' > f1

time seq 3542 4623452 | ruby -ne 'print if $. == 2452' > f2

## Fixed string matching

echo 'int a[5]' | ruby -ne 'print if /a[5]/'

echo 'int a[5]' | ruby -ne 'print if $_.include?("a[5]")'

ruby -e 'a=5; puts "value of a:\t#{a}"'

echo 'int #{a}' | ruby -ne 'print if $_.include?(%q/#{a}/)'

echo 'int #{a}' | s='#{a}' ruby -ne 'print if $_.include?(ENV["s"])'

cat eqns.txt

s='a+b' ruby -ne 'print if $_.start_with?(ENV["s"])' eqns.txt

s='a+b' ruby -lne 'print if $_.end_with?(ENV["s"])' eqns.txt

ruby -ne 'print if $_.index("a+b")' eqns.txt

ruby -ne 'print if $_.index("a+b")==0' eqns.txt

ruby -ne '$i = $_.index("="); print if $i && $i < 6' eqns.txt

s='a+b' ruby -ne 'print if $_.index(ENV["s"], 1)' eqns.txt

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

