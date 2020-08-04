# night_writer

This project will convert English .txt files into braille and braille.txt files into text.

**Things to note:** 
* As of now, this will only work with lowercase letters and basic punctuation (see data/dictionary.csv)
* The braille is represented with `0`'s as raised dots and `.`'s as flat spaces. For example, "a" would look like:
```
0.
..
..
```
### How it works
* To convert a file to braille, you will run `night_writer.rb` and need a `.txt` file with any amount of English characters that fit the specifications above. You will also need to know what you want to name your braille `.txt` file. You then run the program in the command line followed by the names of the two files. For example: `night_writer.rb message.txt braille.txt` This sets message.txt as `ARGV[0]` and braille.txt as `ARGV[1]` which the program uses to read and create the files. **Note:** The braille `.txt` files has a maximum of 80 characters per line, meaning 40 English characters per line.
* To convert a braille file back to English characters, the braille file needs to meet the specs in the note listed above (80 characters per line). Then, simply run `night_reader.rb` in the same way you translated the English file. For example: `night_reader.rb braille.txt original_message.txt`.
