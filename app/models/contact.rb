class Contact < ApplicationRecord
	validates :email, presence: true,  length: { in: 1..250 }
	validates :nombre, presence: true, length: { in: 1..100 }
	validates :clients_id, presence: true, numericality: {only_integer: true}
	validates :apellido, presence: true,  length: { in: 1..100 }
	validates :puesto, presence: true,  length: { in: 1..100 }
	validates :telefono, presence: true, numericality: { only_integer: true } ,length: { is: 8 }
end
