import 'package:flutter/material.dart';
import 'package:waiter_app/constants/constants.dart';
import 'package:waiter_app/views/pages/authentication/login_page.dart';
import 'package:get/get.dart';
import 'package:waiter_app/views/pages/order/order_history_page.dart';
import 'package:waiter_app/views/pages/order/take_order_page.dart';

void main() {
  runApp(const WaiterApp());
}

class WaiterApp extends StatelessWidget {
  const WaiterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Waiter App',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: AppColor.primaryColor,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => LogInPage()),
        GetPage(name: "/TakeOrderPage", page: () => TakeOrderPage()),
        GetPage(
            name: "/OrderHistoryPage", page: () => const OrderHistoryPage()),
      ],
    );
  }
}
