## JSON

s='{"greeting":"hi","marks":[78,62,93]}'

echo "$s" | ruby -rjson -e 'ip = JSON.parse(ARGF.read);
                 puts JSON.pretty_generate(ip)'

type rq

rq() { ruby -rjson -e 'ip = JSON.parse(ARGF.read);'"$@" ; }

s='{"greeting":"hi","marks":[78,62,93]}'

echo "$s" | rq 'puts ip["greeting"]'

echo "$s" | rq 'print ip["marks"]' -l

echo "$s" | rq 'ip["marks"][1] = 100; puts JSON.generate(ip)'

cat sample.json

rq 'ip.each {|k,v| puts "#{k}:#{v}" if !k.match?(/e/)}' sample.json

rq 'ip["language"].each {|k,v| puts "#{k}:#{v}" if k.match?(/t/)}' sample.json

## CSV

s='eagle,"fox,42",bee,frog\n1,2,3,4'

printf '%b' "$s" | ruby -rcsv -le 'ip=CSV.new(ARGF.read); print ip.read'

printf '%b' "$s" | ruby -rcsv -e 'ip=CSV.new(ARGF.read); puts ip.read[0][1]'

cat newline.csv

ruby -rcsv -le 'ip=CSV.read("newline.csv"); print ip'

ruby -rcsv -e 'CSV.foreach("newline.csv"){ |row|
               puts row[2] if row[0]=~/pp/ }'

ruby -rcsv -e 'CSV.foreach("marks.txt", :col_sep => "\t"){ |r|
               puts r * "," if r[0]=="ECE" }'

ruby -rcsv -e 'CSV.foreach("marks.txt", :headers => true, :col_sep => "\t"){
               |r| puts r["Name"] }'

ruby -rcsv -le 'CSV.foreach("marks.txt", :converters => :integer,
                :col_sep => "\t"){ print _1 }'

## XML and HTML

cat sample.xml

ruby -rnokogiri -e 'ip=Nokogiri.XML(ARGF);
      puts ip.xpath("//blue")' sample.xml

ruby -rnokogiri -e 'ip=Nokogiri.XML(ARGF);
      puts ip.xpath("//blue").grep(/stone/)' sample.xml

ruby -rnokogiri -e 'ip=Nokogiri.XML(ARGF);
      puts ip.at_xpath("//blue")' sample.xml

ruby -rnokogiri -e 'ip=Nokogiri.XML(ARGF);
      puts ip.css("light-blue").map(&:text)' sample.xml

ruby -rnokogiri -e 'ip=Nokogiri.XML(ARGF);
      puts ip.at_css("blue").text' sample.xml

ruby -rnokogiri -e 'ip=Nokogiri.XML(ARGF);
      puts ip.xpath("//greeting/@type")' sample.xml

ruby -rnokogiri -e 'ip=Nokogiri.XML(ARGF);
      puts ip.xpath("//greeting[@type=\"ask\"]").text' sample.xml

s='https://learnbyexample.github.io/substitution-with-ripgrep/'

url="$s" ruby -rnokogiri -ropen-uri -e 'ip=Nokogiri.XML(URI.open(ENV["url"]));
               puts ip.css("@href")[3..5]'

