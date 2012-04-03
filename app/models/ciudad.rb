class Ciudad < ActiveRecord::Base
  belongs_to :provincia, :class_name => "Provincium", :foreign_key => "idProvincia"
  has_many :Usuario
end
