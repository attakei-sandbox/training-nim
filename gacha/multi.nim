##[
  10連ガチャ

  - ガチャ対象の種類と確率をシーケンスにして突っ込む
  - ランダムで10個取り出す
  - そのうち1個は、SR以上確定
  - 結果はレアリティが低い順に並べる

  読んだ
  ------

  - https://nim-lang.org/docs/algorithm.html
]##
import gacha
import sequtils
import algorithm


if isMainModule:
  const gacha_items = @[
    GachaItem(label: "SSR", weight: 5),
    GachaItem(label: "SR", weight: 10),
    GachaItem(label: "R", weight: 25),
    GachaItem(label: "N+", weight: 30),
    GachaItem(label: "N", weight: 30),
  ]
  # とりあえず、10個ピックアップ
  var picked: seq[GachaItem]
  picked = toSeq(1..10).mapIt(lottery(gacha_items))
  picked.sort(cmpRarelity)
  # 最高レアリティを判定して、SR未満しか無かったら、差し替える
  let good = picked[len(picked)-1]
  if good.label != "SSR" and good.label != "SR":
    picked.delete(len(picked)-1)
    picked.add(GachaItem(label: "SR", weight: 100))
  # レアリティだけを出力する
  echo picked.mapIt(it.label)
