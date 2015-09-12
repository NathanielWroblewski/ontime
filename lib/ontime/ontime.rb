require 'date'

module On
  class OnTime
    SYSTEM_TIME = "%a %b %d %H:%M:%S %Y %Z"

    def initialize()
      @state = {}
    end

    ATTR_READERS = %i{ year month date hour min sec }.freeze
    ATTR_READERS.each do |attr|
      module_eval(
        "def #{attr};" +
          "@state['#{attr}'.to_sym] || Time.now.#{attr === :date ? :day : attr};" +
        "end"
      )
    end

    def of(month=Time.now.month, year=Time.now.year)
      set(month: MONTHS.index(month.to_sym) + 1, year: year)
    end

    def at(time=0)
      time = 0  if time == :midnight
      time = 12 if time == :midday
      set(
        hour: time.to_s.split(':').first.to_i,
        min: time.to_s.split(':')[1].to_i,
        sec: 0
      )
    end

    def and(given_seconds=0)
      set(sec: given_seconds.to_i)
    end

    def pm
      set(hour: hour + 12) if hour < 12
      self
    end

    def am
      set(hour: hour - 12) if hour > 11
      self
    end

    def to_s
      to_time.to_s
    end

    def to_time
      Time.new(year, month, date, hour, min, sec, offset)
    end

    def set(new_state)
      @state = @state.merge(new_state)
      self
    end

    def in(timezone='UTC')
      system_time = `zdump #{timezone}`.split()[1..-1].join(' ')

      set(offset: DateTime.strptime(system_time, SYSTEM_TIME).strftime('%Z'))
    end

    def offset
      @state[:offset]
    end
  end
end
