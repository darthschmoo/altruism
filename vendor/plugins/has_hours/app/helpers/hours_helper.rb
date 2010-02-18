module BCA::HoursHelper
  def day_of_week( i )
    Hours::DOW_LABEL[i % 7]
  end
end
