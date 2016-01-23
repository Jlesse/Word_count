require_relative 'text_parse'
# A class that reads in a plan text file
class File_Reader

  # reads a file path in from the command line, opens the file, and concats each line together into a string
  #PARAMS:
  # - no params, the file_path is supplied with ARGV from the command line.
  #RETURNS
  # a string of all the chars read in from the file
  def self.read_in_file
    file_path = ARGV[0]
    file_string = ""

    File.open(file_path, "r") do |f|
      f.each_line do |line|
        file_string+=line
      end
    end
    file_string
  end


end

# A class that runs the fileReader and WordCount. it opens the file reads it
# into a single string (file_string) and passes it of to Word_Count.run to be analyzed and printed.
class Main
  file_string = File_Reader.read_in_file
  Word_Count.run(file_string)
end