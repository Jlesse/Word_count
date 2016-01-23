
class Print_View
  # Prints the top ten words to the console
  # PARAMS:
  # - top_words: a descending by value array of 10 sub-arrays, where each
  # subarray[0] is the word key and subarray[1] is its occurance value.
  # RETURNS:
  # - a descending by value array of 10 sub-arrays, where each
  # subarray[0] is the word key and subarray[1] is its occurance value.
  def printList(top_words)
    puts "THE TOP TEN WORDS"
    puts "================="
    i = 1
    top_words.each do |word_sub_array|
      puts "#{i}. #{word_sub_array[0]}, count: #{word_sub_array[1]}"
      i+=1
    end
  end
end