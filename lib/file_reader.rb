class FileReader
  def read
    filename = ARGV[0]
    File.read(filename)
  end

  def character_to_braille_dictionary
    braille_definitions = {}
    CSV.foreach('./data/dictionary.csv', headers: true) do |row|
    braille_definitions[row["letter"]] = row["braille"]
    end
    braille_definitions
  end

end
