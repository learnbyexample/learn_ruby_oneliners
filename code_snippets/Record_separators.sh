## Input record separator

printf 'this,is\na,sample' | ruby -ne 'BEGIN{$/ = ","}; puts "#{$.})#{$_}"'

printf 'this,is\na,sample' | ruby -lne 'BEGIN{$/ = ","}; puts "#{$.})#{$_}"'

cat report.log

ruby -lne 'BEGIN{$/ = "Error:"}; print if /something/' report.log

## Single character separator with -0 option

s='this:is:a:sample:string'

echo "$s" | ruby -0072 -lne 'puts "#{$.}) #{$_}"'

echo "$s" | ruby -0072 -lne 'puts $_ if /a/'

s='this:is:a:sample:string'

echo "$s" | ruby -l -0072 -ne 'print if /a/'

echo "$s" | ruby -0072 -lne 'print if /a/'

s='   a\t\tb\n\t\n:1000\n\n\n\n123 7777:x  y \n \n z  '

printf '%b' "$s" | ruby -0072 -lane 'puts $F * ","'

printf 'apple\r\nfig\r\n' | cat -v

printf 'apple\r\nfig\r\n' | ruby -lne 'print' | cat -v

## NUL separator and slurping

printf 'foo\0bar\0' | cat -v

printf 'foo\0bar\0' | ruby -l -0 -ne 'print'

cat paths.txt

ruby -0777 -pe 'sub(%r{(?<!\A)/.+/}m, "/")' paths.txt

seq 2 | ruby -0777 -ne 'print $_ * 2'

## Paragraph mode

cat programming_quotes.txt

ruby -00 -ne 'print if /you/' programming_quotes.txt

ruby -F'\n' -00 -ane 'print if $F.size == 2' programming_quotes.txt

s='a\n\n\n\n\n\n\n\n12\n34\n\nhi\nhello\n'

printf '%b' "$s" | ruby -00 -ne 'print if $. <= 2'

s='\n\n\na\n\n12\n34\n\nhi\nhello\n\n\n\n'

printf '%b' "$s" | ruby -00 -lne 'puts "#{$_}\n---" if $. <= 2'

printf '%b' "$s" | ruby -00 -lne 'puts "#{$_}\n---" if $<.eof'

printf '%b' "$s" | ruby -00 -ne 'END{puts $.}'

printf '%b' "$s" | ruby -00 -ne 'BEGIN{$/="\n\n"}; END{puts $.}'

ruby -l -00 -ne '(print $s, $_; $s="\n") if /code/' programming_quotes.txt

ruby -l -00 -ne '(print $s, $_; $s="\n") if /you/' programming_quotes.txt

## Output record separator

seq 2 | ruby -ne 'print'

seq 2 | ruby -ne 'BEGIN{$\ = "---\n"}; print'

printf 'foo\0bar\0' | ruby -0 -lpe 'BEGIN{$\ = ".\n"}'

seq 6 | ruby -lpe '$\ = $. % 3 != 0 ? "-" : "\n"'

