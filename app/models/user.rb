class User < ApplicationRecord
	validates :nombre, presence: true,  length: { in: 1..100 }
	validates :apellido, presence: true,  length: { in: 1..100 }
	validates :password_digest, presence: true,   length: { is: 8 }
	validates :username, presence: true,  length: { in: 1..250 }, uniqueness: true
end
