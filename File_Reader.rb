
# A class that reads in a plan text file
class File_Reader

  # Checks if the path to folder is preceded by a ./ and ended with a /.
  # if not it converts the file path to the the ./.../ form.
  # PARAMS:
  # - dir: a string that provides the path to the directory
  # RETURNS:
  # - dir - the clean path to the directory in the form "./some-stuff/"

  def clean_path(dir)
    if !(/.*\/\z/.match dir)
      dir+="/"
    end
    if !(/\A\.\/.*/.match dir)
      dir = "./" + dir
    end
    dir
  end

  # reads a file path in from the command line, opens the file, and concats each line together into a string
  #PARAMS:
  # - no params, the file_path is supplied with ARGV from the command line.
  #RETURNS
  # a string of all the chars read in from the file
  def read_in_file(file_path)
    file_string = ""
    if (File.file?(file_path))
      File.open(file_path, "r") do |f|
        f.each_line do |line|
          file_string+=line
        end
      end
      file_string
    else
      raise SystemCallError, "File not found at provided file path, please check your file path."
    end
  end


end
