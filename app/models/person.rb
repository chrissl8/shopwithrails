class Person < ActiveRecord::Base
  has_many :gifts, dependent: :destroy
  belongs_to :user
  validates :name, presence: true,
                    length: { minimum: 1 }
end
