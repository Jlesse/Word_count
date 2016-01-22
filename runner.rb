require_relative 'text_parse'
class Runner
  file_path = ARGV[0]
  file_string = ""

  File.open(file_path, "r") do |f|
    f.each_line do |line|
      file_string+=line
    end
  end

  Word_Count.run(file_string)

end