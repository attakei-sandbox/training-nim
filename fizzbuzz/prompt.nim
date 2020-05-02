##[
  お題 FizzBuzz > プロンプトで入力してもらうやつ
  ==============================================

  コード書き途中で読んだ
  ----------------------

  * https://nim-lang.org/docs/manual.html
  * https://nim-lang.org/docs/tut1.html
  * https://nim-lang.org/docs/system.html
  * https://nim-lang.org/docs/io.html
]##
import strutils
import simple


if isMainModule:
  ## 入力を促し、整数だったらFizzBuzzする。
  stdout.write("Input: ")
  var goal = readLine(stdin)
  for g in goal:
    if not isDigit(g):
      echo "Not digit!"
      quit(1)
  main(parseInt(goal))
