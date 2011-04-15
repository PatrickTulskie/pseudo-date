require File.dirname(__FILE__) + '/test_helper.rb'

class TestPseudoDate < Test::Unit::TestCase
  
  context "PseudoDate" do
    
    setup do
      @day = '25'
      @month = '06'
      @year = '1985'
      @string_date = 'Jun 25, 1985'
    end
    
    context "partial date types" do
      should "demonstrate later dates as greater than older dates" do
        old_date = PseudoDate.new(:year => @year, :month => @month)
        new_date = PseudoDate.new(:year => 1996, :month => @month)
        assert old_date < new_date
      end
      should "respond properly with the spaceship operator" do
        old_date = PseudoDate.new(:year => @year, :month => @month)
        new_date = PseudoDate.new(:year => 1996, :month => @month)
        assert_equal -1, (old_date <=> new_date)
        assert_equal 1, (new_date <=> old_date)
        assert_equal 0, (new_date <=> new_date)
      end
    end
    
    context "complete date types" do
      should "demonstrate later dates as greater than older dates" do
        old_date = PseudoDate.new(:year => @year, :month => @month, :day => @day)
        new_date = PseudoDate.new(:year => 1996, :month => @month, :day => @day)
        assert old_date < new_date
      end
      should "respond properly with the spaceship operator" do
        old_date = PseudoDate.new(:year => @year, :month => @month, :day => @day)
        new_date = PseudoDate.new(:year => 1996, :month => @month, :day => @day)
        assert_equal -1, (old_date <=> new_date)
        assert_equal 1, (new_date <=> old_date)
        assert_equal 0, (new_date <=> new_date)
      end
    end
    
    context "mixed date types" do
      should "demonstrate later dates as greater than older dates" do
        old_date = PseudoDate.new(:year => @year, :month => @month)
        new_date = PseudoDate.new(:year => 1996, :month => @month, :day => @day)
        assert old_date < new_date
      end
      should "respond properly with the spaceship operator" do
        old_date = PseudoDate.new(:year => @year, :month => @month)
        new_date = PseudoDate.new(:year => 1996, :month => @month, :day => @day)
        assert_equal -1, (old_date <=> new_date)
        assert_equal 1, (new_date <=> old_date)
        assert_equal 0, (new_date <=> new_date)
      end
    end
    
  end
  
end