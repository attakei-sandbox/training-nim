##[
  お題 Webサーバー > Static contents
  ==================================

  コード書き途中で読んだ
  ----------------------

  - https://nim-lang.org/docs/pathnorm.html
  - https://nim-lang.org/docs/mimetypes.html
]##
import os
import mimetypes
import pathnorm
import strutils
import asynchttpserver, asyncdispatch


proc resp_any(base_dir: string): (proc(req: Request) {.async, gcsafe.}) =
  ## リクエストに応じて実行フォルダ配下のファイルをレスポンスする
  let mime = newMimetypes()
  return proc(req: Request) {.async.} =
    let resource = normalizePath(os.getCurrentDir() & req.url.path)
    if not existsFile(resource):
      # ファイルが存在しない場合は、404を返す
      await req.respond(
        Http404,
        "Not Found",
        newHttpHeaders([("Content-Type", "text/plain")])
      )
    else:
      # ファイルが存在する場合は、拡張子からmimeを判定して中身をレスポンス
      let f = open(resource, FileMode.fmRead)
      var mime_type: string = mime.getMimetype(resource.splitFile()[2])
      if mime_type.split("/")[0] == "text":
        mime_type = mime_type & ";charset=utf-8"
      await req.respond(
        Http200,
        f.readAll(),
        newHttpHeaders([("Content-Type", mime_type)])
      )


if isMainModule:
  let server = newAsyncHttpServer()
  let cb = resp_any(os.getCurrentDir())
  waitFor server.serve(Port(8080), cb)
