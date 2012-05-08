class Usuario < ActiveRecord::Base
  has_many :Pedido
  belongs_to :tipoUser, :class_name => "TipoUsuario", :foreign_key => "idTipoUsuario"
  belongs_to :ciud, :class_name => "Ciudad", :foreign_key => "idCiudad"
  belongs_to :creator, :class_name => "Usuario", :foreign_key => "createdby"
  
  attr_accessor :current_password
  attr_accessor :password
  attr_accessor :password_confirmation
  
  #validate :checkDescuento, :if => :checkTipoUsuario?
  validates :createdby     ,:presence => { :message => ": No puede ser ingresado como en blanco." }
  validates :Username     ,  :length => {
                            :minimum   => 5,
                            :maximum   => 16,
                            :too_short => ": Debe de tener por lo menos %{count} letras.",
                            :too_long  => ": Debe de tener un maximo de %{count} letras."
                          } , 
                          :presence => { :message => ": No puede ser ingresado como en blanco." }, 
                          :uniqueness => { :case_sensitive => false ,  :message => ": No es unico." }
  validates :Password     ,  :length => {
                            :minimum   => 5,
                            :too_short => ": Debe de tener por lo menos %{count} letras."
                          },
                          :presence => { :message => ": No puede ser ingresado como en blanco." }
  validates :Nombre       ,  :length => {
                            :minimum   => 2,
                            :maximum   => 25,
                            :too_short => ": Debe de tener por lo menos %{count} letras.",
                            :too_long  => ": Debe de tener un maximo de %{count} letras."
                          },
                          :presence => { :message => ": No puede ser ingresado como en blanco." }
  validates :Apellido     ,  :length => {
                            :minimum   => 2,
                            :maximum   => 25,
                            :too_short => ": Debe de tener por lo menos %{count} letras.",
                            :too_long  => ": Debe de tener un maximo de %{count} letras."
                          },
                          :presence => { :message => ": No puede ser ingresado como en blanco." }
  validates :idTipoUsuario, :numericality => { :only_integer => true },
                          :presence => { :message => ": No puede ser ingresado como en blanco." }
  validates :codigo       ,  :length => {
                            :minimum   => 2,
                            :maximum   => 6,
                            :too_short => ": Debe de tener por lo menos %{count} letras.",
                            :too_long  => ": Debe de tener un maximo de %{count} letras."
                          },
                          :presence => { :message => ": No puede ser ingresado como en blanco." },
                          :uniqueness => { :case_sensitive => false ,  :message => ": No es unico." }
  validates :NombreNegocio, :presence => { :message => ": No puede ser ingresado como en blanco." }, 
                            :length => {
                              :minimum   => 5,
                              :maximum   => 100,
                              :too_short => ": Debe de tener por lo menos %{count} letras.",
                              :too_long  => ": Debe de tener un maximo de %{count} letras."
                            }, :if => :checkTipoUsuario? 
  validates :Direccion    ,  :length => {
                            :minimum   => 5,
                            :maximum   => 200,
                            :too_short => ": Debe de tener por lo menos %{count} letras.",
                            :too_long  => ": Debe de tener un maximo de %{count} letras."
                          }, :if => :checkTipoUsuario?
  validates :Referencia   ,  :length => {
                            :minimum   => 5,
                            :maximum   => 200,
                            :too_short => ": Debe de tener por lo menos %{count} letras.",
                            :too_long  => ": Debe de tener un maximo de %{count} letras."
                          }, :if => :checkTipoUsuario?
  validates :Zona         ,  :length => {
                            :minimum   => 2,
                            :maximum   => 50,
                            :too_short => ": Debe de tener por lo menos %{count} letras.",
                            :too_long  => ": Debe de tener un maximo de %{count} letras."
                          }, :if => :checkTipoUsuario?
  validates :idCiudad     , :numericality => { :only_integer => true,  :message => ": %{value} No es un valor valido."  },
                          :presence => { :message => ": No puede ser ingresado como en blanco." }
  validates :Email        , :presence => { :message => ": No puede ser ingresado como en blanco." }


  validates_format_of     :Email,  
                          :with => /^[a-z0-9\._-]+@[a-z0-9]+(\.[a-z0-9]+)*\.([a-z]{3}|[a-z]{2})(\.[a-z]{2}){0,1}$/i,
                          :message => ": Por favor ingrese un email valido."
  validates_format_of     :Telefono,  
                          :with => /^0[0-9]{8}$/i,
                          :message => ": Por favor ingrese un telefono valido."

                          
  validates :Telefono     , :numericality => { :message => ": %{value} No es un valor valido." },
                          :length => {
                            :minimum   => 9,
                            :maximum   => 9,
                            :too_short => ": Debe de tener por lo menos %{count} numeros.",
                            :too_long  => ": Debe de tener un maximo de %{count} numeros."
                          }
  validates :Descuento    , :numericality => { :message => ": %{value} No es un valor valido." },
                          :inclusion => {
                            :in   => 0..1,
                            :message   => ": Debe de tener un valor entre 0 y 1."
                          }, :if => :checkTipoUsuario?

  validates :cedula       , :numericality => { :message => ": %{value} No es un valor valido." },
                          :length => {
                            :minimum   => 10,
                            :maximum   => 10,
                            :too_short => ": Debe de tener por lo menos %{count} numeros.",
                            :too_long  => ": Debe de tener un maximo de %{count} numeros."
                          } 
  validate :cedula_es_valida
  
    #falta validacion de la cedula  "Cedula"
  
  #=====================================
  #  Helper
  #=====================================
  
  #def checkDescuento
  #  descuento = (descuento / 100).round(2)
  #  if descuento != 0 && descuento < 0.01
  #     errors.add(:descuento, ": no es descuento valido.")
  #  end
  #end
  
  def checkTipoUsuario?
    return idTipoUsuario == 4
  end
  
  def self.codigoHelper(inc_number)
    case inc_number.to_s
      when "1"
        return "A"
      when "2"
        return "B"
      when "3"
        return "C"
      when "4"
        return "D"
      when "5"
        return "E"
      when "6"
        return "F"
      when "7"
        return "G"
      when "8"
        return "H"
      when "9"
        return "I"
      when "10"
        return "J"
      when "11"
        return "K"
      when "12"
        return "L"
      when "13"
        return "M"
      when "14"
        return "N"
      when "15"
        return "O"
      when "16"
        return "P"
      when "17"
        return "Q"
      when "18"
        return "R"
      when "19"
        return "S"
      when "20"
        return "T"
      when "21"
        return "U"
      when "22"
        return "V"
      when "23"
        return "W"
      when "24"
        return "X"
      when "25"
        return "Y"
      when "26"
        return "Z"
      end
  end

      

  def cedula_es_valida
    s_valor = cedula.to_s
    paso = 0
    prov = (s_valor[0,2]).to_i;
    if prov > 24 || prov < 1
       errors.add(:cedula, ": no es valida.")
    end
    
    acum = 0
    i = 0
    while  i <= s_valor.length - 2  do   
      if (((i + 1) % 2) == 0)
        acum += (s_valor[i, 1]).to_i
      else
        paso = (((s_valor[i, 1]).to_i) * 2)
        if paso > 9
          paso = paso - 9
        end
        acum = acum + paso;
      end
      i = i + 1
    end
                
    acum = 10 - (acum % 10);
    if acum == 10
       acum = 0
    end
                     
    if (s_valor[9, 10]).to_i != acum
       errors.add(:cedula, ": no es valida.")
    end
    
  end
end
