class Hours < ActiveRecord::Base
  belongs_to :hours_target, :polymorphic => true

  def spans( starts, ends )
    start >= self.start_at && ends <= self.end_at
  end
end
