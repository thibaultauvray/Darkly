require 'nokogiri'
require 'open-uri'
require 'pry'

def getReadMe(ru, array)
	begin
		retries = 0
		doc = Nokogiri::HTML.parse(open(ru))
		lines = doc.css('a').map { |link| link['href'] }
		lines.each do  |line|
			if line == "../"
				next
			end
			if line == "README"
				f = open(ru + line).read
				if !array.include?(f)
					array.push(f)
					puts f
				end
			else
				getReadMe(ru + line, array)
			end
		end

	rescue => e
		retries += 1
		if retries < 3
			retry # <-- Jumps to begin
		else
			# Error handling code, e.g.
			#     logger.warn "Couldn't connect to proxy: #{e}"
		end
	end
end

array = []
getReadMe(ARGV[0], array)


#localhost/.hidden/whtccjokayshttvxycsvykxcfm/igeemtxnvexvxezqwntmzjltkt/lmpanswobhwcozdqixbowvbrhw/README
## => 99dde1d35d1fdd283924d84e6d9f1d820
