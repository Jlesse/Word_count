
require_relative "./Parser"
# A class containing a has counting the word count and methods for counting the number of occurrences of each word.
class Word_Counter

  def initialize
    @word_hash = {}
  end

  # Counts the number of occurrences of each word and adds the word with its count
  # the word_hash
  # PARAMS:
  # - word_array: an array of word strings
  # RETURNS:
  # - a hash where each key is a word and its value is the number of occurrences of that word in the word_array (ex. { "words"=> 4, "are"=> 2, "cool"=> 5 })
  def count_words(word_array)
    word_array.each do |word|
      word.downcase!
      if @word_hash.has_key?(word)
        @word_hash[word] +=1
      else
        @word_hash[word] = 1
      end
    end
    return @word_hash
  end

  # Converts hash to an array and sorts the and to be in descending order and
  # PARAMS:
  # - hash: an unsorted hash of word keys with their occurrence values
  # RETURNS:
  # - a descending by value array of sub-arrays, where each subarray[0] is the word
  # key and subarray[1] is its occurrence value.
  def sort_hash
    @word_hash.sort{|word1, word2| word2[1] <=> word1[1]}
  end

  # Slices the first ten elements from sorted_words_array into a new array and returns it.
  # PARAMS:
  # - sorted_words_array: an ordered array of subarrays where each subarray
  # contains the word as its first element and its number of occurrences as its
  # second element.
  # RETURNS:
  # - a descending by value array of 10 sub-arrays, where each subarray[0] is the
  # word key and subarray[1] is its occurrence value.
  def top_ten
    sorted_words_array = sort_hash
    sorted_words_array[0..9]
  end



  # runs utility methods to parse in text and count the words
  # def self.run(text)
  #   count_words parse_text text
  # end

end
