class String
  
  def to_date_hash
    Parser.parse(self)
  end
    
  def to_pseudo_date
    PseudoDate.new(self)
  end
  
end