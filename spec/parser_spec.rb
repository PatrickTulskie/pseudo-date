require File.dirname(__FILE__) + '/spec_helper.rb'

describe "PseudoDate Parsing" do
  
  before(:each) do
    @day         = '25'
    @month       = '06'
    @year        = '1985'
    @string_date = 'Jun 25, 1985'
  end
  
  context "date hash" do
    it "should parse an exact hash" do
      pd = PseudoDate.new(:year => @year, :day => @day, :month => @month)
      pd.day.should == @day
      pd.month.should == @month
      pd.year.should == @year
    end
  
    it "should parse a hash inexact keys" do
      pd = PseudoDate.new('Year' => @year, 'day' => @day, :Month => @month)
      pd.day.should == @day
      pd.month.should == @month
      pd.year.should == @year
    end
  end
  
  # 19850625
  context "yearmonthday" do
    it 'should be exact precision' do
      PseudoDate.new("#{@year}#{@month}#{@day}").precision.should == 'exact'
    end
  
    it 'should match original input' do
      pd = PseudoDate.new("#{@year}#{@month}#{@day}")
      pd.day.should == @day
      pd.month.should == @month
      pd.year.should == @year
    end
  end
  
  # 1985-25-06
  context "year-day-month" do
    it 'should be exact precision' do
      PseudoDate.new("#{@year}-#{@day}-#{@month}").precision.should == 'exact'
    end
  
    it 'should match original input' do
      pd = PseudoDate.new("#{@year}-#{@day}-#{@month}")
      pd.day.should == @day
      pd.month.should == @month
      pd.year.should == @year
    end
  end
  
  # 06-25-1985
  context "month-day-year" do
    it 'should be exact precision' do
      PseudoDate.new("#{@month}-#{@day}-#{@year}").precision.should == 'exact'
    end
  
    it 'should match original input' do
      pd = PseudoDate.new("#{@month}-#{@day}-#{@year}")
      pd.day.should == @day
      pd.month.should == @month
      pd.year.should == @year
    end
  end
  
  # 25-06-1985
  context "day-month-year" do
    it 'should be exact precision' do
      PseudoDate.new("#{@day}-#{@month}-#{@year}").precision.should == 'exact'
    end
  
    it 'should match original input' do
      pd = PseudoDate.new("#{@day}-#{@month}-#{@year}")
      pd.day.should == @day
      pd.month.should == @month
      pd.year.should == @year
    end
  end
  
  # 06/25/1985
  context "month/day/year" do
    it 'should be exact precision' do
      PseudoDate.new("#{@month}/#{@day}/#{@year}").precision.should == 'exact'
    end
  
    it 'should match original input' do
      pd = PseudoDate.new("#{@month}/#{@day}/#{@year}")
      pd.day.should == @day
      pd.month.should == @month
      pd.year.should == @year
    end
  end
  
  # 06/7/1985
  context "month/day/year" do
    it 'should be exact precision' do
      PseudoDate.new("#{@month}/7/#{@year}").precision.should == 'exact'
    end
  
    it 'should match original input' do
      pd = PseudoDate.new("#{@month}/7/#{@year}")
      pd.day.should == "07"
      pd.month.should == @month
      pd.year.should == @year
    end
  end
  
  # 06/1985
  context "month/year" do
    it 'should be partial precision' do
      PseudoDate.new("#{@month}/#{@year}").precision.should == 'year_month'
    end
  
    it 'should match original input' do
      pd = PseudoDate.new("#{@month}/#{@year}")
      pd.month.should == @month
      pd.year.should == @year
    end
  end
  
  # 85
  context "two digit year" do
    it 'should be year precision' do
      PseudoDate.new("85").precision == 'year'
    end
  
    it 'should match original input' do
      pd = PseudoDate.new("85")
      pd.year.should == @year
    end
  end

  context "four digit year" do
    
    it 'should be year precision' do
      PseudoDate.new(@year).precision.should == 'year'
    end
    
    # 1885
    context "in the 19th century" do
      it 'should match original input' do
        pd = PseudoDate.new('1885')
        pd.year.should == '1885'
      end
    end
    
    # 1985
    context "in the 20th century" do
      it 'should match original input' do
        pd = PseudoDate.new('1985')
        pd.year.should == '1985'
      end
    end
    
    # 2085
    context "in the 21st century" do
      it 'should match original input' do
        pd = PseudoDate.new('2085')
        pd.year.should == '2085'
      end
    end
    
  end

  # Jun 25, 1985
  context "string date" do
    it 'should be exact precision' do
      PseudoDate.new(@string_date).precision.should == 'exact'
    end
  
    it 'should match original input' do
      pd = PseudoDate.new(@string_date)
      pd.day.should == @day
      pd.month.should == @month
      pd.year.should == @year
    end
  end
  
end