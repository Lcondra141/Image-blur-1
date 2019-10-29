class Image

    def initialize(data)
        @data = data
        @row_length = data.length
        @col_length = data.length
    end 

    def output_image
        @data.each do |row|
        row.each do |pixel|
        print pixel, ' '
        end 
        puts
    end 
    end 

    def blur(row_index, col_index)
        @data[row_index -1][col_index] = 1 unless row_index == 0 # top
        @data[row_index +1][col_index] = 1 unless row_index >= @row_length-1 # bottom
        @data[row_index][col_index -1] = 1 unless col_index == 0 # left
        @data[row_index][col_index +1] = 1 unless col_index >= @col_length-1 #right
    end

    def find_ones
        one_pixel = []

        @data.each_with_index do |row_data, row_index|
            row_data.each_with_index do |cell, col_index|
                if cell == 1
                    one_pixel << [row_index, col_index]
                end
            end
        end   
        return one_pixel   
    end


    def transform
    data_coords = find_ones
    data_coords.each do |x, y|
        blur(x, y)
    end  
    end
end



    image = Image.new([
    [0, 0, 0, 0],
    [0, 1, 0, 0],
    [0, 0, 0, 1],
    [0, 0, 0, 0]
    ])

image.output_image
puts "-------"
image.transform
image.output_image