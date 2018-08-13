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
  word_match = false
  letter_match = 0

  input.chars.each do |letter|
    if letters_in_hand.include?(letter.upcase)
      letters_in_hand.delete(letter.upcase)
      letter_match += 1
    end
  end

  if letter_match == input.length
    word_match = true
  end

return word_match
end
