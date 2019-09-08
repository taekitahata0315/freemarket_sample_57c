class Shipping_date < ActiveHash::Base
  self.data = [
  {id: '', name: '---'},
  {id: '1~2日で発送', name: '1~2日で発送'},
  {id: '2~3日で発送', name: '2~3日で発送'},
  {id: '4~7日で発送', name: '4~7日で発送'}
  ]
end
