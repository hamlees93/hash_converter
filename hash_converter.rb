def decode_message(hexadecimal)
    tens = hexadecimal.collect {|hex| hex[0]}
    ones = hexadecimal.collect {|hex| hex[1]}
    replacements = [ ["A", "10"], ["B", "11"], ["C", "12"], ["D", "13"], ["E", "14"], ["F", "15"] ]
    tens.collect {|hex| replacements.each {|replacement| hex.gsub!(replacement[0], replacement[1])}}
    ones.collect {|hex| replacements.each {|replacement| hex.gsub!(replacement[0], replacement[1])}}
    tens.collect! {|ten| ten.to_i * 16}
    ones.collect! {|one| one.to_i }
    numbers = ones.zip(tens).map{|ten, one| ten + one}
    number_codes = (1..26).to_a.push(32).push((97..122).to_a).flatten
    letter_codes = *('A'..'Z').to_a.push(' ').push(('a'..'z').to_a).flatten
    puts numbers.collect! {|num| (letter_codes[number_codes.index(num)])}.join
end

hexadecimal = %w(09 74 20 69 73 20 17 65 64 6E 65 73 64 61 79 20 6D 79 20 64 75 64 65 74)
decode_message(hexadecimal)


def encode_message(message)
    letters = ('A'..'Z').to_a.push(' ').to_a.push(('a'..'z').to_a).flatten
    numbers = (1..26).to_a.push(32).push((97..122).to_a).flatten
    result = []
    replacements = [ ["A", "10"], ["B", "11"], ["C", "12"], ["D", "13"], ["E", "14"], ["F", "15"] ]
    message.each_char {|letter| result.push(numbers[letters.index(letter)])}
    result.collect! {|num| (num / 16).to_s + (num % 16).to_s}
    ones = result.collect {|one| one.slice!(0)}
    result.collect {|hex| replacements.each {|replacement| hex.gsub!(replacement[1], replacement[0])}}
    puts ones.zip(result).map{|ten, one| (ten + one)}
end

message = "It is Wednesday my dudet"
encode_message(message)