require 'pry'
class Museum
  attr_reader :name,
              :exhibits,
              :recommend_exhibit

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits.push(exhibit)
  end

  def recommend_exhibit(patron)
    @recommend_exhibit = []

    patron.interests.each do |interest|
      exhibits.each do |exhibit|
      @recommend_exhibit.push(exhibit) if interest == exhibit.name
      end
    end
    @recommend_exhibit
  end
end
