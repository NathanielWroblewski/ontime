require 'spec_helper'

describe On, '.January' do
  it 'sets the month to 1' do
    expect(On.January.month).to eq 1
  end
end

describe On, '.February' do
  it 'sets the month to 2' do
    expect(On.February.month).to eq 2
  end
end

describe On, '.March' do
  it 'sets the month to 3' do
    expect(On.March.month).to eq 3
  end
end

describe On, '.April' do
  it 'sets the month to 4' do
    expect(On.April.month).to eq 4
  end
end

describe On, '.May' do
  it 'sets the month to 5' do
    expect(On.May.month).to eq 5
  end
end

describe On, '.June' do
  it 'sets the month to 6' do
    expect(On.June.month).to eq 6
  end
end

describe On, '.July' do
  it 'sets the month to 7' do
    expect(On.July.month).to eq 7
  end
end

describe On, '.August' do
  it 'sets the month to 8' do
    expect(On.August.month).to eq 8
  end
end

describe On, '.September' do
  it 'sets the month to 9' do
    expect(On.September.month).to eq 9
  end
end

describe On, '.October' do
  it 'sets the month to 10' do
    expect(On.October.month).to eq 10
  end
end

describe On, '.November' do
  it 'sets the month to 11' do
    expect(On.November.month).to eq 11
  end
end

describe On, '.December' do
  it 'sets the month to 12' do
    expect(On.December.month).to eq 12
  end
end

describe On, '.Month(date)' do
  it 'sets the correct month, date, and year' do
    expect(On.March(22.nd).month).to eq 3
    expect(On.March(22.nd).date).to eq 22
    expect(On.March(22.nd).year).to eq Time.now.year
  end
end

describe On, '.Month(date, year)' do
  it 'sets the correct month, date, and year' do
    expect(On.March(22.nd, 2007).month).to eq 3
    expect(On.March(22.nd, 2007).date).to eq 22
    expect(On.March(22.nd, 2007).year).to eq 2007
  end
end

describe On, '.the(date)' do
  it 'sets the correct month, date, and year' do
    expect(On.the(23.rd).month).to eq Time.now.month
    expect(On.the(23.rd).date).to eq 23
    expect(On.the(23.rd).year).to eq Time.now.year
  end
end

describe On, '.the(date).of(month)' do
  it 'sets the correct month, date, and year' do
    expect(On.the(27.th).of(:January).month).to eq 1
    expect(On.the(27.th).of(:January).date).to eq 27
    expect(On.the(27.th).of(:January).year).to eq Time.now.year
  end
end

describe On, '.the(date).of(month, year)' do
  it 'sets the correct month, date, and year' do
    expect(On.the(27.th).of(:January, 2007).month).to eq 1
    expect(On.the(27.th).of(:January, 2007).date).to eq 27
    expect(On.the(27.th).of(:January, 2007).year).to eq 2007
  end
end

describe On, '.at(hour)' do
  it 'sets the correct hour' do
    expect(On.February(14.th, 2007).at(10).hour).to eq 10
    expect(On.February(14.th, 2007).at(14).hour).to eq 14
    expect(On.February(14.th, 2007).at('12').hour).to eq 12
  end
end

describe On, '.at(:midnight)' do
  it 'sets the correct hour' do
    expect(On.February(14.th, 2007).at(:midnight).hour).to eq 0
  end
end

describe On, '.at(:midday)' do
  it 'sets the correct hour' do
    expect(On.February(14.th, 2007).at(:midday).hour).to eq 12
  end
end

describe On, '.at(hour:minutes)' do
  it 'sets the correct time' do
    expect(On.February(14.th, 2007).at('10:30').hour).to eq 10
    expect(On.February(14.th, 2007).at('10:30').min).to eq 30
    expect(On.February(14.th, 2007).at('14:40').hour).to eq 14
    expect(On.February(14.th, 2007).at('14:40').min).to eq 40
  end
end

describe On, '.am' do
  it 'translates hours over 11' do
    expect(On.February(14.th, 2007).at('12:30').am.hour).to eq 0
    expect(On.February(14.th, 2007).at('14:30').am.hour).to eq 2
    expect(On.February(14.th, 2007).at('10:30').am.hour).to eq 10
  end
end

describe On, '.pm' do
  it 'translates hours under 12' do
    expect(On.February(14.th, 2007).at('1:30').pm.hour).to eq 13
    expect(On.February(14.th, 2007).at('12:30').pm.hour).to eq 12
    expect(On.February(14.th, 2007).at('14:30').pm.hour).to eq 14
  end
end

describe On, '.and(seconds)' do
  it 'sets seconds' do
    expect(On.February(14.th, 2007).at(1).pm.and(21.seconds).sec).to eq 21
  end
end

describe On, '.in(timezone)' do
  it 'sets timezone' do
    On.February(16.th, 2009).at('2:30').pm.in('UTC').offset == '+00:00'
    On.February(16.th, 2009).at('2:30').pm.in('US/Pacific').offset == '-06:00'
    On.February(16.th, 2009).at('2:30').pm.in('US/Central').offset == '-05:00'
  end
end
