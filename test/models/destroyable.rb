class CreateDestroyables < ActiveRecord::Migration
  def self.up
    create_table :destroyables do |t|
    end
  end
  
  def self.down
    drop_table :destroyables
  end
end


class Destroyable < ActiveRecord::Base
  attr_accessor :can_be_destroyed
  
  def check_can_be_destroyed
    @can_be_destroyed
  end
  before_destroy :check_can_be_destroyed
end