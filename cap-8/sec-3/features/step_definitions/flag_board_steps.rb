Dado("que o jogador começou a jogar") do
  @board = [
    ["_", "_"],
    ["_", "_"]
  ]
end

Dado("que a bandeira está na posição [{int}, {int}]") do |m, n|
  @flag_coordinates = [m, n]
end

Quando("o jogador checa a posição [{int}, {int}]") do |m, n|
  player_found_the_flag = @flag_coordinates == [m, n]
  mark = player_found_the_flag ? "o" : "x"

  @board[m][n] = mark
end

Então("o tabuleiro deve ficar assim:") do |expected_board|
  expected_board.diff!(@board)
end
