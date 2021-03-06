require_relative 'lib/clothing_item'
require_relative 'lib/wardrobe'

wardrobe = Wardrobe.from_data(__dir__)

puts 'Сколько градусов за окном? Можно с минусом'
print 'Градусы: '
input = STDIN.gets.to_f

puts

wardrobe.choose_clothes(input)
puts wardrobe.result
