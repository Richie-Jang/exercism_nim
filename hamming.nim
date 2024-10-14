import std/strutils


proc distance(a,b: string): int = 
  let atrim = a.strip()
  let btrim = b.strip()
  let alen = atrim.len()
  let blen = btrim.len()
  if alen != blen:
    raise newException(ValueError, "length are not the same")
  for idx in 0 ..< alen:
    if atrim[idx] != btrim[idx]:
      result += 1
  return    

echo distance("G", "")
