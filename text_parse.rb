# test1 = "Even at his job—he was a technician in an electronic lab—Edgar couldn't stop longing for that era when existence had been more gentle, simple and leisurely. His social life virtually ceased.
# \"Man, you ain\'t livin\',\" said one of the technicians he worked with. \"We're gonna buzz a few dives tonight. Why not drag it along with us?\""

# test2 = "some words, , , , , more"

$test3 = "\“This much is already known: for every sensible line of straightforward statement, there are leagues of senseless cacophonies, verbal jumbles and incoherences. (I know of an uncouth region whose librarians repudiate the vain and superstitious custom of finding a meaning in books and equate it with that of finding a meaning in dreams or in the chaotic lines of one\'s palm . . . They admit that the inventors of this writing imitated the twenty-five natural symbols, but maintain that this application is accidental and that the books signify nothing in themselves. This dictum, we shall see, is not entirely fallacious.)\"
― Jorge Luis Borges, The Library Of Babel"


# A class containing a run method and utility methods to assist in reading in a text string and counting the number of occurances of each
# word. All the methods are called inside the run method.
class Word_Count

  # Scans a string of text for words (any string containing 1 or more anycase
  # letter, number, or ')
  # PARAMS:
  # - text: a string of ascii text
  # RETURNS:
  # - an array of word strings
  def self.parse_text(text)
   text.scan(/[a-zA-Z\d]+/)
  end

  # Counts the number of occurances of each word and adds the word with its count
  # the word_hash
  # PARAMS:
  # - word_array: an array of word strings
  # RETURNS:
  # - a hash where each key is a word and its value is the number of occurances of that word in the word_array (ex. { "words"=> 4, "are"=> 2, "cool"=> 5 })
  def self.count_words(word_array)
    word_hash = {}
    word_array.each do |word|
      word.downcase!
      if word_hash.has_key?(word)
        word_hash[word] +=1
      else
        word_hash[word] = 1
      end
    end
    return word_hash
  end

  # Converts hash to an array and sorts the and to be in descending order and
  # PARAMS:
  # - hash: an unsorted hash of word keys with their occurance values
  # RETURNS:
  # - a descending by value array of sub-arrays, where each subarray[0] is the word
  # key and subarray[1] is its occurance value.
  def self.sort_hash(hash)
    hash.sort{|word1, word2| word2[1] <=> word1[1]}
  end

  # Slices the first ten elements from sorted_words_array into a new array and returns it.
  # PARAMS:
  # - sorted_words_array: an ordered array of subarrays where each subarray
  # contains the word as its first element and its number of occurances as its
  # second element.
  # RETURNS:
  # - a descending by value array of 10 sub-arrays, where each subarray[0] is the
  # word key and subarray[1] is its occurance value.
  def self.top_ten(sorted_words_array)
    sorted_words_array[0..9]
  end

  # Prints the top ten words to the console
  # PARAMS:
  # - top_words: a descending by value array of 10 sub-arrays, where each
  # subarray[0] is the word key and subarray[1] is its occurance value.
  # RETURNS:
  # - a descending by value array of 10 sub-arrays, where each
  # subarray[0] is the word key and subarray[1] is its occurance value.
  def self.printList(top_words)
    puts "THE TOP TEN WORDS"
    puts "================="
    i = 1
    top_words.each do |word_sub_array|
      puts "#{i}. #{word_sub_array[0]}, count: #{word_sub_array[1]}"
      i+=1
    end
  end

  # Runs all the utility methods.
  def self.run(text)
    top_words = top_ten sort_hash count_words parse_text text
    printList top_words
  end

  private_class_method :printList, :top_ten, :sort_hash, :count_words, :parse_text
end


#  test_array = ["This", "much", "is", "already", "known", "for", "every", "sensible", "line", "of", "straightforward", "statement", "there", "are", "leagues", "of", "senseless", "cacophonies", "verbal", "jumbles", "and", "incoherences", "I", "know", "of", "an", "uncouth", "region", "whose", "librarians", "repudiate", "the", "vain", "and", "superstitious", "custom", "of", "finding", "a", "meaning", "in", "books", "and", "equate", "it", "with", "that", "of", "finding", "a", "meaning", "in", "dreams", "or", "in", "the", "chaotic", "lines", "of", "one's", "palm", "They", "admit", "that", "the", "inventors", "of", "this", "writing", "imitated", "the", "twenty", "five", "natural", "symbols", "but", "maintain", "that", "this", "application", "is", "accidental", "and", "that", "the", "books", "signify", "nothing", "in", "themselves", "This", "dictum", "we", "shall", "see", "is", "not", "entirely", "fallacious", "Jorge", "Luis", "Borges", "The", "Library", "Of", "Babel"]

# # p Word_Count.send(:count_words, test_array)

# p Word_Count.send(:sort_hash, {"this"=>4, "much"=>1, "is"=>3, "already"=>1, "known"=>1, "for"=>1, "every"=>1, "sensible"=>1, "line"=>1, "of"=>8, "straightforward"=>1, "statement"=>1, "there"=>1, "are"=>1, "leagues"=>1, "senseless"=>1, "cacophonies"=>1, "verbal"=>1, "jumbles"=>1, "and"=>4, "incoherences"=>1, "i"=>1, "know"=>1, "an"=>1, "uncouth"=>1, "region"=>1, "whose"=>1, "librarians"=>1, "repudiate"=>1, "the"=>6, "vain"=>1, "superstitious"=>1, "custom"=>1, "finding"=>2, "a"=>2, "meaning"=>2, "in"=>4, "books"=>2, "equate"=>1, "it"=>1, "with"=>1, "that"=>4, "dreams"=>1, "or"=>1, "chaotic"=>1, "lines"=>1, "one's"=>1, "palm"=>1, "they"=>1, "admit"=>1, "inventors"=>1, "writing"=>1, "imitated"=>1, "twenty"=>1, "five"=>1, "natural"=>1, "symbols"=>1, "but"=>1, "maintain"=>1, "application"=>1, "accidental"=>1, "signify"=>1, "nothing"=>1, "themselves"=>1, "dictum"=>1, "we"=>1, "shall"=>1, "see"=>1, "not"=>1, "entirely"=>1, "fallacious"=>1, "jorge"=>1, "luis"=>1, "borges"=>1, "library"=>1, "babel"=>1})

