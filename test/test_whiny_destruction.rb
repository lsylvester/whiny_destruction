require 'helper'

class TestWhinyDestruction < Test::Unit::TestCase
  
  context "a model that can't be destroyed" do
    setup do
      @model = Destroyable.new
      @model.can_be_destroyed = false
    end
    
    should "raise RecordNotDestroyed when destroy! is called" do
      assert_raise ActiveRecord::RecordNotDestroyed do 
        @model.destroy!
      end
    end
  end
  
  context "a model that can be destroyed" do
    setup do
      @model = Destroyable.new
      @model.can_be_destroyed = true
    end
    
    should "not raise RecordNotDestroyed when destroy! is called" do
      assert_nothing_raised do 
        @model.destroy!
      end
    end
  end
end
