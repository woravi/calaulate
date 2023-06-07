import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({Key? key}) : super(key: key);

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  TextEditingController quantity = TextEditingController();
  TextEditingController price = TextEditingController(); // ช่องสำหรับเก็บจำนวน
  // double price = 10; // ช่องสำหรับเก็บราคาสินค้า ใส่ค่าไปเลย
  TextEditingController result = TextEditingController();

  @override
  void initState() {
    // ฟังชั่นพิเศษที่ใช้สำหรับการตั้งค่าในตอนแรก
    super.initState();

    result.text =
        "ซื้อสินค้าจำนวน x ผล ราคา x บาท รวมลูกค้าต้องจ่ายทั้งหมด x บาท";
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
              child: Column(
            children: [
              Image.asset(
                'assets/header_home.png',
                width: 300,
              ),
              const Text(
                "RW Project",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              TextField(
                  controller: price,
                  decoration: const InputDecoration(
                      labelText: 'ราคาสินค้า', border: OutlineInputBorder())),
              const SizedBox(height: 20),
              TextField(
                  controller: quantity,
                  decoration: const InputDecoration(
                      labelText: 'จำนวน', border: OutlineInputBorder())),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  var cal = double.parse(quantity.text) *
                      double.parse(price
                          .text); // วิธีการแปลงข้อความเป็นตัวเลข: double.parse(quantity.text)
                  if (kDebugMode) {
                    print("Apple Qauntity: ${quantity.text} Total: $cal Baht");
                  }

                  setState(() {
                    result.text =
                        "ซื้อสินค้าจำนวน ${quantity.text} ชิ้น ราคาชิ้นละ ${price.text} บาท รวมลูกค้าต้องจ่ายทั้งหมด $cal บาท";
                  });
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff60e00b)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(50, 20, 50, 20)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 30))),
                child: const Text("คำนวณ"),
              ),
              Text(
                result.text,
                style: const TextStyle(fontSize: 20),
              )
            ],
          )),
        ),
      ],
    );
  }
}
