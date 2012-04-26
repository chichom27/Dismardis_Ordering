class Pedido < ActiveRecord::Base
  has_many :Producto, :through => Item
  belongs_to :user, :class_name => "Usuario", :foreign_key => "id_usuario"
  belongs_to :pestado, :class_name => "EstadoPedido", :foreign_key => "idEstado"


  validates :Codigo       ,  :length => {
                            :minimum   => 1,
                            :maximum   => 15,
                            :too_short => ": Debe de tener por lo menos %{count} letras.",
                            :too_long  => ": Debe de tener un maximo de %{count} letras."
                          },
                          :presence => { :message => ": No puede ser ingresado como en blanco." },
                          :uniqueness => { :case_sensitive => false ,  :message => ": No es unico." }

  validates :idEstado     , :numericality => { :only_integer => true },
                          :presence => { :message => ": No puede ser ingresado como en blanco." }
  validates :id_usuario   , :numericality => { :only_integer => true },
                          :presence => { :message => ": No puede ser ingresado como en blanco." }

  validates :Total        , :numericality => { :message => ": %{value} No es un valor valido." },
                          :presence => { :message => ": No puede ser ingresado como en blanco." }




end
