class Producto < ActiveRecord::Base
  belongs_to :prov, :class_name => "Proveedor", :foreign_key => "idProveedor"
  belongs_to :fam, :class_name => "Familium", :foreign_key => "idFamilia"
  has_many :Pedido, :through => Item
  
  
  validates :Nombre       ,  :length => {
                            :minimum   => 2,
                            :maximum   => 25,
                            :too_short => ": Debe de tener por lo menos %{count} letras.",
                            :too_long  => ": Debe de tener un maximo de %{count} letras."
                          },
                          :presence => { :message => ": No puede ser ingresado como en blanco." }
  
  validates :Codigo       ,  :length => {
                            :minimum   => 1,
                            :maximum   => 6,
                            :too_short => ": Debe de tener por lo menos %{count} letras.",
                            :too_long  => ": Debe de tener un maximo de %{count} letras."
                          },
                          :presence => { :message => ": No puede ser ingresado como en blanco." },
                          :uniqueness => { :case_sensitive => false ,  :message => ": No es unico." }
                          
  validates :idFamilia    , :numericality => { :only_integer => true },
                          :presence => { :message => ": No puede ser ingresado como en blanco." }
                          
  validates :Precio       , :numericality => { :message => ": %{value} No es un valor valido." },
                          :presence => { :message => ": No puede ser ingresado como en blanco." }                          
                          
   validates :idProveedor , :numericality => { :only_integer => true },
                          :presence => { :message => ": No puede ser ingresado como en blanco." }                         
                          
  validates :Presentacion ,  :length => {
                            :minimum   => 1,
                            :maximum   => 25,
                            :too_short => ": Debe de tener por lo menos %{count} letras.",
                            :too_long  => ": Debe de tener un maximo de %{count} letras."
                          },
                          :presence => { :message => ": No puede ser ingresado como en blanco." }
                          
  
end
