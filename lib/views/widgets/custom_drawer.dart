import 'package:flutter/material.dart';
import 'package:waiter_app/constants/constants.dart';
import 'package:waiter_app/views/pages/authentication/login_page.dart';
import 'package:get/get.dart';
import 'package:waiter_app/views/pages/order/order_history_page.dart';
import 'package:waiter_app/views/pages/order/take_order_page.dart';
import 'package:waiter_app/views/pages/profile/profile_page.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key, required this.indexClicked}) : super(key: key);
  int indexClicked;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(Images.profile),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  "Jhon Doe",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          _drawerItem(
            icon: Icons.account_circle_outlined,
            text: 'Profile',
            indexNumber: 0,
            onTap: () {
              Get.to(ProfilePage());
              //indexClicked = indexClicked;
              (context as Element).markNeedsBuild();
            },
          ),
          _drawerItem(
            icon: Icons.add_alert_rounded,
            text: 'Take order',
            indexNumber: 1,
            onTap: () {
              indexClicked = indexClicked;
              Get.off(TakeOrderPage());
              (context as Element).markNeedsBuild();
              Get.back();
            },
          ),
          _drawerItem(
            icon: Icons.add_alert,
            text: 'Order history',
            indexNumber: 2,
            onTap: () {
              indexClicked = indexClicked;
              Get.off(const OrderHistoryPage());
              (context as Element).markNeedsBuild();
              Get.back();
            },
          ),
          _drawerItem(
            icon: Icons.logout,
            text: 'Log out',
            indexNumber: 3,
            onTap: () {
              //indexClicked = indexClicked;
              Get.off(LogInPage());
              (context as Element).markNeedsBuild();
            },
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(
      {required IconData icon,
      required String text,
      required int indexNumber,
      required GestureTapCallback onTap}) {
    return ListTile(
      selected: indexClicked == indexNumber,
      selectedTileColor: AppColor.primaryColor,
      title: Row(
        children: [
          Icon(
            icon,
            color: indexClicked == indexNumber
                ? Colors.white
                : AppColor.primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: indexClicked == indexNumber
                    ? Colors.white
                    : AppColor.primaryColor,
              ),
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
