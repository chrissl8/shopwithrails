class Gift < ActiveRecord::Base
  belongs_to :person
  validates :item, presence: true
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }
end
