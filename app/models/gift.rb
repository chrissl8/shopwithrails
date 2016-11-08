class Gift < ActiveRecord::Base
  belongs_to :person
  validates :item, presence: true
end
