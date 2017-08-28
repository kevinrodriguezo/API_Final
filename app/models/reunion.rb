class Reunion < ApplicationRecord
	validates :clients_id, presence: true, numericality: {only_integer: true}
	validates :users_id, numericality: {only_integer: true}
	validates :titulo, presence: true,  length: { in: 1..100 }
end
