## Processing consecutive records

ruby -ne 'puts $p, $_ if /not/ && $p=~/as/; $p = $_' programming_quotes.txt

ruby -ne 'puts $p if /not/ && $p=~/as/; $p = $_' programming_quotes.txt

ruby -ne 'print if /not/ && $p=~/as/; $p = $_' programming_quotes.txt

## Context matching

cat context.txt

ruby -ne '$n=1 if /blue/; print if $n && $n>=0 && $n-=1' context.txt

ruby -ne '$n=1 if /toy|flower/; print if $n && $n>=0 && $n-=1' context.txt

ruby -ne 'print if $n && $n>0 && $n-=1; $n=2 if /language/' context.txt

ruby -ne 'print if $n.to_i>0 && ($n-=1)==0; $n=3 if /language/' context.txt

ruby -e 'ip=readlines; n=2; ip.each_with_index { |s, i|
         puts ip[i-n..i] if s.match?(/stone/) }' context.txt

ruby -e 'ip=readlines; n=2; ip.each_with_index { |s, i|
         c=i-n; c=0 if c<0;
         puts ip[c..i] if s.match?(/toy/) }' context.txt

ruby -e 'ip=readlines; n=2; ip.each_with_index { |s, i|
         c=i-n; c=0 if c<0;
         (puts ip[c..i]; puts "---") if s.match?(/toy|flower/) }' context.txt

ruby -e 'ip=readlines; n=2; ip.each_with_index { |s, i| c=i-n;
         puts ip[c] if c>=0 && s.match?(/language/) }' context.txt

ruby -ne 'print $p2 if $.>2 && /toy|flower/; $p2=$p1; $p1=$_' context.txt

## Records bounded by distinct markers

cat uniform.txt

ruby -ne '$f=true if /start/; print if $f; $f=false if /end/' uniform.txt

ruby -ne '$f=false if /end/; print "* ", $_ if $f;
          $f=true if /start/' uniform.txt

ruby -ne '$f=true if /start/; $f=false if /end/; print if $f' uniform.txt

ruby -ne 'print if $f; $f=true if /start/; $f=false if /end/' uniform.txt

ruby -ne '$f=true if /start/; print if !$f; $f=false if /end/' uniform.txt

ruby -ne '$f=false if /end/; print if !$f; $f=true if /start/' uniform.txt

ruby -ne 'print if !$f; $f=true if /start/; $f=false if /end/' uniform.txt

ruby -ne '$f=true if /start/; $f=false if /end/; print if !$f' uniform.txt

## Specific blocks

ruby -ne '$f=true if /start/; print if $f; exit if /end/' uniform.txt

ruby -ne 'exit if /end/; print if $f; $f=true if /start/' uniform.txt

tac uniform.txt | ruby -ne '$f=true if /end/; print if $f; exit if /start/' | tac

ruby -ne '($f=true; buf=$_; next) if /start/;
          buf << $_ if $f;
          $f=false if /end/;
          END{print buf}' uniform.txt

seq 30 | ruby -ne 'BEGIN{n=2; c=0}; c+=1 if /4/; (print; exit if /6/) if c==n'

seq 30 | ruby -ne 'BEGIN{n=1; c=0}; ($f=true; c+=1) if /4/;
                   print if $f && c>n; $f=false if /6/'

seq 30 | ruby -ne 'BEGIN{n=2; c=0}; ($f=true; c+=1) if /4/;
                   print if $f && c!=n; $f=false if /6/'

seq 30 | ruby -ne '($f=true; buf=$_; $m=false; next) if /4/;
                   buf << $_ if $f;
                   ($f=false; print buf if $m) if /6/;
                   $m=true if /\A15\Z/'

## Broken blocks

cat broken.txt

ruby -ne '($f=true; buf=$_; next) if /error/;
          buf << $_ if $f;
          (print buf if $f; $f=false) if /state/' broken.txt

