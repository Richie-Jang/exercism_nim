import std/strformat

type
  Clock* = object
    hour*: range[0..23]
    minute*: range[0..59]

  Minutes* = distinct int

proc hourCorrect(h: int): int =
    if h > 0:
      result = h mod 24
    else:
      return hourCorrect(24 + h)

proc minuteCorrect(h: int, m: int): (int,int) =   
  if m < 0:
    let mm1 = abs(m) div 60
    let mm2 = abs(m) mod 60
    let h1 = hourCorrect(h - mm1 - 1)    
    result = minuteCorrect(h1, 60 - mm2)
  elif m >= 60:
    let mm1 = m div 60
    let mm2 = m mod 60
    result = minuteCorrect(h+mm1, mm2)
  else:
    result = (h,m)

proc initClock*(hour, minute: int): Clock =  
  var (h,m) = minuteCorrect(hour, minute)
  h = hourCorrect(h)
  result = Clock(hour : h, minute : m)

proc `$`*(c: Clock): string =
  result = fmt"{c.hour:02}:{c.minute:02}"

proc `+`*(c: Clock, v: Minutes): Clock = 
  result = initClock(c.hour, c.minute + int(v))

proc `-`*(c: Clock, v: Minutes): Clock =
  result = initClock(c.hour, c.minute - int(v))

let a1 = initClock(1, -40)
echo a1