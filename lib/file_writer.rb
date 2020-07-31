class FileWriter
  def write(contents)
    filename = ARGV[1]
    File.open(filename, "w") do |file|
      file.write contents.chomp!
    end
  end
end
