##[
  お題 Webサーバー > Hello world
  ==============================

  コード書き途中で読んだ
  ----------------------

  * https://nim-lang.org/docs/asynchttpserver.html
  * https://nim-lang.org/docs/system.html
]##
import asynchttpserver, asyncdispatch


proc resp_any(req: Request) {.async.} =
  await req.respond(
    Http200,
    "Hello world",
    newHttpHeaders([("Content-Type", "text/plain")])
  )


if isMainModule:
  ## main扱いで呼ばれた時に限り、どんなパスに対しても、hello worldを返すサーバーを起動
  let server = newAsyncHttpServer()
  waitFor server.serve(Port(8080), resp_any)
