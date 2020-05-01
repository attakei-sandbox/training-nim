##[
  お題 FizzBuzz > 数値固定のFizzBuzz
  ==================================

  コード書き途中で読んだ
  ----------------------

  * https://nim-lang.org/docs/manual.html
  * https://nim-lang.org/docs/system.html
]##


proc main(goal: int) =
  ## FizzBuzzのメイン処理
  ## 仕様については省略
  var i: int = 0
  while i <= goal:
    if (i mod 15) == 0:
      echo "FizzBuzz"
    elif (i mod 3) == 0:
      echo "Fizz"
    elif (i mod 5) == 0:
      echo "Buzz"
    else:
      echo i
    i += 1


if isMainModule:
  ## main扱いで呼ばれた時に限り、100までのFizzBuzzを標準出力する
  main(100)
