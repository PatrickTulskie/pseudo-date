class PseudoDate
  attr_accessor :year, :day, :month, :date_hash
  
  def initialize(input)
    @date_hash = if input.is_a?(Hash)
      Hash[input.to_hash.map { |k, v| [k.to_s.downcase.to_sym, v] }]
    else
      input = '00000000' if input.to_s.strip == '19000000'
      @date_hash = input.to_s.strip.to_date_hash
    end
    if @date_hash
      @year = @date_hash[:year].to_s.match('1900') ? '0000' : @date_hash[:year].to_s.strip
      @month = @date_hash[:month].to_s.strip
      @day = @date_hash[:day].to_s.strip
    else
      @year = @month = @day = nil
    end
    if @year && @year.match('~') && @year.length == 3
      @year = @year.to_i
      @year = @year > Date.today.year.to_s.gsub('20','').to_i ? "19#{@year}" : "20#{@year}"
    end
    correct_digits!
    @year.to_s.gsub!('~','')
  end
  
  def precision
    correct_digits!
    if @year.nil? || (@year.to_s == '0000' && @month.to_s == '00') || (@year.to_s == "8888")
      "invalid"
    elsif self.to_date
      'exact'
    elsif @month != '00' && @day == '00'
      'year_month'
    elsif @month == '00' && @day == '00'
      'year'
    else
      'invalid'
    end
  end
  
  # =====================
  # = Boolean Questions =
  # =====================
  def valid?
    !(@date_hash.nil? || @date_hash.empty?) && self.present?
  end
  
  def blank?
    (@year.to_s == '0000' && @month.to_s == '00' && @day.to_s == '00')
  end
  alias_method :empty?, :blank?
  
  def present?
    !self.blank?
  end
  
  # ====================
  # = Export Functions =
  # ====================
  def to_date
    self.valid? ? Date.parse("#{@year}-#{@month}-#{@day}") : nil rescue nil
  end
  
  def to_s
    return "" unless self.valid?
    
    case self.precision
    when 'invalid'; ""
    when 'weak_year'; ""
    when 'exact'; "#{month}/#{day}/#{year}"
    when 'year_month'; "#{month}/#{year}"
    when 'year'; year
    else; ''
    end
  end
  
  def to_hash
    @date_hash
  end
  
  # ========================
  # = Comparison Operators =
  # ========================
  def <(other)
    case self.comparison_mode(other)
    when 'exact'
      self.to_date < other.to_date
    when 'year_month'
      self.year == other.year ? (self.month < other.month) : (self.year < other.year)
    when 'year'
      self.year < other.year
    when 'mixed'
      if self.precision == 'invalid'
        true
      elsif other.precision == 'invalid'
        false
      elsif self.year == other.year
        if self.month == other.month
          self.day.to_i < other.day.to_i
        else
          self.month < other.month
        end
      else
        self.year < other.year
      end
    else
      false
    end
  end
  
  def >(other)
    other < self
  end
  
  def ==(other)
    (self.year == other.year) && (self.month == other.month) && (self.day == other.day)
  end
  
  def <=>(other)
    self == other ? 0 : (self < other ? -1 : 1)
  end
  
  protected
  
  def comparison_mode(other)
    if self.precision == other.precision
      self.precision
    else
      'mixed'
    end
  end
  
  private
  
  def correct_digits!
    @year  = '0000' if @year.to_s.strip.length == 0
    @month = '00' if @month.to_s.strip.length == 0
    @day   = '00' if @day.to_s.strip.length == 0
    
    @day   = "0#{@day}" if @day.to_s.length == 1
    @month = "0#{@month}" if @month.to_s.length == 1
    
    %w(day month year).each do |i|
      @date_hash[i.to_sym] = self.send(i)
    end
  end
  
end