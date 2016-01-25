# A class for parsing text
class Parser

  # Scans a string of text for words (any string delimited by all alphanumeric chars)
  # PARAMS:
  # - text: a string of ascii text
  # RETURNS:
  # - an array of word strings
  def parse_text(text)
   text.scan(/[a-zA-Z\d]+/)
  end

end