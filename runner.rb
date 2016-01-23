require_relative 'File_Reader'
require_relative 'text_parse'

# A class that runs the fileReader and WordCount. it opens the file reads it
# into a single string (file_string) and passes it of to Word_Count.run to be analyzed and printed.
class Main
  file_path = ARGV[0]
  file_string = File_Reader.read_in_file(file_path)
  Word_Count.run(file_string)
end
