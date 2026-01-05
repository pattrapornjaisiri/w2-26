import 'package:flutter/material.dart';

class RectanglePage extends StatefulWidget {
  const RectanglePage({super.key}); // พท.สี่เหลี่ยม = กว้าง * ย

  @override
  State<RectanglePage> createState() => RectanglePageState(); // คลาสแม่
} //มีการคำนวณ มีการเปลี่ยนค่า

class RectanglePageState extends State<RectanglePage> {
  // คลาสลูก

  int _width = 0; //ใส่_เพื่อให้เป็นไพรเวท ใช้เฉพาะในคลาส
  int _length = 0;
  int _area = 0;

  TextEditingController _widthCtrl =
  TextEditingController(); //เพิื่อควบคุมเอาไว้ดึงค่าจากช่อง อินพุท
  TextEditingController _lengthCtrl = TextEditingController();

  //แม่แบบในการใข้งานซ้้ำ
  final InputDecoration _textFiedStyle = InputDecoration(
    //คลาส
    filled: true, //พารามิตเตอร์
    fillColor: Colors.white, // เปลี่ยนเป็นสีขาวให้ดูสะอาดขึ้น
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14), // มุมโค้ง
    ),
  );

  void _calRectangle() {
    //ฟังชั่นไม่คืนค่า //ฟังชั่นคำนวณ
    _width = int.tryParse(_widthCtrl.text) ?? 0; // พยายามดึงค่่า
    _length = int.tryParse(_lengthCtrl.text) ?? 0;

    setState(() {
      _area = _width * _length; // ดัึงค่ามาคำนวณ
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("คำนวณพื้นที่สี่เหลี่ยม"), // ชื่อหน้า
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          // พื้นหลังไล่สี
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.surface,
              Colors.indigo.shade50,
            ],
          ),
        ),
        child: SingleChildScrollView(
          // ป้องกันจอล้น
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Card(
                elevation: 6, // เงา
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Icon(
                        Icons.crop_square_rounded,
                        size: 60,
                        color: Colors.indigo,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "กว้าง $_width เมตร ยาว $_length เมตร",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "พื้นที่คือ $_area ตารางเมตร",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30),
                      TextField(
                        controller: _widthCtrl, // เรียกใช้งาน คอนโทรเลอร์
                        keyboardType: TextInputType.number,
                        decoration: _textFiedStyle.copyWith(
                          //เรียกใช้งานคลาส
                          label: Text("ความกว้าง"),
                          hint: Text("กรอกความกว้าง"),
                          prefixIcon: Icon(Icons.width_full),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _lengthCtrl,
                        keyboardType: TextInputType.number,
                        decoration: _textFiedStyle.copyWith(
                          label: Text("ความยาว"),
                          hint: Text("กรอกความยาว"),
                          prefixIcon: Icon(Icons.height),
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton.icon(
                          onPressed: () => _calRectangle(), // เรียกฟังก์ชันคำนวณ
                          icon: Icon(Icons.calculate),
                          label: Text(
                            "คำนวณ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ); //ให้อยู่ตรงกลาง
  }
}