def hex_to_dec(array)
    tens = array.collect {|hex| hex[0]}
    ones = array.collect {|hex| hex[1]}
    replacements = [ ["A", "10"], ["B", "11"], ["C", "12"], ["D", "13"], ["E", "14"], ["F", "15"] ]
    tens.collect {|hex| replacements.each {|replacement| hex.gsub!(replacement[0], replacement[1])}}
    ones.collect {|hex| replacements.each {|replacement| hex.gsub!(replacement[0], replacement[1])}}
    tens.collect! {|ten| ten.to_i * 16}
    ones.collect! {|one| one.to_i }
    numbers = ones.zip(tens).map{|ten, one| ten + one}
    number_codes = (1..26).to_a.push(32).push((97..122).to_a).flatten
    letter_codes = *('A'..'Z').to_a.push(' ').push(('a'..'z').to_a).flatten
    result = []
    numbers.collect {|num| result.push(letter_codes[number_codes.index(num)])}
    puts result.join
end

array = %w(09 74 20 69 73 20 17 65 64 6E 65 73 64 61 79 20 6D 79 20 64 75 64 65 74)
hex_to_dec(array)