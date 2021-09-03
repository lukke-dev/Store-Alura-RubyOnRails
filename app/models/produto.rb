class Produto < ApplicationRecord
  belongs_to :departamento, optional: true

  validates :nome, :preco, :cor, :quantidade, presence: true
  validates :nome, length: { in: 4..25 }
end
