Dado("que existe o seguinte cadastro de usuário:") do |table|
  puts table.raw
  puts table.hashes

  table = table.map_column("idade") { |idade| idade.to_i }
  puts table.hashes
end
