## Comparing records

cat colors_1.txt

cat colors_2.txt

ruby -rset -ne 'BEGIN{s=Set.new}; (s.add($_); next) if ARGV.size==1;
                print if s.include?($_)' colors_1.txt colors_2.txt

ruby -rset -ne 'BEGIN{s=Set.new}; (s.add($_); next) if ARGV.size==1;
                print if !s.include?($_)' colors_1.txt colors_2.txt

ruby -rset -ne 'BEGIN{s=Set.new}; (s.add($_); next) if ARGV.size==1;
                print if !s.include?($_)' colors_2.txt colors_1.txt

ruby -e 'f1=STDIN.readlines; f2=readlines;
         puts f1 & f2' <colors_1.txt colors_2.txt

ruby -e 'f1=STDIN.readlines; f2=readlines;
         puts f1 - f2' <colors_1.txt colors_2.txt

ruby -e 'puts readlines.uniq' colors_1.txt colors_2.txt

## Comparing fields

cat marks.txt

cat dept.txt

ruby -rset -ane 'BEGIN{s=Set.new}; (s.add($F[0]); next) if ARGV.size==1;
                 print if s.include?($F[0])' dept.txt marks.txt

cat dept_name.txt

ruby -rset -ane 'BEGIN{s=Set.new}; (s.add($F); next) if ARGV.size==1;
                 print if s.include?($F[0..1])' dept_name.txt marks.txt

cat dept_mark.txt

ruby -ane 'BEGIN{d={}}; (d[$F[0]]=$F[1]; next) if ARGV.size==1;
           print if d.key?($F[0]) && $F[2] >= d[$F[0]]' dept_mark.txt marks.txt

ruby -lane 'BEGIN{g = %w[D C B A S]};
            $F.append($.==1 ? "Grade" : g[$F[-1].to_i/10 - 5]);
            print $F * "\t"' marks.txt

## gets

ruby -pe 'BEGIN{m=3; n=2; n.times {$s = STDIN.gets}};
          $_ = $s if $. == m' <greeting.txt table.txt

ruby -ne 'a=$_; n = STDIN.gets.split[-1].to_f;
          print a if n > 0' <table.txt greeting.txt

## Multiline fixed string substitution

head -n2 table.txt > search.txt

cat repl.txt

ruby -0777 -ne 'ARGV.size==2 ? s=$_ : ARGV.size==1 ? r=$_ :
                print(gsub(s) {r})
               ' search.txt repl.txt table.txt

## Add file content conditionally

ruby -pe 'BEGIN{r = STDIN.read}; $_ = r if /[ot]/' <dept.txt greeting.txt

ruby -pe 'BEGIN{r = STDIN.read}; print r if /nice/' <dept.txt greeting.txt

ruby -pe 'BEGIN{r = STDIN.read}; $_ << r if /nice/' <dept.txt greeting.txt

