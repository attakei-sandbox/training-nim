##[
  Slack Incoming Webhook

  - 特に細かい指定なし

  読んだ
  ------

  - https://nim-lang.org/docs/httpclient.html
  - https://nim-lang.org/docs/json.html
  - https://nim-lang.org/docs/system.html
  - https://nim-lang.org/docs/os.html
]##
import httpClient
import json
import os


if isMainModule:
  if paramCount() == 0:
    echo("Require URL")
    quit(1)
  let url = commandLineParams()[0]
  let client = newHttpClient()
  client.headers = newHttpHeaders({"Content-Type": "application/json"})
  let payload = newJObject()
  payload["text"] = newJString("Hello")
  let resp = client.post(url, $payload)
  echo resp.status
