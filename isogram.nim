import std/strutils

proc isIsogram*(s: string): bool = 
  var char_set: set[char] = {}
  for i in s:
    let c = i.toLowerAscii
    if c == '-' or c == '_': continue
    if c in char_set: return false
    incl(char_set,c)
  return true


echo isIsogram("abbde")
