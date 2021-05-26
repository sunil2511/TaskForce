import 'package:dio/dio.dart';
import 'package:untitled3/Model/SucessModel.dart';
import 'package:http/http.dart' as http;

class AllConnectionsAPI {
  SucessModel model = SucessModel();

  Future<SucessModel> getAllConnectionsData() async {
    Response response =
        await Dio().post("http://www.mocky.io/v2/5dce95e23000004a00931aeb");
    print('response of all connections => ${response.data}');
    model = SucessModel.fromJson(response.data);
    return model;
  }
}

Future<List> getError() async {
  String url = 'http://www.mocky.io/v2/5dce96f23000008500931afa';
  Uri baseUri = Uri.parse(url);
  final http.Response response = await http.post(baseUri);
  print(response.statusCode);

  try {
    if (response.statusCode == 200) {
      print(response.body);
    }
  } catch (e) {
    print(e.toString());
  }
//  return errorList();
}
