class Range
  def business_days(time = Time.now)
    first_day = self.first.is_a?(Date) ? self.first : self.first.business_day.since(time).to_date
    last_day = self.last.is_a?(Date) ? self.last : self.last.business_day.since(time).to_date
    (first_day..last_day).select{ |day| day.workday? }
  end
end
