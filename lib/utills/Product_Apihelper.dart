import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kamlesh_taili2/Screens/modal/Product_modal.dart';

class Apihelper {
  static final helper = Apihelper._();

  Apihelper._();

  Future<Productmodal> ProductData() async {
    String Link =
        "https://praticle-service.s3.ap-south-1.amazonaws.com/red_and_white_api.json";

    var responce = await http.get(
      Uri.parse(Link),
    );
    var json = jsonDecode(responce.body);
    return  Productmodal.fromJson(json);
  }
}
