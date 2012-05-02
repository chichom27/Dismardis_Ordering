class Item < ActiveRecord::Base
  belongs_to :Pedido
  belongs_to :prod, :class_name => "Producto", :foreign_key => "producto_id"
  
  
  validates :pedido_id     , :numericality => { :message => ": %{value} No es un valor valido. [id_PE]",
                                                 :only_integer => true, 
                                                 :greater_than_or_equal_to => 0
                                                 },
                             :presence => { :message => ": No puede ser ingresado como en blanco. [id_PE]" }
  validates :producto_id     , :numericality => { :message => ": %{value} No es un valor valido. [id_PR]",
                                                 :only_integer => true, 
                                                 :greater_than_or_equal_to => 0
                                                 },
                             :presence => { :message => ": No puede ser ingresado como en blanco. [id_PR]" }
  validates :cantidad     , :numericality => { :message => ": %{value} No es un valor valido.",
                                                 :only_integer => true, 
                                                 :greater_than_or_equal_to => 0
                                                 },
                             :presence => { :message => ": No puede ser ingresado como en blanco." }
  

end
