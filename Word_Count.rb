
# A class containing a run method and utility methods to assist in reading in a text
# string and counting the number of occurrences of each word.
class Word_Count

  # holds all words found paired with their occurrences
  @@word_hash = {}


  # setter for the @@word_hash
  # PARAMS:
  # - hash: a hash, usually for our purposes an emtpy one to clear @@word_hash for testing
  # RETURNS
  # - @@word_hash: holds all words found paired with their occurrences
  def self.word_hash=(hash)
    @@word_hash = hash
  end

  # getter the @@word_hash
  # RETURNS:
  # - @@word_hash: holds all words found paired with their occurrences
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

  # Counts the number of occurrences of each word and adds the word with its count
  # the word_hash
  # PARAMS:
  # - word_array: an array of word strings
  # RETURNS:
  # - a hash where each key is a word and its value is the number of occurrences of that word in the word_array (ex. { "words"=> 4, "are"=> 2, "cool"=> 5 })
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
  # - hash: an unsorted hash of word keys with their occurrence values
  # RETURNS:
  # - a descending by value array of sub-arrays, where each subarray[0] is the word
  # key and subarray[1] is its occurrence value.
  def self.sort_hash(hash)
    hash.sort{|word1, word2| word2[1] <=> word1[1]}
  end

  # Slices the first ten elements from sorted_words_array into a new array and returns it.
  # PARAMS:
  # - sorted_words_array: an ordered array of subarrays where each subarray
  # contains the word as its first element and its number of occurrences as its
  # second element.
  # RETURNS:
  # - a descending by value array of 10 sub-arrays, where each subarray[0] is the
  # word key and subarray[1] is its occurrence value.
  def self.top_ten(sorted_words_array)
    sorted_words_array[0..9]
  end



  # runs utility methods to parse in text and count the words
  def self.run(text)
    count_words parse_text text
  end

  private_class_method :count_words, :parse_text
end
