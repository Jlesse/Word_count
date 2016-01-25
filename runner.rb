require_relative 'File_Reader'
require_relative 'Word_Count'
require_relative 'Print_View'
require_relative 'Parser'

# A class that runs the parser, file_reader, Word_Count, and print_View.
# It attempts to open each file in the provided directory from the command-line
# parse each file, and count the number of occurances. It then sorts the hash
# and gets the top ten entries in the hash and passes it of to the view to be
# printed to the console.
class Main

  #An obejct to read in a file path and parse it into a single string
  file_reader = File_Reader.new

  #An object to parse strings into an array of words
  parser = Parser.new

  #An object to count the occurance of words
  word_counter = Word_Counter.new

  #An object that to viewing the word count
  viewer = Print_View.new


  puts "Calculating"

  #clean the path of the directory (check if prepended by ./ and appended with /)
  directory = file_reader.clean_path(ARGV[0])

  dir = Dir.new(directory)

  dir.each do |file_path|

    #skip over file_path if its the current of grand parent directory or not a .txt file
    next if file_path == '.' || file_path == '..' || !(/.+\.txt/.match(file_path))

    # let the user know the program didin't crash if the file is long...
    puts "processing #{file_path}..."

    # read the file in from the file path and parse into a single string
    file_string = file_reader.read_in_file(directory + file_path)

    # parse the string into an array of words
    word_array = parser.parse_text(file_string)

    # count the word occurances
    word_counter.count_words(word_array)

  end

  #sort the words in the hash by occurance value
  word_counter.sort_hash

  #first ten words from the hash
  top_words = word_counter.top_ten

  #print list to console
  viewer.print_list(top_words)
end
