# test1 = "Even at his job—he was a technician in an electronic lab—Edgar couldn't stop longing for that era when existence had been more gentle, simple and leisurely. His social life virtually ceased.
# \"Man, you ain\'t livin\',\" said one of the technicians he worked with. \"We're gonna buzz a few dives tonight. Why not drag it along with us?\""

# test2 = "some words, , , , , more"

$test3 = "\“This much is already known: for every sensible line of straightforward statement, there are leagues of senseless cacophonies, verbal jumbles and incoherences. (I know of an uncouth region whose librarians repudiate the vain and superstitious custom of finding a meaning in books and equate it with that of finding a meaning in dreams or in the chaotic lines of one\'s palm . . . They admit that the inventors of this writing imitated the twenty-five natural symbols, but maintain that this application is accidental and that the books signify nothing in themselves. This dictum, we shall see, is not entirely fallacious.)\"
― Jorge Luis Borges, The Library Of Babel"


# A class containing a run method and utility methods to assist in reading in a text string and counting the number of occurances of each
# word. All the methods are called inside the run method.
class Word_Count

  @@word_hash = {}

  def self.word_hash=(hash)
    @@word_hash = hash
  end

  def self.word_hash
    @@word_hash
  end

  # Scans a string of text for words (any string delimited by all alphanumeric chars)
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
    word_array.each do |word|
      word.downcase!
      if @@word_hash.has_key?(word)
        @@word_hash[word] +=1
      else
        @@word_hash[word] = 1
      end
    end
    return @@word_hash
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



  # Runs all the utility methods.
  def self.run(text)

    top_words = top_ten sort_hash count_words parse_text text
    printList top_words
  end

  private_class_method :printList, :top_ten, :sort_hash, :count_words, :parse_text
end
