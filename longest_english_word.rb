require 'json'

excluded_seven_segment_charters = 'gkmqvwxz'.split('')

puts 'paste file path'
file_path = gets.chomp

file = File.read(file_path)
case File.extname(file_path)
when '.json'
  words = JSON.parse(file)
when '.txt'
  words = file.split(/[\r\n]+/)
end

@longest_words = []
words_long_to_short = words.sort_by(&:length).reverse
words_long_to_short.each do |word|
  word_split_into_charters = word.split('')
  if (word_split_into_charters & excluded_seven_segment_charters).empty?
    @longest_words_length
    break word if word.length < @longest_words_length.to_i
    @longest_words << word
    @longest_words_length = word.length
  end
end

puts @longest_words
