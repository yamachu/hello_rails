class Order < ApplicationRecord
	has_many :line_items
	enum status: {
		cart: 0,
		checked_out: 1,
	}

	def checkout!(at)
		update!(status: :checked_out, ordered_at: at)
	end
end
