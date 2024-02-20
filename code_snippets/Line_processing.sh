## Regexp based filtering

cat table.txt

ruby -ne 'print if /-|ow\b/' table.txt

ruby -ne 'print if !/[ksy]/' table.txt

printf 'gate\napple\nwhat\n' | ruby -ne '/at$/ && print'

printf 'gate\napple\nwhat\n' | ruby -ne '$_ =~ /at$/ && print'

cat paths.txt

ruby -ne 'print if /\/home\/ram\//' paths.txt

ruby -ne 'print if %r{/home/ram/}' paths.txt

ruby -ne 'print if !%r#/home/ram/#' paths.txt

## Extracting matched portions

cat ip.txt

ruby -ne 'puts $& if /\b[a-z]\w*[ty]\b/' ip.txt

ruby -ne 'puts "#{$1}::#{$2}" if /(\b[bdp]\w+).*(\b[a-f]\w+)/i' ip.txt

## match? method

ruby -ne 'print if $_.match?(/[AB]|the\b/)' ip.txt

## Transliteration

echo 'Uryyb Jbeyq' | ruby -pe '$_.tr!("a-zA-Z", "n-za-mN-ZA-M")'

echo 'apple:123:banana' | ruby -pe '$_.tr!("^0-9\n", "-")'

echo 'apple:123:banana' | ruby -pe '$_.tr!("^0-9\n", "")'

s='orange apple appleseed cab'

echo "$s" | ruby -pe 'gsub(/\b(?!apple\b)\w++/) {$&.tr("a-z", "1-9")}'

echo 'APPLESEED gobbledygook' | ruby -pe '$_.tr_s!("a-zA-Z", "a-zA-Z")'

echo 'APPLESEED gobbledygook' | ruby -pe '$_.tr_s!("A-Z", "a-z")'

## Conditional substitution

printf '1,2,3,4\na,b,c,d\n' | ruby -pe 'gsub(/,/, "-") if !/2/'

ruby -ne 'print gsub(/ark/, "[\\0]") if /the/' ip.txt

ruby -ne 'print if $_.gsub!(/\bw\w*t\b/, "{\\0}")' ip.txt

## Multiple conditions

ruby -ne 'print if /ark/ && !/sky/' ip.txt

ruby -ane 'print if /\bthe\b/ || $F.size == 5' ip.txt

## next

ruby -ne '(puts "%% #{$_}"; next) if /\bpar/;
          puts /s/ ? "X" : "Y"' word_anchors.txt

## exit

ruby -ne 'print; exit if /say/' ip.txt

ruby -pe 'exit if /say/' ip.txt

tac ip.txt | ruby -ne 'print; exit if /an/' | tac

printf 'sea\neat\ndrop\n' | ruby -ne 'print; exit(2) if /at/'

echo $?

ruby -pe 'exit if /cake/' table.txt

ruby -pe 'exit if /cake/; END{puts "bye"}' table.txt

ruby -pe 'BEGIN{puts "hi"; exit; puts "hello"}; END{puts "bye"}' table.txt

## Line number based processing

ruby -ne 'print if $. == 3' ip.txt

ruby -ne 'print if $. == 2 || $. == 6' ip.txt

printf 'gates\nnot\nused\n' | ruby -pe '$_.tr!("a-z", "*") if $. == 2'

seq 14 25 | ruby -ne 'print if $. >= 10'

ruby -ne 'print if $<.eof' ip.txt

ruby -ne 'puts "#{$.}:#{$_}" if $<.eof' ip.txt

ruby -ne 'print if $<.eof' ip.txt table.txt

seq 3542 4623452 | ruby -ne '(print; exit) if $. == 2452'

seq 3542 4623452 | ruby -ne 'print if $. == 250; (print; exit) if $. == 2452'

time seq 3542 4623452 | ruby -ne '(print; exit) if $. == 2452' > f1

time seq 3542 4623452 | ruby -ne 'print if $. == 2452' > f2

rm f1 f2

## Flip-Flop operator

seq 14 25 | ruby -ne 'print if 3..5'

seq 14 25 | ruby -ne 'print if (3...5).include?($.)'

ruby -ne 'print if /to/../pl/' ip.txt

ruby -ne 'print if 6../utter/' ip.txt

ruby -ne 'print if !(/\bba/..$<.eof)' ip.txt table.txt

ruby -ne 'print if 7../and/' ip.txt

ruby -ne 'print if 7.../and/' ip.txt

ruby -ne 'print if /Banana/../XYZ/' ip.txt

## Working with fixed strings

printf 'int a[5]\nfig\n1+4=5\n' | ruby -ne 'print if /a[5]/'

printf 'int a[5]\nfig\n1+4=5\n' | ruby -ne 'print if $_.include?("a[5]")'

printf 'int a[5]\nfig\n1+4=5\n' | ruby -pe 'sub(/a[5]/, "b")'

printf 'int a[5]\nfig\n1+4=5\n' | ruby -pe 'sub("a[5]", "b")'

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

ruby -i.bkp -pe 'sub(/blue/, "-green-")' colors.txt

cat colors.txt

cat colors.txt.bkp

cat t1.txt

cat t2.txt

ruby -i.bkp -pe 'sub(/bad/, "good")' t1.txt t2.txt

ls t?.*

cat t1.txt

cat t2.txt

cat fruits.txt

ruby -i -pe 'gsub(/(..)\1/) {$&.upcase}' fruits.txt

cat fruits.txt

