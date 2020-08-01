class FileReader
  def read
    filename = ARGV[0]
    File.read(filename).chomp
  end

  def character_to_braille_dictionary
    definitions = {}
    CSV.foreach('./data/dictionary.csv', headers: true) do |row|
    definitions[row["letter"]] = row["braille"]
    end
    definitions
  end

  def braille_to_character_dictionary
    definitions = {}
    CSV.foreach('./data/dictionary.csv', headers: true) do |row|
    definitions[row["braille"]] = row["letter"]
    end
    definitions
  end

end
