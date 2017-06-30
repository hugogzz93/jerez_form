class RowWriter
	def initialize(data)
		@data = data
		@keys = data.keys
	end

	def row(row_num)
		["", I18n.t(@keys[row_num]), "", @data[@keys[row_num]]]
	end

	def how_to_get
		@data[:how_to_get].chars.each_slice(50).map(&:join)
	end

	def security
		@data[:security].chars.each_slice(50).map(&:join)
	end

	def data
		@data
	end

	def number_of_rows
		@keys.size
	end

	# def write(csv)
	# 	@keys.each_with_index do |key, i|
	# 		csv << write_row(i)
	# 	end
	# end
end