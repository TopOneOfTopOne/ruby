#Aglorithm
#split string into each word
#for each word compare with =~ operator with all elements in dictionary
#if matched add the matched element into a hash and increment the value
def substring(string,dictionary)
  words = string.downcase.split
  sub_strings = Hash.new(0)
  words.each do |word|
    dictionary.each do |elem|
      if word.include? elem
        sub_strings[elem] += 1
      end
    end
  end
  sub_strings
end

dict = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
string = "Howdy partner, sit down! How's it going?"

p substring(string,dict)