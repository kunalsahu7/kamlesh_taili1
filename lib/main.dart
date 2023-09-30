import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamlesh_taili2/Screens/view/Product_Screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return
        GetMaterialApp(
          theme: ThemeData(useMaterial3: true),
          debugShowCheckedModeBanner: false,
          getPages: [
            GetPage(
              name: '/',
              page: () => ProductScreen(),
            ),
          ],
        );
      },
    ),
  );
}
