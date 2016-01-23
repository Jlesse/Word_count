require_relative 'File_Reader'
require_relative 'Word_Count'
require_relative 'Print_View'

# A class that runs the fileReader, WordCount, and printView. It attempts to open
# each filePath and read it into a single string (file_string). it then passes it
# of to Word_Count.run to be analyzed. Once an analysis of all the files has run,
# the @@words_hash is sorted and the top ten values are extracted and printed to
# the console
class Main
  puts "Calculating"
  ARGV.each do |file_path|
    puts"..."
    file_string = File_Reader.read_in_file(file_path)
    Word_Count.run(file_string)
  end

  sorted_array = Word_Count.sort_hash(Word_Count.word_hash)
  top_words = Word_Count.top_ten(sorted_array)
  Print_View.printList(top_words)
end
