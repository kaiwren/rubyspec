require File.expand_path('../../../spec_helper', __FILE__)

describe "delegating String#to_int to String#to_i" do
  before(:each) do 
    String.class_eval{ alias_method :to_int, :to_i }
  end
  
  it "should not File.readlines hang" do
    File.readlines(__FILE__).should_not be_empty
  end
  
  after(:each) do 
    String.class_eval{ undef :to_int }
  end
end
