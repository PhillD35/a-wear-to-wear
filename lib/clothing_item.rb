class ClothingItem
  attr_reader :type

  def self.from_file(file)
    lines = File.readlines(file, chomp: true, encoding: 'UTF-8')

    title = lines[0]
    type = lines[1]
    temp_min, temp_max = lines[2].scan(/\-?\d+/).map(&:to_f)

    self.new(title: title, type: type, temp_range: temp_min..temp_max)
  end

  def initialize(title:, type:, temp_range:)
    @title = title
    @type = type
    @temp_range = temp_range
  end

  def fits_weather?(temp)
    @temp_range.include?(temp)
  end

  def to_s
    "#{@title} (#{@type}) #{@temp_range}"
  end
end
