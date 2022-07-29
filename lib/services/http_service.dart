import 'dart:convert';
import 'package:http/http.dart';
import '../models/post_model.dart';

class Network {

  static String base = "62e21d02e8ad6b66d8538db6.mockapi.io";
  static Map<String,String> headers = {'Content-Type':'application/json; charset=UTF-8'};

  /* Http Apis */

  static String apiList = "/api/contacts";
  static String apiCreate = "/api/contacts";
  static String apiUpdate = "/api/contacts/"; //{id}
  static String apiDelete = "/api/contacts/"; //{id}

  /* Http Requests */

  static Future<String?> getResponse(String api, Map<String, String> params) async {
    var uri = Uri.https(base, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> postResponse(String api, Map<String, String> params) async {
    print(params.toString());
    var uri = Uri.https(base, api); // http or https
    var response = await post(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> putResponse(String api, Map<String, String> params) async {
    var uri = Uri.https(base, api); // http or https
    var response = await put(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> deleteResponse(String api, Map<String, String> params) async {
    var uri = Uri.https(base, api, params); // http or https
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      'name': post.name,
      'phone': post.phone,
      'id': post.id.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      'name': post.name,
      'phone': post.phone,
      'id': post.id.toString(),
    });
    return params;
  }

  /* Http Parsing */

  static List<Post> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Post>.from(json.map((x) => Post.fromJson(x)));
    return data;
  }

}