class Person < ActiveRecord::Base
  belongs_to :user
  has_many :gifts, dependent: :destroy
  validates :name, presence: true,
                    length: { minimum: 1 }
end
