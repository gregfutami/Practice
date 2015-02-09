#take songs and create individual xml files
#will eventually be merged into another file
=begin
ruby gendata_test.rb playlist_exports/RubyTestLyrics.xml song_data/

=end
require 'plist'

puts "Argv[0]: #{ARGV[0]}"
puts "Argv[1]: #{ARGV[1]}"

data = Plist.parse_xml(File.read(ARGV[0]))
template = Plist.parse_xml(File.read("song_data/empty.xml"))

#test template
puts template["Song"]

tracks = data["Tracks"]

tracks.each_value do |song|
  id = song["Track ID"].to_s
  puts "Title: #{song["Name"]}; Track ID: #{id}"
  filename = song["Name"].downcase.delete " .()"
  filename += (id + ".xml")
  #puts "filename: #{filename}"
  #f = File.open("filename", "w")
  #f.write(Plist::Emit.dump())
end