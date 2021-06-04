# frozen_string_literal: true

def letters_values
  @letters_values ||= Hash[*('A'..'Z').to_a.each_with_index.map { |v, i| [v, i + 1] }.flatten]
end

def all_words_from_file(filename)
  all_words = []
  File.open(filename) do |file|
    all_words = file.readline.split(',').sort.map { |str| str.gsub /"/, '' }
  end
  all_words
end

def word_score(word)
  word.chars.reduce(0) { |mem, ch| mem + letters_values[ch] }
end
