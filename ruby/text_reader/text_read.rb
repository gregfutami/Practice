require 'plist'

=begin

Test
From Tomoya 3108554025 

December 22, 2014 at 01:03PM
via Android
#default length: 5

ruby text_read.rb ./texts/sms_received.txt ./texts/sms_sent.txt

test false
ruby text_read.rb ./texts/sms_reved.txt ./texts/sms_sent.txt

puts "length: #{ARGV.length}"

File.open("my/file/path", "r") do |f|
  f.each_line do |line|
    puts line
  end
end

  def initialize(content, name, number, time)
    @content = content
    @name = name
    @number = number
    @time = time
  end

def initialize( content = "text",
                  name = "name",
                  number = "number",
                  time = "time")

f1.each_line do |line|
  t = Text.new()
  t.content += line

  "via Android" 
  #puts line
end
=end
sent = true
received = false

#handles human readable text time
class Text_Time
  include Comparable
  attr_accessor :day
  attr_accessor :month
  attr_accessor :year
  attr_accessor :hour
  attr_accessor :minute
  def initialize()
    @day = 0
    @month = 0
    @year = 0
    @hour = 0
    @minute = 0
  end
  def set(date)
    words = date.split(' ')
    month = 0
    if words[0] == "January"
      month = 1
    elsif words[0] == "February"
      month = 2
    elsif words[0] == "March"
      month = 3
    elsif words[0] == "April"
      month = 4
    elsif words[0] == "May"
      month = 5
    elsif words[0] == "June"
      month = 6
    elsif words[0] == "July"
      month = 7
    elsif words[0] == "August"
      month = 8
    elsif words[0] == "September"
      month = 9
    elsif words[0] == "October"
      month = 10
    elsif words[0] == "November"
      month = 11
    elsif words[0] == "December"
      month = 12
    else
      puts "invalid month in: " + date
    end
    @day = words[1][0..1].to_i
    @month = month
    @year = words[2].to_i
    @hour = words[4][0..1].to_i
    @minute = words[4][3..4].to_i
    if words[4][5..6]=="PM"
      @hour += 12
    end
  end
  def print()
    time_string = ""
    if @minute<10
      minute = "0" + @minute.to_s
    else
      minute = @minute.to_s
    end
    time_string += @month.to_s + "-"
    time_string += @day.to_s + "-"
    time_string += @year.to_s + " at "
    time_string += @hour.to_s + ":" + minute
    return time_string
  end
  def <=>(another_tt)
    if self.year < another_tt.year
      -1
    elsif self.year > another_tt.year
      1
    elsif self.month < another_tt.month
      -1
    elsif self.month > another_tt.month
      1
    elsif self.day < another_tt.day
      -1
    elsif self.day > another_tt.day
      1
    elsif self.hour < another_tt.hour
      -1
    elsif self.hour > another_tt.hour
      1
    elsif self.minute < another_tt.minute
      -1
    elsif self.minute > another_tt.minute
      1
    else
      0
    end        
  end
end

class Text
  def initialize()
    @content = ""
    @name = ""
    @number = ""
    @time = Text_Time.new()
    @sent = false 
  end
  def print()
    if @sent
      puts "to: " + @name
    else
      puts "from: " + @name
    end
    puts @content
    puts "at: " + @time.print()
  end
  def <=>(another_text)
    if self.time < another_text.time
      -1
    elsif self.time > another_text.time
      1
    else
      0 
    end
  end
  attr_accessor :content
  attr_accessor :name
  attr_accessor :number
  attr_accessor :time
  attr_accessor :sent #false means received, true means sent
end

class Conversation
  def initialize()
    @content = []
    @name = ""
    @number = ""
  end
  def print()
    @content.each { |text|
      if text.sent
        puts "to: " + @name 
      else
        puts "from: " + @name
      end
      puts text.content
      puts "time: " + text.time.print()
      puts
    }
  end
  attr_accessor :content
  attr_accessor :name
  attr_accessor :number
end

def read_texts(file, sent_bool)
  read_texts = []
  read_index = 0
  if(!File.exists?(file))
    puts "Error reading received file"
    exit(1)
  end
  puts "Reading " + file
  f1 = File.open(file, "r")
  line = f1.gets
  while(line != nil)
    t = Text.new()
    text_strings = []
    index = 0
    while(!(line =~ /^via Android $/) && line != nil)
      puts read_index
      text_strings[index] = line
      line = f1.gets
      index += 1
    end

    if line != nil
      length = text_strings.length
      t.content = text_strings[0..(length-4)].join('\n')
      contact = text_strings[length-3].split(' ')
      t.name = contact[1..contact.length-2].join(' ')
      t.number = contact[contact.length-1]
      t.time.set(text_strings[length-1])

      t.sent = sent_bool
      puts "content: " + t.content
      puts "name " + t.name
      puts "number: " + t.number
      puts "time: " + t.time.print()


      line = f1.gets
      read_texts[read_index] = t
      read_index += 1
    end
  end
  f1.close()
  return read_texts
end



def get_contacts(texts)
  contacts = []
  contacts_index = 0

  texts.each { |text|
    #fix for leading 1 inf front of area code
    if text.number.length == 11 && text.number[0] == '1'
      text.number = text.number[1..10]
    end
    if !(contacts.include? text.number)
      contacts[contacts_index] = text.number
      contacts_index += 1
    end
  }
  return contacts
end



if(ARGV.length != 2)
  puts "Correct usage: ruby text_read.rb ImportSentText ExportRecievedText"
end

ARGV.each do|a|
  puts "Argument: #{a}"
end

sent_texts = read_texts(ARGV[1], sent)
received_texts = read_texts(ARGV[0], received)
texts = sent_texts + received_texts
contacts = get_contacts(texts)
conversations = []
conversation_index = 0
contacts.each { |number|
  puts "making conversation with " + number
  c = Conversation.new()
  c_index = 0
  c.number = number
  texts.each { |text|
    if text.number == number
      c.content[c_index] = text
      puts text.content
      c_index += 1
    end
  }
  c.name = c.content[c_index-1].name
  c.content = c.content.sort 
  conversations[conversation_index] = c
  conversation_index += 1
  puts "###################"
}


conversations.each { |c| 
  puts "conversation with " + c.name + " " + c.number
  c.print()
  puts "###################"
}


sent_index = sent_texts.length
received_index = received_texts.length



puts "###################"



=begin
def read_time(date)
  words = date.split(' ')
  month = 0
  year = 0
  day = 0
  hour = 0
  minute = 0
  if words[0] == "January"
    month = 1
  elsif words[0] == "February"
    month = 2
  elsif words[0] == "March"
    month = 3
  elsif words[0] == "April"
    month = 4
  elsif words[0] == "May"
    month = 5
  elsif words[0] == "June"
    month = 6
  elsif words[0] == "July"
    month = 7
  elsif words[0] == "August"
    month = 8
  elsif words[0] == "September"
    month = 9
  elsif words[0] == "October"
    month = 10
  elsif words[0] == "November"
    month = 11
  elsif words[0] == "December"
    month = 12
  else
    puts "invalid month in: " + date
  end
  day = words[1][0..1].to_i
  year = words[2].to_i
  hour = words[4][0..1].to_i
  minute = words[4][3..4].to_i
end
=end













