class Range
  def business_days(options = {})
    time = options[:time].nil? ? Time.now : options[:time]
    first_day = self.first.is_a?(Date) ? self.first : self.first.business_day.since(time).to_date
    last_day = self.last.is_a?(Date) ? self.last : self.last.business_day.since(time).to_date
    days = (first_day..last_day)
    skip_holiday = options[:skip_holiday].nil? ? true : options[:skip_holiday]
    days = days.select{ |day| day.workday? } if skip_holiday
    days
  end
end
