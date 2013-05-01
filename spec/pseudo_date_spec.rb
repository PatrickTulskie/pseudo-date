require File.dirname(__FILE__) + '/spec_helper.rb'

describe "PseudoDate" do
  
  before(:each) do
    @day         = '25'
    @month       = '06'
    @year        = '1985'
    @string_date = 'Jun 25, 1985'
  end
  
  context "blank dates" do
    subject { PseudoDate.new("") }
    
    it { should be_blank }
    it { should be_empty }
    it { should_not be_present }
    it { should_not be_valid }
  end
  
  context "partial date types" do
    it "should demonstrate later dates as greater than older dates" do
      old_date = PseudoDate.new(:year => @year, :month => @month)
      new_date = PseudoDate.new(:year => 1996, :month => @month)
      (old_date < new_date).should be_true
    end
    it "should respond properly with the spaceship operator" do
      old_date = PseudoDate.new(:year => @year, :month => @month)
      new_date = PseudoDate.new(:year => 1996, :month => @month)
      (old_date <=> new_date).should == -1
      (new_date <=> old_date).should == 1
      (new_date <=> new_date).should == 0
    end
  end
  
  context "complete date types" do
    it "should demonstrate later dates as greater than older dates" do
      old_date = PseudoDate.new(:year => @year, :month => @month, :day => @day)
      new_date = PseudoDate.new(:year => 1996, :month => @month, :day => @day)
      (old_date < new_date).should be_true
    end
    it "should respond properly with the spaceship operator" do
      old_date = PseudoDate.new(:year => @year, :month => @month, :day => @day)
      new_date = PseudoDate.new(:year => 1996, :month => @month, :day => @day)
      (old_date <=> new_date).should == -1
      (new_date <=> old_date).should == 1
      (new_date <=> new_date).should == 0
    end
  end
  
  context "mixed date types" do
    it "should demonstrate later dates as greater than older dates" do
      old_date = PseudoDate.new(:year => @year, :month => @month)
      new_date = PseudoDate.new(:year => 1996, :month => @month, :day => @day)
      (old_date < new_date).should be_true
    end
    it "should demonstrate invalid dates as less than complete dates" do
      complete = PseudoDate.new(:year => @year, :month => @month)
      invalid = PseudoDate.new("")
      (complete > invalid).should be_true
    end
    it "should respond properly with the spaceship operator" do
      old_date = PseudoDate.new(:year => @year, :month => @month)
      new_date = PseudoDate.new(:year => 1996, :month => @month, :day => @day)
      (old_date <=> new_date).should == -1
      (new_date <=> old_date).should == 1
      (new_date <=> new_date).should == 0
    end
  end
  
  context "date sorting" do
    it "should work for mixed date types" do
      dates = [{ :year => 2011, :month => 5 }, '1985', nil].map { |d| PseudoDate.new(d) }
      sorted = dates.sort
      sorted.first.year.should == "0000"
      sorted.last.year.should == "2011"
    end
  end
  
  context "converting to a hash" do
    it "should use double digit strings for day and month" do
      date = PseudoDate.new(:day => '1', :month => '2', :year => '1980')
      date.to_hash[:day].should == "01"
      date.to_hash[:month].should == "02"
    end
  end
  
end