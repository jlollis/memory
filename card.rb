# card.rb - Julie Lollis

class Card

# Initialize our class variables
  @@count = 0

  attr_accessor :image, :visible

  def initialize(image)
    @image = image
    @visible = false
    @@count += 1
  end

  def self.print_count()
    # puts "Card count is: #@@count"
    @@count
  end

  def self.decrement_count
    @@count -= 2
  end

end