import 'dart:convert';

import 'package:avtotest/model/bilet_model.dart';
import 'package:avtotest/model/savol_model.dart';
import 'package:http/http.dart';

class ApiService {
  static String url = "https://complexprogrammer.uz/GetBilet";

  static Future<List<Bilet>> getBilet() async {
    Response response = await get(Uri.parse(url));

    return jsontobiletlar(jsonDecode(response.body));
  }

  static Future<List<Savol>> getSavollar(int bilet) async {
    Response response = await get(
        Uri.parse("https://complexprogrammer.uz/GetSavol/?bilet=$bilet"));
    return jsontoList(jsonDecode(response.body));
  }
}
