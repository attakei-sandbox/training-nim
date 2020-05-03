##[
  単体ガチャ

  - ガチャ対象の種類と確率をシーケンスにして突っ込む
  - ランダムで1個取り出す
]##
import gacha


if isMainModule:
  const gacha_items = @[
    GachaItem(label: "SSR", weight: 5),
    GachaItem(label: "SR", weight: 10),
    GachaItem(label: "R", weight: 25),
    GachaItem(label: "HN", weight: 30),
    GachaItem(label: "N", weight: 30),
  ]
  echo lottery(gacha_items).label
