## Whole line duplicates

cat purchases.txt

ruby -e 'puts readlines.uniq' purchases.txt

ruby -rset -ne 'BEGIN{s=Set.new}; print if s.add?($_)' purchases.txt

## Column wise duplicates

cat duplicates.txt

ruby -rset -F, -ane 'BEGIN{s=Set.new}; print if s.add?($F[-1])' duplicates.txt

ruby -rset -F, -ane 'BEGIN{s=Set.new};
                     print if s.add?($F.values_at(0,2))' duplicates.txt

## Duplicate count

ruby -F, -ane 'BEGIN{h=Hash.new(0)};
               print if (h[$F[1]]+=1)==2' duplicates.txt

ruby -F, -ane 'BEGIN{h=Hash.new(0)};
               print if (h[$F[-1]]+=1)==3' duplicates.txt

tac duplicates.txt | ruby -rset -F, -ane 'BEGIN{s=Set.new};
                     print if s.add?($F[-1])' | tac

ruby -F, -ane 'BEGIN{h=Hash.new(0)}; ARGV.size==1 ? h[$F[-1]]+=1 :
               h[$F[-1]]>1 && print' duplicates.txt duplicates.txt

ruby -F, -ane 'BEGIN{h=Hash.new(0)}; ARGV.size==1 ? h[$F[-1]]+=1 :
               h[$F[-1]]>2 && print' duplicates.txt duplicates.txt

ruby -F, -ane 'BEGIN{h=Hash.new(0)}; ARGV.size==1 ? h[$F[2]]+=1 :
               h[$F[2]]==1 && print' duplicates.txt duplicates.txt

