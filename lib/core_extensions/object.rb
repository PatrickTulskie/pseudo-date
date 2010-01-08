class Object
  
  def is_numeric?(n) 
    n.nil? ? false : Integer(n) rescue false
  end
  
end