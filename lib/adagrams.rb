require 'csv'
require 'pry'
# require_relative '../assets/dictionary-english.csv'

def draw_letters
letter_pool = %w(
  A A A A A A A A A
  B B
  C C
  D D D D
  E E E E E E E E E E E E
  F F
  G G G
  H H
  I I I I I I I I I
  J
  K
  L L L L
  M M
  N N N N N N
  O O O O O O O O
  P P
  Q
  R R R R R R
  S S S S
  T T T T T T
  U U U U
  V V
  W W
  X
  Y Y
  Z
)

player_hand = letter_pool.sample(10)

return player_hand
end


def uses_available_letters?(input, letters_in_hand)
  letter_match_counter = 0
  temp_letters_in_hand = letters_in_hand.dup

  input.chars.each do |letter|
    if temp_letters_in_hand.include?(letter.upcase)
      temp_letters_in_hand.delete_at(temp_letters_in_hand.index(letter.upcase))
      letter_match_counter += 1
    end
  end

  if letter_match_counter == input.length
    return true
  else
    return false
  end
end


def score_word(word)
  points = 0

  word.chars.each do |letter|

###################### Data structure ?

  case letter.upcase
    when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
      points += 1
    when "D", "G"
      points += 2
    when "B", "C", "M", "P"
      points += 3
    when "F", "H", "V", "W", "Y"
      points += 4
    when "K"
      points += 5
    when "J", "X"
      points += 8
    when "Q", "Z"
      points += 10
    end
  end

  if word.length > 6
    points += 8
  end

return points
end


def highest_score_from(words)
  highest_points_word = nil
  score = 0

  words.each do |word|
    if score_word(word) > score
      highest_points_word = word
      score = score_word(word)

    elsif score_word(word) == score
        if word.length == 10 && word.length != highest_points_word.length
           highest_points_word = word
        elsif word.length < highest_points_word.length && highest_points_word.length != 10
          highest_points_word = word
        end
    end
  end

  winning_word = {word: highest_points_word, score: score}
  return winning_word

end


def is_in_english_dict?(input)
  dictionary = CSV.open("assets/dictionary-english.csv")
  verify = false
  
  dictionary.each do |word|
    if word.include?(input)
      verify = true
    end
  end

  return verify
end
