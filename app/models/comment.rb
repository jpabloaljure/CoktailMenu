class Comment < ActiveRecord::Base
  belongs_to :cocktail
  attr_accessible :name, :texto
end
