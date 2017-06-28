class RowWriter
	def initialize(data)
		@data = data
		@keys = data.keys
	end

	def write_row(row_num)
		[@keys[row_num], @data[@keys[row_num]]]
	end

	def write(csv)
		@keys.each_with_index do |key, i|
			csv << write_row(i)
		end
	end
end