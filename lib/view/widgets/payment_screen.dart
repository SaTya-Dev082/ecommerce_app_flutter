import 'package:e_commerce_app/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 170,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Address",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: kSizeMedium,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          print("Edit");
                        },
                        child: Text(
                          "Edit",
                          style: TextStyle(
                            fontSize: kSizeSmall,
                            color: kColorPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: () {
                        print("Edit");
                      },
                      child: Card(
                        child: Row(
                          spacing: 10,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                "https://i.pinimg.com/736x/f1/fa/c4/f1fac401994a7b36588a8431b80b0ad2.jpg",
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "House",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: kSizeSmall,
                                    ),
                                  ),
                                  Text(
                                    "1234 Street Name,City, Country,1234 Street Name",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Column(
                spacing: 7,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Products(3)",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: kSizeMedium,
                    ),
                  ),
                  data(),
                  data(),
                  // data(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Payment Method",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const ListTile(
              leading: Icon(Icons.credit_card),
              title: Text("Master Card"),
              subtitle: Text("**** **** **** 1234"),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 58,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            kColorPrimary,
                          ),
                          foregroundColor: WidgetStatePropertyAll(
                            kColorTextLight,
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Checkout Now",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String limitedText(String title, [int i = 20]) {
    return title.length <= i ? title : '${title.substring(0, i)}...';
  }

  Widget data() {
    return Stack(
      children: [
        Row(
          spacing: 7,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                "https://i.pinimg.com/736x/f1/fa/c4/f1fac401994a7b36588a8431b80b0ad2.jpg",
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  limitedText("Title"),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(limitedText("Title"), style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
        Positioned(
          bottom: 5,
          right: 2,
          child: Text(
            '\$200',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
