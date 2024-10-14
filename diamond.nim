import std/strutils

proc diamond*(c: char): string =
  let cc = c.toUpperAscii
  let ci = ord(cc) - ord('A') + 1