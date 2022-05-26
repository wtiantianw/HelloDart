// 静态服务器 
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart' as shelf_router;
import 'package:shelf_static/shelf_static.dart' as shelf_static;

Future<void> main(List<String> args) async {

  final port = int.parse(Platform.environment['PORT'] ?? '5500');

  // 一个请求队列 
  final cascade = Cascade().add(_staticHandler);

  // 启动一个 HTTP 服务 
  final server = await shelf_io.serve(
      // 处理请求的时候，顺便做个日志. 
      logRequests().addHandler(cascade.handler),
      InternetAddress.anyIPv4,
      port);

  print(
      'Serving at http://${server.address.host}:${server.port}, CTRL+C to stop.');
}

final _staticHandler =
    shelf_static.createStaticHandler('public', defaultDocument: 'index.html');