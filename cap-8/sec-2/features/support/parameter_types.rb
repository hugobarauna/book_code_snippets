require "date"

ParameterType(
  name:        "date",
  regexp:      /(\d+)-(\d+)-(\d+)/,
  type:        Date,
  transformer: ->(day, month, year) {
    Date.new(year.to_i, month.to_i, day.to_i)
  }
)
