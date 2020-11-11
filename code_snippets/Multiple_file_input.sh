## ARGV and ARGF

ruby -e 'puts ARGV' f[1-3].txt greeting.txt

ruby -ne 'puts "#{ARGV.size}: " + ARGV * ","' f[12].txt table.txt

ruby -ne 'puts "--- #{ARGF.filename} ---" if $. == 1;
          print;
          ARGF.close if ARGF.eof' greeting.txt table.txt

ruby -ne 'print if ARGF.eof' greeting.txt table.txt

ruby -ne '(print; ARGF.close) if $.==2' greeting.txt table.txt

ruby -pe 'ARGF.close if $.>=1' greeting.txt table.txt

ruby -e 'puts gets' greeting.txt

ruby -e 'puts gets, "---", ARGF.read' greeting.txt

ruby -e 'puts readlines' greeting.txt

ruby -e 'puts ARGF.readchar' greeting.txt

## STDIN

printf 'apple\nmango\n' | ruby -e 'puts readline'

printf 'apple\nmango\n' | ruby -e 'puts readline' greeting.txt

printf 'apple\nmango\n' | ruby -e 'puts STDIN.readline' greeting.txt

## Skipping remaining contents per file

ruby -ne '(puts ARGF.filename; ARGF.close) if /I/' f[1-3].txt greeting.txt

ruby -ne '$m1=true if /e\b/; $m2=true if /[bm]at/i;
          (puts ARGF.filename; $m1=$m2=false; ARGF.close; next) if $m1 && $m2;
          $m1=$m2=false if ARGF.eof' f[1-3].txt greeting.txt

