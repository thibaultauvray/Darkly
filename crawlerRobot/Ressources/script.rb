require 'nokogiri'
require 'open-uri'

def getReadMe(ru)
	doc = Nokogiri::HTML.parse(open(ru))
	lines = doc.css('a').map { |link| link['href'] }
	lines.each do  |line|
		if line == "../"
			next
		end
		if line == "README"
			f = File.open(line).read
			puts f
		else
			getReadMe(ru + line)
		end
	end
end

getReadMe('http://localhost/.hidden/')


#localhost/.hidden/whtccjokayshttvxycsvykxcfm/igeemtxnvexvxezqwntmzjltkt/lmpanswobhwcozdqixbowvbrhw/README
## => 99dde1d35d1fdd283924d84e6d9f1d820
