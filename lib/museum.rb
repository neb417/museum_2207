require 'pry'
class Museum
  attr_reader :name,
              :exhibits,
              :recommend_exhibit,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
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

  def admit(patron)
    @patrons.push(patron)
  end

  def patrons_by_exhibit_interest
    patrons_sorted_by_interests = {}

    @exhibits.each do |exhibit|
      # patrons_sorted_by_interests[exhibit] = exhibit.cost, exhibit.name
      # binding.pry
       @patrons.each do |patron|
         patron.interests.each do |interest|
        #  binding.pry
         patrons_sorted_by_interests[exhibit] = patron if interest == exhibit.name
        #  binding.pry
         end
        end
      end
    # binding.pry
    patrons_sorted_by_interests
  end
end
