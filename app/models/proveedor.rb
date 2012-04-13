class Proveedor < ActiveRecord::Base


  validates :Codigo       ,  :length => {
                            :minimum   => 2,
                            :maximum   => 6,
                            :too_short => ": Debe de tener por lo menos %{count} letras.",
                            :too_long  => ": Debe de tener un maximo de %{count} letras."
                          } , 
                          :presence => { :message => ": No puede ser ingresado como en blanco." }, 
                          :uniqueness => { :case_sensitive => false ,  :message => ": No es unico." }
  validates :Nombre, :presence => { :message => ": No puede ser ingresado como en blanco." }, 
                            :length => {
                              :minimum   => 5,
                              :maximum   => 100,
                              :too_short => ": Debe de tener por lo menos %{count} letras.",
                              :too_long  => ": Debe de tener un maximo de %{count} letras."
                            }
  validates :Direccion    ,  :length => {
                            :minimum   => 5,
                            :maximum   => 200,
                            :too_short => ": Debe de tener por lo menos %{count} letras.",
                            :too_long  => ": Debe de tener un maximo de %{count} letras."
                          }
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
  validates :Contacto     , :presence => { :message => ": No puede ser ingresado como en blanco." }, 
                            :length => {
                              :minimum   => 5,
                              :maximum   => 100,
                              :too_short => ": Debe de tener por lo menos %{count} letras.",
                              :too_long  => ": Debe de tener un maximo de %{count} letras."
                            }
  validates_format_of     :TelContacto,  
                          :with => /^0[0-9]{8}$/i,
                          :message => ": Por favor ingrese un telefono valido."

                          
  validates :TelContacto     , :numericality => { :message => ": %{value} No es un valor valido." },
                          :length => {
                            :minimum   => 9,
                            :maximum   => 9,
                            :too_short => ": Debe de tener por lo menos %{count} numeros.",
                            :too_long  => ": Debe de tener un maximo de %{count} numeros."
                          }
  validates :Email        , :presence => { :message => ": No puede ser ingresado como en blanco." }


  validates_format_of     :Email,  
                          :with => /^[a-z0-9\._-]+@[a-z0-9]+(\.[a-z0-9]+)*\.([a-z]{3}|[a-z]{2})(\.[a-z]{2}){0,1}$/i,
                          :message => ": Por favor ingrese un email valido."
  validates :ruc       , :numericality => { :message => ": %{value} No es un valor valido." },
                          :length => {
                            :minimum   => 13,
                            :maximum   => 13,
                            :too_short => ": Debe de tener por lo menos %{count} numeros.",
                            :too_long  => ": Debe de tener un maximo de %{count} numeros."
                          } 

    #t.string   "RUC"


            def ruc_es_valida
            

                ii = (ruc[0,2]).to_i
                if ii > 24 || ii < 1
                  errors.add(:ruc, ": no es valida.")
                  return
                end

                tercerDigito = (ruc[2,1]).to_i
                paso = ruc[10,3]
                if (tercerDigito == 9 && paso == "000") #Error por lo menos debe haber una principal
                  errors.add(:ruc, ": no es valida.")
                  return
                end

                paso = ruc[9,4]
                if ((tercerDigito == 6 || tercerDigito == 8) && paso == "0000") #Error por lo menos debe haber una principal
                  errors.add(:ruc, ": no es valida.")
                  return
                end

                #JCGM - 2006-09-14 - Según REQ.979621 debe ser para todos los RUC's (Se comentan estas lineas)
                #if(TercerDigito != '6' && TercerDigito != '8' && TercerDigito != '9' return 4 //El Tercer dígito debe ser 8 o 6 o 9

                if (tercerDigito != 6 && tercerDigito != 8 && tercerDigito != 9)
                
                    if (ruc[10,3] != "001")  #Error por lo menos debe haber una principal
                      errors.add(:ruc, ": no es valida.")
                      return
                    end
                    if (!validaCedula(ruc[0,10])) #Error en Digito Verificador
                      errors.add(:ruc, ": no es valida.")
                      return
                    end
                end

                if (tercerDigito == 9)
                
                    acum = 0
                    cadena = "432765432"
                    i = 0
                    while i < 9
                        dig1 = (cadena[i,1]).to_i
                        dig2 = (ruc[i,1]).to_i
                        acum = acum + (dig1 * dig2)
                        i = i + 1
                    end
                    acum = 11 - (acum % 11)
                    if (acum == 11) 
                      acum = 0
                    end

                    if ((ruc[9]).to_i != acum)  #Error en dígito verificador
                      errors.add(:ruc, ": no es valida.")
                      return
                    end
                end

                if (tercerDigito == 6 || tercerDigito == 8)
                
                    acum = 0
                    cadena = "32765432"
                    i = 0
                    while i < 8
                        dig1 = (cadena[i,1]).to_i
                        dig2 = (ruc[i,1]).to_i
                        acum = acum + (dig1 * dig2)
                        i = i + 1
                    end
                    acum = 11 - (acum % 11)
                    if (acum == 11) 
                      acum = 0
                    end
                      

                    if ((ruc[8]).to_i != acum) #Error en dígito verificador
                      errors.add(:ruc, ": no es valida.")
                      return
                    end
                end
            end

      def validaCedula(cedula)
        s_valor = cedula.to_s
        paso = 0
        prov = (s_valor[0,2]).to_i;
        if prov > 24 || prov < 1
           return false
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
           return false
        end
        return true
      end
end
