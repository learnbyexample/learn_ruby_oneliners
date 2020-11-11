## Default field separation

echo '   a   b   c   ' | ruby -ane 'puts $F.size'

echo '   a   b   c   ' | ruby -ane 'puts $F[0]'

echo '   a   b   c   ' | ruby -ane 'puts $F[-1] + "."'

printf '     one \t\f\v two\t\r\tthree  ' | ruby -ane 'puts $F.size'

printf '     one \t\f\v two\t\r\tthree  ' | ruby -ane 'puts $F[1] + "."'

## Input field separator

echo 'goal:amazing:whistle:kwality' | ruby -F: -ane 'puts $F[0], $F[-1]'

echo 'one;two;three;four' | ruby -F';' -ane 'puts $F[2]'

echo 'load;err_msg--\ant,r2..not' | ruby -F'\W+' -ane 'puts $F[2]'

echo 'hi.bye.hello' | ruby -F'\.' -ane 'puts $F[1]'

printf 'COOL\nnice car\n' | ruby -F'(?i)[aeiou]' -ane 'puts $F.size - 1'

echo 'apple' | ruby -ne 'puts $_[0]'

ruby -e 'puts Encoding.default_external'

LC_ALL=C ruby -e 'puts Encoding.default_external'

echo 'fox:αλεπού' | ruby -ne 'puts $_[4..5]'

echo 'fox:αλεπού' | ruby -E UTF-8:UTF-8 -ne 'puts $_[4..5]'

echo 'cat dog' | ruby -ane 'puts "[#{$F[-1]}]"'

echo 'cat:dog' | ruby -F: -ane 'puts "[#{$F[-1]}]"'

printf 'cat:dog' | ruby -F: -ane 'puts "[#{$F[-1]}]"'

echo '  a b   c   ' | ruby -ane 'puts $F.size'

echo ':a:b:c:' | ruby -F: -ane 'puts $F.size'

echo 'cat:dog' | ruby -F: -lane 'puts "[#{$F[-1]}]"'

echo 'cat:dog' | ruby -F: -lane 'print "[#{$F[-1]}]"'

echo ':a:b:c:' | ruby -F: -lane 'puts $F.size'

echo ':a:b:c:' | ruby -lane 'puts $_.split(/:/, -1).size'

## Output field separator

ruby -lane 'BEGIN{$, = " "}; print $F[0], $F[2]' table.txt

ruby -W:no-deprecated -lane 'BEGIN{$, = " "}; print $F[0], $F[2]' table.txt

ruby -lane 'puts "#{$F[0]} #{$F[2]}"' table.txt

echo 'Sample123string42with777numbers' | ruby -F'\d+' -lane 'puts $F.join(",")'

s='goal:amazing:whistle:kwality'

echo "$s" | ruby -F: -lane 'puts $F.values_at(-1, 1, 0).join("-")'

echo "$s" | ruby -F: -lane '$F.append(42); puts $F * "::"'

## scan method

s='Sample123string42with777numbers'

echo "$s" | ruby -lne 'puts $_.scan(/\d+/)[1]'

echo "$s" | ruby -lne 'puts $_.scan(/[a-z]+/i) * ","'

s='eagle,"fox,42",bee,frog'

echo "$s" | ruby -F, -lane 'puts $F[1]'

echo "$s" | ruby -lne 'puts $_.scan(/"[^"]*"|[^,]+/)[1]'

## Fixed width processing

cat items.txt

ruby -ne 'puts $_.unpack("a8a4a6") * ","' items.txt

ruby -ne 'puts $_.unpack("a8a4a6")[1]' items.txt

ruby -ne 'puts $_.unpack("a5x3a3xa6") * ","' items.txt

printf 'banana\x0050\x00' | ruby -ne 'puts $_.unpack("Z*Z*") * ":"'

ruby -ne 'puts $_.unpack("a5x3a*") * ","' items.txt

echo 'b 123 good' | ruby -ne 'puts $_[2,3]'

echo 'b 123 good' | ruby -ne 'puts $_[6,4]'

echo 'b 123 good' | ruby -lpe '$_[2,3] = "gleam"'

## Assorted field processing methods

s='goal:amazing:42:whistle:kwality:3.14'

echo "$s" | ruby -F: -lane 'puts $F.grep(/i[nts]/) * ":"'

echo "$s" | ruby -F: -lane 'puts $F.grep_v(/\d/) * ":"'

s='goal:amazing:42:whistle:kwality:3.14'

echo "$s" | ruby -F: -lane 'puts $F.map(&:upcase) * ":"'

echo '23 756 -983 5' | ruby -ane 'puts $F.map {|n| n.to_i ** 2} * " "'

echo 'AaBbCc' | ruby -lne 'puts $_.chars.map(&:ord) * " "'

echo '3.14,17,6' | ruby -F, -ane 'puts $F.map(&:to_f).sum'

s='hour hand band mat heated pineapple'

echo "$s" | ruby -ane 'puts $F.filter {|w| w[0]!="h" && w.size<6}'

echo "$s" | ruby -ane 'puts $F.filter_map {|w|
              w.gsub(/[ae]/, "X") if w[0]=="h"}'

echo '3.14,17,6' | ruby -F, -lane 'puts $F.map(&:to_f).reduce(100, :+)'

echo '3.14,17,6' | ruby -F, -lane 'puts $F.map(&:to_f).reduce(:*)'

echo '3.14,17,6' | ruby -F, -lane 'puts $F.reduce(1) {|op,n| op*n.to_f}'

s='floor bat to dubious four'

echo "$s" | ruby -ane 'puts $F.sort * ":"'

echo "$s" | ruby -ane 'puts $F.sort_by(&:size) * ":"'

echo '23 756 -983 5' | ruby -lane 'puts $F.sort_by(&:to_i) * ":"'

echo 'foobar' | ruby -lne 'puts $_.chars.sort.reverse * ""'

s='try a bad to good i teal by nice how'

echo "$s" | ruby -ane 'puts $F.sort { |a, b|
              [b.size, a] <=> [a.size, b] } * ":"'

s='3,b,a,3,c,d,1,d,c,2,2,2,3,1,b'

echo "$s" | ruby -F, -lane 'puts $F.uniq * ","'

cat marks.txt

ruby -ane 'idx = $F.each_index.sort {|i,j| $F[j] <=> $F[i]} if $.==1;
           puts $F.values_at(*idx) * "\t"' marks.txt

s='floor bat to dubious four'

echo "$s" | ruby -ane 'puts $F.shuffle * ":"'

echo 'foobar' | ruby -lne 'print $_.chars.shuffle * ""'

s='hour hand band mat heated pineapple'

echo "$s" | ruby -ane 'puts $F.sample'

echo "$s" | ruby -ane 'puts $F.sample(2)'

