ActiveRecord::Base.class_eval do
  # stands for "unique methods." Mostly saves typing in console mode
  def self.umethods
    self.methods.sort - ActiveRecord::Base.methods
  end

  def umethods
    self.methods.sort - ActiveRecord::Base.instance_methods
  end
end

