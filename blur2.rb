class Image
	attr_accessor :image

	def initialize(array)
		@image = array
	end

	def output_image
		@image.each do |row|
			row.each do |pixel|
			print pixel, ' '
		end
			puts
		end
	end


	def manhattan_distance(x1, y1, x2, y2)
		(x1 - x2).abs + (y1 - y2).abs
	end

	def blur(distance)
		ones = get_ones
		@image.each_with_index do |row, x2|
			row.each_with_index do |cell, y2|
				ones.each do |x1, y1|
					my_distance = manhattan_distance(x1, y1, x2, y2)
					if my_distance <= distance
						@image[x2][y2] = 1
					end
				end
			end
		end
	end

	def get_ones
		ones = []
		@image.each_with_index do |row, i|
			row.each_with_index do |cell, j|
				if cell == 1
					ones << [i, j]				
				end
			end
		end
		ones
	end
end

image = Image.new([
	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
])

image.output_image
puts "---"
image.blur(2)
puts "---"
image.output_image
puts "---"

