class TipoUsuario < ActiveRecord::Base
  has_many :Usuario
end
