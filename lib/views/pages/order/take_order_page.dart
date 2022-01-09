import 'package:flutter/material.dart';
import 'package:waiter_app/constants/constants.dart';
import 'package:waiter_app/views/pages/order/order_preview_page.dart';
import 'package:waiter_app/views/pages/search/search_page.dart';
import 'package:waiter_app/views/widgets/custom_drawer.dart';
import 'package:get/get.dart';

class TakeOrderPage extends StatelessWidget {
  TakeOrderPage({Key? key}) : super(key: key);

  final TextEditingController numberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
  String? _digitValue = '';

  void _onClick(context, String? value) {
    _digitValue = _digitValue! + value!;
    int.parse(_digitValue!);
    (context as Element).markNeedsBuild();
  }

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
          'Take Order',
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
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 8),
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
              padding: EdgeInsets.symmetric(vertical: 14),
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
              height: ScreenSize(context).mainHeight / 3.5,
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
                    color: Colors.blue.withOpacity(.08),
                    height: 5,
                  );
                },
              ),
            ),
            //Keypad Section
            Flexible(
              child: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //1st row
                      Form(
                        key: _formKey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: ScreenSize(context).mainHeight / 15,
                              width: 240,
                              child: TextFormField(
                                controller: numberController
                                  ..text = _digitValue!
                                  ..selection = TextSelection.collapsed(
                                      offset: numberController.text.length),
                                validator: (value) {
                                  return numberController.text = value!;
                                },
                                enabled: false,
                                cursorColor: AppColor.primaryColor,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                    top: 0,
                                    left: 15,
                                  ),
                                  hintText: "Enter Menu Number",
                                  hintStyle: const TextStyle(
                                    color: Color(0xff706881),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  fillColor: const Color(0xffF2CDD4),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Color(0xffF2CDD4),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            //clear button
                            SizedBox(
                              height: ScreenSize(context).mainHeight / 15,
                              width: ScreenSize(context).mainWidth / 4.8,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: Colors.white, // background
                                  onPrimary: AppColor.primaryColor,
                                  // foreground
                                  side: const BorderSide(
                                    width: 1,
                                    color: Color(0xffEE1D48),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(5), // <-- Radius
                                  ),
                                ),
                                onPressed: () {
                                  if (_digitValue != null &&
                                      _digitValue.toString().isNotEmpty) {
                                    _digitValue = _digitValue
                                        .toString()
                                        .substring(0,
                                            _digitValue.toString().length - 1);
                                  }
                                  (context as Element).markNeedsBuild();
                                },
                                child: const Center(
                                  child: Icon(
                                    Icons.backspace_outlined,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      //2nd row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                return _onClick(context, '1');
                              },
                              child: const Text(
                                "1",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                return _onClick(context, '2');
                              },
                              child: const Text(
                                "2",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                return _onClick(context, '3');
                              },
                              child: const Text(
                                "3",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: AppColor.primaryColor,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                Get.to(const SearchPage());
                              },
                              child: const Text(
                                "Search",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      //3rd row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                return _onClick(context, '4');
                              },
                              child: const Text(
                                "4",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                return _onClick(context, '5');
                              },
                              child: const Text(
                                "5",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                return _onClick(context, '6');
                              },
                              child: const Text(
                                "6",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: AppColor.primaryColor,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Clear",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      //4th row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                return _onClick(context, '7');
                              },
                              child: const Text(
                                "7",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                return _onClick(context, '8');
                              },
                              child: const Text(
                                "8",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                return _onClick(context, '9');
                              },
                              child: const Text(
                                "9",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white, // background
                                onPrimary: AppColor.primaryColor,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: AppColor.primaryColor,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Add",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      //5th row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 82),
                            child: SizedBox(
                              height: ScreenSize(context).mainHeight / 15,
                              width: ScreenSize(context).mainWidth / 4.8,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: Colors.white, // background
                                  onPrimary: AppColor.primaryColor,
                                  // foreground
                                  side: const BorderSide(
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(5), // <-- Radius
                                  ),
                                ),
                                onPressed: () {
                                  return _onClick(context, '0');
                                },
                                child: const Text(
                                  "0",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 32,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize(context).mainHeight / 15,
                            width: ScreenSize(context).mainWidth / 4.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: AppColor.primaryColor, // background
                                onPrimary: Colors.white,
                                // foreground
                                side: const BorderSide(
                                  width: 1,
                                  color: AppColor.primaryColor,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                Get.off(OrderPreviewPage());
                              },
                              child: const Text(
                                "Done",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
