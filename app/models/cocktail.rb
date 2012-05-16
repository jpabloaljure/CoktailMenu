class Cocktail < ActiveRecord::Base
  attr_accessible :description, :grade, :name, :oficial, :prise
  has_many :comments
end
