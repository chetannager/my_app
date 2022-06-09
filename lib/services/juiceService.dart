import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/constants/endpoints.dart';

class juiceService {
  Future<dynamic> searchJuice(searchTerm) async {
    final http.Response response = await http
        .get(Uri.parse(Endpoints.baseAPIUrl + "search.php?s=" + searchTerm));
    print("statusCode:" + response.statusCode.toString());
    return response;
  }
}
