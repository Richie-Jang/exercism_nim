proc steps*(n: int): int =
  proc collatz(m: int, count: int): int =
    if m == 1:
        return count
    #check even
    let isEven = m mod 2 == 0
    if isEven:
        collatz(m div 2, count+1)
    else:
        collatz(m*3+1, count+1)

  if n <= 0:
    raise newException(ValueError, "n must be positive")
  
  return collatz(n, 0)


echo steps(1_000_000)
