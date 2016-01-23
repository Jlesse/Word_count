
# A class that reads in a plan text file
class File_Reader

  # reads a file path in from the command line, opens the file, and concats each line together into a string
  #PARAMS:
  # - no params, the file_path is supplied with ARGV from the command line.
  #RETURNS
  # a string of all the chars read in from the file

  def self.read_in_file(file_path)

    file_string = ""
    File.open(file_path, "r") do |f|
      f.each_line do |line|
        file_string+=line
      end
    end
    file_string
  end


end
