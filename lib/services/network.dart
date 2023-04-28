import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:roonyx/models/mock_response_model.dart';

const baseUrl = 'https://089d9bc7-d8ed-4b53-a7de-be125a924c61.mock.pstmn.io/';

class Network {
  Future<MockResponseModel> authoriseUser(String pin) async {
    var response = await http.get(Uri.parse('$baseUrl/get?pin=$pin'));

    return MockResponseModel.fromMap(jsonDecode(response.body));
  }
}
