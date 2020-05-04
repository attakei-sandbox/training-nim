##[
  FizzBuzz処理用モジュール
]##


proc runFizzBuzz*(goal: int) =
  ## FizzBuzzのメイン処理
  var i: int = 0
  while i < goal:
    i += 1
    if (i mod 15) == 0:
      echo "FizzBuzz"
    elif (i mod 3) == 0:
      echo "Fizz"
    elif (i mod 5) == 0:
      echo "Buzz"
    else:
      echo i
