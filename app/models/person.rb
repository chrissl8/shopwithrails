class Person < ActiveRecord::Base
  has_many :gifts, dependent: :destroy
  validates :name, presence: true,
                    length: { minimum: 1 }
end
