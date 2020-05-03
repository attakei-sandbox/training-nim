##[
  ガチャの共通処理

  - https://nim-lang.org/docs/sequtils.html
  - https://nim-lang.org/docs/random.html
]##
import sequtils
import random


type GachaItem* = object
  ## ガチャ対象の要素
  label*: string  # ラベル(主に表示用)
  weight*: int  # 確率ウェイト


proc lottery*(items: seq[GachaItem]): GachaItem =
  ## ガチャ処理
  ## 候補からウェイトに従い、1個ピックアップする
  ## - ウェイト値の合計は100である必要はない
  randomize()
  # 全候補のウェイト値を合計している
  let weight = items.mapIt(it.weight).foldl(a + b)
  var key = rand(1..weight)
  for item in items:
    if item.weight >= key:
      return item
    key -= item.weight
  return items[items.len-1]
