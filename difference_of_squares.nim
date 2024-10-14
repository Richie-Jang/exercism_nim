
iterator counting(n: int): int =
  var c = 1
  while c <= n:
    yield c
    inc(c)

proc squareOfSum*(n: int): int =
  for i in counting(n):
    result += i
  result = result * result

proc sumOfSquares*(n: int): int =
  for i in counting(n):
    result += i * i

proc difference*(n: int): int =
  return squareOfSum(n) - sumOfSquares(n)
