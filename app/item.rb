class Item
  attr_accessor :name, :price, :items

  @@items = []

  def initialize(name,price)
    @name = name
    @price = price
    @@items << self
  end

  def self.find(name)
    @@items.each do |item|
      if name == item.name
        return item
      end
    end
    return nil
  end

end
