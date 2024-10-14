import std/times

proc addGigasecond*(dt: DateTime): DateTime =
  dt + initDuration(seconds = 1000000000)


let d = parse("2015-01-24 22:00:00", "yyyy-MM-dd HH:mm:ss")

echo addGigasecond(d)