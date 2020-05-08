##[
  Slack Incoming Webhook helper
]##
import httpClient
import json


type Payload* = ref object
  ## ペイロード保持用タイプ
  text*: string


proc `$`*(payload: Payload): string =
  let data = newJObject()
  data["text"] = newJString(payload.text)
  return $data


type SlackClient* = ref object
  ## Incoming Webhook向けクライアント
  url*: string


proc post*(client: SlackClient, payload: Payload): Response =
  ## ペイロードをクライアント経由で処理
  let c = newHttpClient()
  c.headers = newHttpHeaders({"Content-Type": "application/json"})
  return c.post(client.url, $payload)

