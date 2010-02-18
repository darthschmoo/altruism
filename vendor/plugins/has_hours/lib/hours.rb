class Hours < ActiveRecord::Base
  DOW_LABEL = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
  belongs_to :hours_target, :polymorphic => true

  def spans( starts, ends )
    start >= self.start_at && ends <= self.end_at
  end
end
