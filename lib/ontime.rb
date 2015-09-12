require 'ontime/version'
require 'ontime/ordinals'
require 'ontime/ontime'

module On
  MONTHS = %i{
    January February March April May June July August September October November December
  }.freeze

  MONTHS.each_with_index do |month, index|
    module_eval(
      "def self.#{month}(date=1, year=Time.new.year);" +
        "OnTime.new.set(month: #{index + 1}, date: date.to_i, year: year.to_i);" +
      'end'
    )
  end

  def self.the(date=1)
    OnTime.new.set(date: date, month: Time.now.month, year: Time.now.year)
  end
end
