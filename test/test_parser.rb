require File.dirname(__FILE__) + '/test_helper.rb'

class TestParser < Test::Unit::TestCase
  
  context "Date formats" do
    
    setup do
      @day = '25'
      @month = '06'
      @year = '1985'
      @string_date = 'Jun 25, 1985'
    end
    
    # 19850625
    context "yearmonthday" do
      should 'be exact precision' do
        assert_equal PseudoDate.new("#{@year}#{@month}#{@day}").precision, 'exact'
      end
      
      should 'match original input' do
        pd = PseudoDate.new("#{@year}#{@month}#{@day}")
        assert_equal @day, pd.day
        assert_equal @month, pd.month
        assert_equal @year, pd.year
      end
    end
    
    # 1985-25-06
    context "year-day-month" do
      should 'be exact precision' do
        assert_equal PseudoDate.new("#{@year}-#{@day}-#{@month}").precision, 'exact'
      end
      
      should 'match original input' do
        pd = PseudoDate.new("#{@year}-#{@day}-#{@month}")
        assert_equal @day, pd.day
        assert_equal @month, pd.month
        assert_equal @year, pd.year
      end
    end
    
    # 06-25-1985
    context "month-day-year" do
      should 'be exact precision' do
        assert_equal PseudoDate.new("#{@month}-#{@day}-#{@year}").precision, 'exact'
      end
      
      should 'match original input' do
        pd = PseudoDate.new("#{@month}-#{@day}-#{@year}")
        assert_equal @day, pd.day
        assert_equal @month, pd.month
        assert_equal @year, pd.year
      end
    end
    
    # 25-06-1985
    context "day-month-year" do
      should 'be exact precision' do
        assert_equal PseudoDate.new("#{@day}-#{@month}-#{@year}").precision, 'exact'
      end
      
      should 'match original input' do
        pd = PseudoDate.new("#{@day}-#{@month}-#{@year}")
        assert_equal @day, pd.day
        assert_equal @month, pd.month
        assert_equal @year, pd.year
      end
    end
    
    # 06/25/1985
    context "month/day/year" do
      should 'be exact precision' do
        assert_equal PseudoDate.new("#{@month}/#{@day}/#{@year}").precision, 'exact'
      end
      
      should 'match original input' do
        pd = PseudoDate.new("#{@month}/#{@day}/#{@year}")
        assert_equal @day, pd.day
        assert_equal @month, pd.month
        assert_equal @year, pd.year
      end
    end
    
    # 06/1985
    context "month/year" do
      should 'be partial precision' do
        assert_equal PseudoDate.new("#{@month}/#{@year}").precision, 'year_month'
      end
      
      should 'match original input' do
        pd = PseudoDate.new("#{@month}/#{@year}")
        assert_equal @month, pd.month
        assert_equal @year, pd.year
      end
    end
    
    # 85
    context "two digit year" do
      should 'be year precision' do
        assert_equal PseudoDate.new("85").precision, 'year'
      end
      
      should 'match original input' do
        pd = PseudoDate.new("85")
        assert_equal @year, pd.year
      end
    end
    
    # 1985
    context "four digit year" do
      should 'be year precision' do
        assert_equal PseudoDate.new(@year).precision, 'year'
      end
      
      should 'match original input' do
        pd = PseudoDate.new(@year)
        assert_equal @year, pd.year
      end
    end
    
    # Jun 25, 1985
    context "string date" do
      should 'be exact precision' do
        assert_equal PseudoDate.new(@string_date).precision, 'exact'
      end
      
      should 'match original input' do
        pd = PseudoDate.new(@string_date)
        assert_equal @day, pd.day
        assert_equal @month, pd.month
        assert_equal @year, pd.year
      end
    end
  
  end
  
end