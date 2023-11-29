class DaysToShipping < ActiveHash::Base
  self.data = [
    { id: 1, value: '---' },
    { id: 2, value: '1~2日で発送' },
    { id: 3, value: '2~3日で発送' },
    { id: 4, value: '4~7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
end
