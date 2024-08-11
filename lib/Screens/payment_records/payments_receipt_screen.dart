import 'package:flutter/material.dart';
import 'package:healtether_clinic_app/constant/constant.dart';
import '../payments/payment_receipt/payments_receipt_screen.dart';

class Item {
  TextEditingController treatmentController;
  TextEditingController quantityController;
  TextEditingController amountPerUnitController;
  TextEditingController discountRateController;

  Item({
    required this.treatmentController,
    required this.quantityController,
    required this.amountPerUnitController,
    required this.discountRateController,
  });
}

class PaymentsReceiptScreen extends StatefulWidget {
  const PaymentsReceiptScreen({super.key});

  @override
  State<PaymentsReceiptScreen> createState() => _PaymentsReceiptScreenState();
}

class _PaymentsReceiptScreenState extends State<PaymentsReceiptScreen> {
  List<Item> items = [
    Item(
      treatmentController: TextEditingController(text: 'Consultation'),
      quantityController: TextEditingController(text: '1'),
      amountPerUnitController: TextEditingController(text: '200.00 INR'),
      discountRateController: TextEditingController(text: '0.00%'),
    ),
  ];

  void addItem() {
    setState(() {
      int newItemIndex = items.length + 1;
      items.add(Item(
        treatmentController:
        TextEditingController(text: 'Consultation'),
        quantityController: TextEditingController(text: '1'),
        amountPerUnitController: TextEditingController(text: '200.00 INR'),
        discountRateController: TextEditingController(text: '0.00%'),
      ));
    });
  }

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
      for (int i = 0; i < items.length; i++) {
        items[i].treatmentController.text = 'Consultation';
      }
    });
  }

  bool get isItemsListNotEmpty => items.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: const Text(AppText.paymentsReceipt),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppText.addItems,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black1Color,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            AppText.treatment,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: screenWidth * 0.9,
                            color: const Color(0xffF8F7FC),
                            child: TextFormField(
                              controller: item.treatmentController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Quantity',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              Container(
                                width: screenWidth * 0.7,
                                color: const Color(0xffF8F7FC),
                                child: TextFormField(
                                  controller: item.quantityController,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 28),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Amt/unit',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              Container(
                                width: screenWidth * 0.7,
                                color: const Color(0xffF8F7FC),
                                child: TextFormField(
                                  controller: item.amountPerUnitController,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 28),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Dst. rate',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              Container(
                                width: screenWidth * 0.7,
                                color: const Color(0xffF8F7FC),
                                child: TextFormField(
                                  controller: item.discountRateController,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 28),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => deleteItem(index),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      children: [
                                        Icon(Icons.minimize_outlined,
                                            color: Colors.blueAccent),
                                        Padding(
                                          padding: EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            "Delete item",
                                            style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Montserrat',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        height: 2,
                                        width: 110,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: addItem,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      children: [
                                        Icon(Icons.add,
                                            color: Colors.blueAccent),
                                        Text(
                                          "Add another item",
                                          style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Montserrat',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        height: 2,
                                        width: 150,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          const SizedBox(height: 16),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 170),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: screenWidth * 0.1,
            child: Container(
              height: 60,
              width: screenWidth * 0.8,
              decoration: BoxDecoration(
                color: isItemsListNotEmpty
                    ? AppColors.greenColor
                    : AppColors.grey1Color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: TextButton(
                  onPressed: isItemsListNotEmpty
                      ? () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return const PaymentsReceipt();
                        }));
                  }
                      : null,
                  child: const Text(
                    AppText.save,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
