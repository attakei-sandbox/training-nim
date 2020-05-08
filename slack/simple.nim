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
import os
import slack


if isMainModule:
  if paramCount() == 0:
    echo("Require URL")
    quit(1)
  let client = SlackClient(url: commandLineParams()[0])
  let payload = Payload()
  payload.text = "Hello"
  let resp = client.post(payload)
  echo resp.status
