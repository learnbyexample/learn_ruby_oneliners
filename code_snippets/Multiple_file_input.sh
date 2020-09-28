## ARGV and ARGF

ruby -e 'puts ARGV' f[1-3].txt greeting.txt

ruby -lne 'print ARGV' f[12].txt table.txt

ruby -ne 'puts "--- #{ARGF.filename} ---" if $. == 1;
          print;
          ARGF.close if ARGF.eof' greeting.txt table.txt

ruby -ne 'print if ARGF.eof' greeting.txt table.txt

ruby -e 'puts gets' greeting.txt

ruby -e 'puts readlines' greeting.txt

ruby -e 'puts ARGF.readchar' greeting.txt

## STDIN

echo 'apple' | ruby -e 'puts readline' greeting.txt

echo 'apple' | ruby -e 'puts STDIN.readline' greeting.txt

## Skipping remaining contents per file

ruby -ne '(puts ARGF.filename; ARGF.close) if /I/' f[1-3].txt greeting.txt

ruby -ne '$m1=true if /o/; $m2=true if /at/;
          (puts ARGF.filename; $m1=$m2=false; ARGF.close; next) if $m1 && $m2;
          $m1=$m2=false if ARGF.eof' f[1-3].txt greeting.txt

