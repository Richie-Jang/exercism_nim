import std/strutils

proc isPangram*(s: string): bool = 
  let all_char_set = {'a' .. 'z'}
  let all_char_count = all_char_set.len
  let s1 = s.toLower
  var check_set: set[char] = {}
  for c in s1:
    if c in all_char_set:
      check_set.incl(c)
  
  let c_set_count = check_set.len
  return all_char_count == c_set_count

echo isPangram("abcdefghijklmnopqrstuvwxyz")


import sets, sequtils

let data = toSeq('a'..'z').toHashSet
echo data.len