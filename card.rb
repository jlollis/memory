# card.rb - Julie Lollis

class Card

  # initialize class variables
  @@count = 0

  attr_accessor :image, :visible

  def initialize(image)
    @image = image
    @visible = false
    @@count += 1
  end

  def self.print_count()
    @@count
  end

  def self.decrement_count
    @@count -= 2
  end

  def self.visible?
    @visible
  end

  def self.show
    @visible = true
  end

end