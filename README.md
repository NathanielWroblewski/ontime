OnTime
===

OnTime is a dependency-less, thread-safe, and fluent way to create times in ruby.

Installation
---

Add this line to your application's Gemfile:

```rb
gem 'ontime'
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install ontime
```

Usage
---

```
On.January(3.rd)
On.March(24.th, 2007)
On.December(2.nd, 2008).at(1).pm
On.April(1.st).at('2:38').am
On.August(13.th).at('4:30').pm.and(56.seconds)
On.the(4.th).of(:July, 2015).at(2).pm.in('US/Pacific')
On.the(7.th).at(:midnight)
On.September(19.th).at(:midday).in('UTC')
```

General Patterns
---

```
On.Month(date, year).at(hour:minutes).and(seconds).am/pm.in(timezone)
On.the(date).of(month, year).at(hour:minutes).and(seconds).am/pm.in(timezone)
```

Additional Getters
---

Method   | Description
---------|----------
`to_time`| Converts the resulting `OnTime` object to a native ruby `Time` object
`month`  | Returns the month as an integer (1-12)
`date`   | Returns the day as an integer (1-31)
`year`   | Returns the year as an integer (ex. 2007)
`hour`   | Returns the hour as an integer (0-23)
`min`    | Returns the minutes as an integer (0-59)
`sec`    | Returns the seconds as an integer (0-60)
`offset` | Returns the timezone offset as a string (+/-HH:MM, ex. -06:00)

A Warning About Timezones
---
The implementation for timezone offset lookup depends on the UNIX utility
`zdump`, and is not a super-robust implementation.

Contributing
---

1. Fork it (https://github.com/nathanielwroblewski/ontime/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
