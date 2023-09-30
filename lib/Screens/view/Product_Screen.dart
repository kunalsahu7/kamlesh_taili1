import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamlesh_taili2/Screens/modal/Product_modal.dart';
import 'package:kamlesh_taili2/utills/Product_Apihelper.dart';
import 'package:sizer/sizer.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ProductScreen> {
  Productmodal productmodal = Productmodal();

  List<ProductDatum>? data = [];

  @override
  void initState() {
    super.initState();

    apiCall();
  }

  Future<void> apiCall() async {
    productmodal = await Apihelper.helper.ProductData();
    data = productmodal.productData;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 50.sp,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("OceanMeteach",
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      data!.sort(
                            (a, b) => a.name?.toUpperCase().compareTo(
                          b.name?.toUpperCase() ?? "",
                        ) ?? 0,
                      );print(data);
                      Get.back();
                      setState(() {});
                    },
                    child: Text(
                      "A To Z",
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      data!.sort(
                        (a, b) => a.price!.compareTo(b.price!),
                      );
                      Get.back();
                      setState(() {});
                    },
                    child: Text(
                      "Prize Min To Max",
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      data!.sort(
                        (a, b) => b.price!.compareTo(a.price!),
                      );
                      Get.back();
                      setState(() {});
                    },
                    child: Text(
                      "Prize Max To Min",
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      data!.sort(
                            (a, b) => b.name?.toUpperCase().compareTo(
                          a.name?.toUpperCase() ?? "",
                        ) ?? 0,
                      );print(data);
                      Get.back();
                      setState(() {});
                    },
                    child: Text(
                      "Z To A",
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    margin: EdgeInsets.all(10.sp),
                    child: Row(
                      children: [
                        Container(
                          height: 120.sp,
                          width: 100.sp,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              "${data![index].image}",
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 20.sp,
                              width: 180.sp,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                data![index].name == null
                                    ? ""
                                    : "${data![index].name}",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.sp),
                            Container(
                              height: 20.sp,
                              width: 180.sp,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                data![index].categoryName == null
                                    ? ""
                                    : "Category :- ${data![index].categoryName}",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.sp),
                            Container(
                              height: 20.sp,
                              width: 180.sp,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                data![index].id == null
                                    ? ""
                                    : "Price :- ${data![index].id}",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.sp),
                            Container(
                              height: 20.sp,
                              width: 180.sp,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                data![index].averageRating == null
                                    ? ""
                                    : "Rate :- ${data![index].averageRating}",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
