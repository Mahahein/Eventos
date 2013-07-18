module ApplicationHelper
  
  def Moneda(value)
    '$ ' + value.to_s+ ' pesos'
  end
  
  def Porcentaje(value)
    value.to_s + ' %'
  end

end
