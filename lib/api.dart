import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app8/model/sanpham.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  String serverURL = kIsWeb ? "http://127.0.0.1" : "http://10.0.2.2";

  Future<List<Sanpham>> getSanpham() async {
    final response =
        await http.get(Uri.parse("${serverURL}/api-demo/api/index.php"));

    if (response.statusCode == 200) {
      List<Sanpham> listSanpham = (jsonDecode(response.body) as List)
          .map((data) => Sanpham.fromJson(data))
          .toList();
      return listSanpham;
    } else {
      throw Exception('Lỗi load dữ liệu từ server');
    }
  }
}