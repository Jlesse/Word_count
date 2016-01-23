
require_relative '../File_Reader'
require_relative '../Word_Count'

describe 'Word_Count' do
  test_string1 = "\“This much is already known: for every sensible line of straightforward statement, there are leagues of senseless cacophonies, verbal jumbles and incoherences. (I know of an uncouth region whose librarians repudiate the vain and superstitious custom of finding a meaning in books and equate it with that of finding a meaning in dreams or in the chaotic lines of one\'s palm . . . They admit that the inventors of this writing imitated the twenty-five natural symbols, but maintain that this application is accidental and that the books signify nothing in themselves. This dictum, we shall see, is not entirely fallacious.)\"
― Jorge Luis Borges, The Library Of Babel"

  test_string2 = "this,-this`is~ain't!a@bad\(test*string.&It's#number^2.Maybe\]it\[will|work?Maybe+not=.Maybe>this<maybe}that{maybe\\eveything:maybe;nothing"

  test_array = ["This", "much", "is", "already", "known", "for", "every", "sensible", "line", "of", "straightforward", "statement", "there", "are", "leagues", "of", "senseless", "cacophonies", "verbal", "jumbles", "and", "incoherences", "I", "know", "of", "an", "uncouth", "region", "whose", "librarians", "repudiate", "the", "vain", "and", "superstitious", "custom", "of", "finding", "a", "meaning", "in", "books", "and", "equate", "it", "with", "that", "of", "finding", "a", "meaning", "in", "dreams", "or", "in", "the", "chaotic", "lines", "of", "one", "s", "palm", "They", "admit", "that", "the", "inventors", "of", "this", "writing", "imitated", "the", "twenty", "five", "natural", "symbols", "but", "maintain", "that", "this", "application", "is", "accidental", "and", "that", "the", "books", "signify", "nothing", "in", "themselves", "This", "dictum", "we", "shall", "see", "is", "not", "entirely", "fallacious", "Jorge", "Luis", "Borges", "The", "Library", "Of", "Babel"]

  test_hash = {"this"=>4, "much"=>1, "is"=>3, "already"=>1, "known"=>1, "for"=>1, "every"=>1, "sensible"=>1, "line"=>1, "of"=>8, "straightforward"=>1, "statement"=>1, "there"=>1, "are"=>1, "leagues"=>1, "senseless"=>1, "cacophonies"=>1, "verbal"=>1, "jumbles"=>1, "and"=>4, "incoherences"=>1, "i"=>1, "know"=>1, "an"=>1, "uncouth"=>1, "region"=>1, "whose"=>1, "librarians"=>1, "repudiate"=>1, "the"=>6, "vain"=>1, "superstitious"=>1, "custom"=>1, "finding"=>2, "a"=>2, "meaning"=>2, "in"=>4, "books"=>2, "equate"=>1, "it"=>1, "with"=>1, "that"=>4, "dreams"=>1, "or"=>1, "chaotic"=>1, "lines"=>1, "one's"=>1, "palm"=>1, "they"=>1, "admit"=>1, "inventors"=>1, "writing"=>1, "imitated"=>1, "twenty"=>1, "five"=>1, "natural"=>1, "symbols"=>1, "but"=>1, "maintain"=>1, "application"=>1, "accidental"=>1, "signify"=>1, "nothing"=>1, "themselves"=>1, "dictum"=>1, "we"=>1, "shall"=>1, "see"=>1, "not"=>1, "entirely"=>1, "fallacious"=>1, "jorge"=>1, "luis"=>1, "borges"=>1, "library"=>1, "babel"=>1}

  test_array_sorted = [["of", 8], ["the", 6], ["this", 4], ["that", 4], ["in", 4], ["and", 4], ["is", 3], ["books", 2], ["finding", 2], ["a", 2], ["meaning", 2], ["but", 1], ["there", 1], ["are", 1], ["leagues", 1], ["senseless", 1], ["cacophonies", 1], ["verbal", 1], ["jumbles", 1], ["straightforward", 1], ["incoherences", 1], ["i", 1], ["know", 1], ["an", 1], ["uncouth", 1], ["region", 1], ["whose", 1], ["librarians", 1], ["repudiate", 1], ["line", 1], ["vain", 1], ["superstitious", 1], ["custom", 1], ["sensible", 1], ["every", 1], ["for", 1], ["known", 1], ["already", 1], ["equate", 1], ["it", 1], ["with", 1], ["much", 1], ["dreams", 1], ["or", 1], ["chaotic", 1], ["lines", 1], ["one's", 1], ["palm", 1], ["they", 1], ["admit", 1], ["inventors", 1], ["writing", 1], ["imitated", 1], ["twenty", 1], ["five", 1], ["natural", 1], ["symbols", 1], ["statement", 1], ["maintain", 1], ["application", 1], ["accidental", 1], ["signify", 1], ["nothing", 1], ["themselves", 1], ["dictum", 1], ["we", 1], ["shall", 1], ["see", 1], ["not", 1], ["entirely", 1], ["fallacious", 1], ["jorge", 1], ["luis", 1], ["borges", 1], ["library", 1], ["babel", 1]]

  final_top_ten_output = "THE TOP TEN WORDS\n=================\n1. of, count: 8\n2. the, count: 6\n3. this, count: 4\n4. that, count: 4\n5. in, count: 4\n6. and, count: 4\n7. is, count: 3\n8. books, count: 2\n9. finding, count: 2\n10. a, count: 2\n"

  describe 'Word_Count.Parse' do
    it 'parses a string in into an array of words' do
      expect(Word_Count.send(:parse_text, test_string1)).to eq test_array
    end

     it 'counts any alphanumeric charactor as a delimeter ' do
      expect(Word_Count.send(:parse_text, test_string2)).to eq ["this", "this", "is", "ain", "t", "a", "bad", "test", "string", "It", "s", "number", "2", "Maybe", "it", "will", "work", "Maybe", "not", "Maybe", "this", "maybe", "that", "maybe", "eveything", "maybe", "nothing"]
    end
  end

  describe 'Word_Count.count_words' do
    it "counts the number of occurances of a word regardless of case" do
    count_hash = Word_Count.send(:count_words, test_array)
      expect(count_hash["of"]).to eq 8
    end
  end

  describe "Word_Count.sort_hash" do
    it "sorts the hash into an descening ordered array by occurance value" do
      expect(Word_Count.send(:sort_hash, test_hash)).to eq test_array_sorted
    end
  end

  describe "Word_Count.top_ten" do
    it "returns the top ten most frequent words" do
      expect(Word_Count.send(:top_ten, test_array_sorted)).to eq([["of", 8], ["the", 6], ["this", 4], ["that", 4], ["in", 4], ["and", 4], ["is", 3], ["books", 2], ["finding", 2], ["a", 2]])
    end
  end

  describe "Word_Count.printList" do
    it "prints the top ten words to the console" do
      expect{Word_Count.send(:printList, [["of", 8], ["the", 6], ["this", 4], ["that", 4], ["in", 4], ["and", 4], ["is", 3], ["books", 2], ["finding", 2], ["a", 2]])}.to output(final_top_ten_output).to_stdout
    end
  end

  describe "Word_Count.run" do
    Word_Count.word_hash = {}
    p Word_Count.word_hash
    it "runs all methods and outputs to the console" do
      expect{Word_Count.run(test_string1)}.to output(final_top_ten_output).to_stdout
    end
  end
end

describe "File_Reader.read_in_file" do
  Word_Count.word_hash = {}
  it "outputs a string when good filePath is provided " do
    expect(File_Reader.read_in_file("galaxy.txt")).to be_instance_of(String)
  end

  it "raises an error when a bad file path is provided" do
    expect{File_Reader.read_in_file("I-dont-exist.txt")}.to raise_error(SystemCallError)
  end
end