class Support < ApplicationRecord
	validates :clients_id, presence: true, numericality: {only_integer: true}
	validates :users_id, presence: true, numericality: {only_integer: true}
	validates :detalle, presence: true,  length: { in: 1..50 }
	validates :titulo, presence: true,  length: { in: 1..50 }
	validates :estado, presence: true,  length: { in: 1..50 }
end
