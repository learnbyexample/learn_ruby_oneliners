## Executing Ruby code

echo 'puts "Hello Ruby"' > hello.rb

ruby hello.rb

ruby -e 'puts "Hello Ruby"'

ruby -e 'x=25; y=12; puts x**y'

ruby -e 'x=25' -e 'y=12' -e 'puts x**y'

## Filtering

printf 'gate\napple\nwhat\nkite\n'

printf 'gate\napple\nwhat\nkite\n' | ruby -ne 'print if /at/'

printf 'gate\napple\nwhat\nkite\n' | ruby -ne 'print if !/e/'

cat table.txt

ruby -ne 'puts $& if /\d+$/' table.txt

## Substitution

printf '1:2:3:4\na:b:c:d\n' | ruby -pe 'sub(/:/, "-")'

printf '1:2:3:4\na:b:c:d\n' | ruby -pe 'gsub(/:/, "-")'

## Field processing

cat table.txt

ruby -ane 'puts $F[1]' table.txt

ruby -ane 'print if $F[-1].to_f < 0' table.txt

ruby -ane '$F[0].gsub!(/b/, "B"); puts $F * " "' table.txt

## BEGIN and END

seq 4 | ruby -pe 'BEGIN{puts "---"}; END{puts "%%%"}'

## ENV hash

ruby -e 'puts ENV["HOME"]'

ruby -e 'puts ENV["SHELL"]'

word='hello' ruby -e 'puts ENV["word"]'

ip='hi\nbye' ruby -e 'puts ENV["ip"]'

cat word_anchors.txt

r='\Bpar\B'

rgx="$r" ruby -ne 'print if /#{ENV["rgx"]}/' word_anchors.txt

r='\Bpar\B'

ruby -sne 'print if /#{$rgx}/' -- -rgx="$r" word_anchors.txt

## Executing external commands

ruby -e 'system("echo Hello World")'

ruby -e 'system("wc -w <word_anchors.txt")'

ruby -e 'system("seq -s, 10 > out.txt")'

cat out.txt

ruby -e 'es=system("ls word_anchors.txt"); puts es'

ruby -e 'system("ls word_anchors.txt"); puts $?'

ruby -e 'system("ls xyz.txt"); puts $?'

ruby -e 'words = `wc -w <word_anchors.txt`; puts words'

ruby -e 'nums = %x/seq 3/; print nums'

