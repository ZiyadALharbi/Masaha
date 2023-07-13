import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../constant_api.dart';

Future<Response> displayProduct() async {
  try {
    final box = GetStorage();
    var url = Uri.http(Api().url, Api().displayProduct);
    var response =
        await http.get(url, headers: {'authorization': box.read('token')});

    return response;
  } on HttpException catch (error) {
    return Response(error.message, 111);
  } on ArgumentError catch (error) {
    return Response(error.message, 111);
  } on ClientException catch (error) {
    return Response(error.message, 111);
  } on FlutterError catch (error) {
    return Response(error.message, 111);
  } catch (error) {
    print(error);
    return Response('error', 401);
  }
}
