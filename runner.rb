require_relative 'File_Reader'
require_relative 'Word_Count'
require_relative 'Print_View'

# A class that runs the fileReader, WordCount, and printView. It attempts to open
# each filePath and read it into a single string (file_string). it then passes it
# of to Word_Count.run to be analyzed. Once an analysis of all the files has run,
# the @@words_hash is sorted and the top ten values are extracted and printed to
# the console
class Main

  #An obejct to read in a file path and parse it into a single string
  file_reader = File_Reader.new

  #An object to parse strings into an array of words
  parser = Parser.new

  #An object to count the occurance of words
  word_counter = Word_Counter.new


  #An object that takes a 2d array and prints it to the console
  viewer = Print_View.new


  puts "Calculating"

  # read in each file path from ARGV
  ARGV.each do |file_path|

    # let the user know the program didin't crash if the file is long...
    puts "..."

    # read the file in from the file path and parse into a single string
    file_string = file_reader.read_in_file(file_path)

    # parse the string into an array of words
    word_array = parser.parse_text(file_string)

    # count the word occurances
    word_counter.count_words(word_array)


  end

  #sort the words in the hash by occurance value
  word_counter.sort_hash

  #1st ten words from the hash
  top_words = word_counter.top_ten
  viewer.print_list(top_words)
end
