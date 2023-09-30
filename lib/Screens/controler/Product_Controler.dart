import 'package:get/get.dart';
import 'package:kamlesh_taili2/Screens/modal/Product_modal.dart';
import 'package:kamlesh_taili2/utills/Product_Apihelper.dart';

class ProductControler extends GetxController {
  Productmodal? productmodal;

  Future<Productmodal?> Data() async {
    productmodal = await Apihelper.helper.ProductData();
    return productmodal;
  }
}
