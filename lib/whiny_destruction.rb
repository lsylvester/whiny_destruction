module ActiveRecord
  class RecordNotDestroyed < ActiveRecordError
  end
end

module WhinyDestruction
  def destroy!
    destroy || raise(ActiveRecord::RecordNotDestroyed)
  end
end

ActiveRecord::Base.send(:include, WhinyDestruction)