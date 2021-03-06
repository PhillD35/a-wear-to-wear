class Wardrobe
  def self.from_data(path)
    clothes = Dir['data/*.txt', base: path]

    clothes.map! { |clothing_file| ClothingItem.from_file(clothing_file) }

    self.new(clothes)
  end

  def initialize(clothes)
    @clothes = clothes
    @clothes_to_wear = []
  end

  def choose_clothes(temp)
    @clothes_to_wear = @clothes
                        .select { |item| item.fits_weather?(temp) }
                        .shuffle
                        .uniq(&:type)
  end

  def empty_message
    'На такую погоду у Вас вещей нет.'
  end

  def result
    @clothes_to_wear.empty? ? empty_message : @clothes_to_wear.sort_by(&:type)
  end
end
