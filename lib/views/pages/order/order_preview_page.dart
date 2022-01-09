import 'package:flutter/material.dart';
import 'package:waiter_app/constants/constants.dart';
import 'package:waiter_app/views/pages/order/order_details_page.dart';
import 'package:waiter_app/views/pages/order/take_order_page.dart';
import 'package:waiter_app/views/widgets/custom_drawer.dart';
import 'package:get/get.dart';

class OrderPreviewPage extends StatelessWidget {
  OrderPreviewPage({Key? key}) : super(key: key);
  final List<String> _tableNumber = [
    'Table 1',
    'Table 2',
    'Table 3',
    'Table 4',
    'Table 5',
    'Table 6',
    'Table 7',
    'Table 8',
    'Table 9',
    'Table 10',
    'Table 11',
    'Table 12',
  ];
  String? _selectedTable;
  int _item = 0;
  void _addItem(context) {
    _item++;
    (context as Element).markNeedsBuild();
  }

  void _minusItem(context) {
    _item--;
    (context as Element).markNeedsBuild();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Order Preview',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
      ),
      drawer: CustomDrawer(
        indexClicked: 1,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: const Color(0xffF2CDD4),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    hint: const Text(
                      'Select Table',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    menuMaxHeight: ScreenSize(context).mainHeight / 3,
                    value: _selectedTable,
                    items: _tableNumber.map((tableNumber) {
                      return DropdownMenuItem(
                        child: Text(tableNumber),
                        value: tableNumber,
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      _selectedTable = value.toString();
                      (context as Element).markNeedsBuild();
                    },
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Order items(12 Items)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff160040),
                ),
              ),
            ),
            Container(
              height: ScreenSize(context).mainHeight / 1.7,
              color: Colors.white,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.white,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            height: 78,
                            width: 78,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage(Images.food),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 78,
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        '10. Meet Masala Pizza',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff160040),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Center(
                                          child: FloatingActionButton(
                                            heroTag: "btn1",
                                            backgroundColor: Colors.white,
                                            elevation: 0,
                                            onPressed: () {},
                                            child: const Icon(
                                              Icons.clear,
                                              size: 18,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 14,
                                        width: 62,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffF0F0F0),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Size: Medium',
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w300,
                                              color: Color(0xff160040),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 14,
                                        width: 62,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffF0F0F0),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Crust: Medium',
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w300,
                                              color: Color(0xff160040),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 14,
                                        width: 62,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffF0F0F0),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Cheese: 25',
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w300,
                                              color: Color(0xff160040),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        height: 25,
                                        width: 39,
                                        child: Center(
                                          child: Text(
                                            '\$ 20',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff160040),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 25,
                                        width: 86,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                            width: 1,
                                            color: const Color(
                                              0xffF2CDD4,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 20,
                                              width: 15,
                                              child: Center(
                                                child: FloatingActionButton(
                                                  heroTag: "btn2",
                                                  backgroundColor: Colors.white,
                                                  elevation: .5,
                                                  onPressed: () {
                                                    _minusItem(context);
                                                  },
                                                  child: const Text(
                                                    '-',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xffEE1D48),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                              width: 15,
                                              child: Center(
                                                child: Text(
                                                  _item.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff160040),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                              width: 15,
                                              child: Center(
                                                child: FloatingActionButton(
                                                  heroTag: "btn3",
                                                  backgroundColor: Colors.white,
                                                  elevation: .5,
                                                  onPressed: () {
                                                    _addItem(context);
                                                  },
                                                  child: const Text(
                                                    '+',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xffEE1D48),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.blue.withOpacity(.03),
                    height: 5,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: ScreenSize(context).mainWidth / 2.4,
                  height: 42,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.white,
                      onPrimary: AppColor.primaryColor,
                      onSurface: AppColor.primaryColor, // background
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(
                          color: Color(0xffEE1D48),
                        ), // <-- Radius
                      ),
                    ),
                    onPressed: () {
                      Get.off(TakeOrderPage());
                    },
                    child: const Text(
                      "Add More",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: ScreenSize(context).mainWidth / 2.2,
                  height: 42,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: AppColor.primaryColor,
                      onSurface: AppColor.primaryColor, // background
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), // <-- Radius
                      ),
                    ),
                    onPressed: () {
                      Get.off(OrderDetailsPage());
                    },
                    child: const Text(
                      "Confirm Order",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
