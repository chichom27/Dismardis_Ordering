class Familium < ActiveRecord::Base
  belongs_to :categ, :class_name => "Categorium", :foreign_key => "idCategoria"
  has_many :Producto
end
