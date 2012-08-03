require 'helper'

class TestRangeExtensions < Test::Unit::TestCase
  should "respond to business day list from fixnum range" do
    now = Time.parse("April 9th, 2010, 12:33 pm")
    list = (3..8).business_days(now)
    assert_equal list.first, 3.business_day.since(now).to_date
    assert_equal list.last, 8.business_day.since(now).to_date
    assert_equal list.size, (3..8).count
  end

  should "respond to business day list from date range" do
    now = Time.parse("April 9th, 2010, 12:33 pm")
    list = (3.business_day.since(now).to_date..8.business_day.since(now).to_date).business_days(now)
    assert_equal list.first, 3.business_day.since(now).to_date
    assert_equal list.last, 8.business_day.since(now).to_date
    assert_equal list.count, (3..8).count
  end
end
