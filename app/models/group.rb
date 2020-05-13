class Group < ApplicationRecord

  has_many :messages, dependent: :destroy
  has_many :connections, dependent: :destroy

end
