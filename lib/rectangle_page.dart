import 'package:flutter/material.dart'; 
// เรียกใช้ Material Design ซึ่งเป็นชุด UI พื้นฐานของ Flutter
// เช่น Scaffold, AppBar, TextField, Button เป็นต้น

// =======================
// หน้า RectanglePage
// =======================
class RectanglePage extends StatefulWidget {
  const RectanglePage({super.key});
  // ใช้ StatefulWidget เพราะหน้านี้มีการเปลี่ยนแปลงข้อมูล
  // เช่น รับค่าจากผู้ใช้ และคำนวณผลลัพธ์ใหม่

  @override
  State<RectanglePage> createState() => RectanglePageState();
  // เชื่อม Widget กับ State เพื่อเก็บข้อมูลและตรรกะการทำงาน
}

// =======================
// คลาส State (ควบคุมข้อมูลและการทำงาน)
// =======================
class RectanglePageState extends State<RectanglePage> {

  // ตัวแปรเก็บค่า (State)
  int _width = 0;   // ความกว้าง (ใส่ _ เพื่อให้เป็น private)
  int _length = 0;  // ความยาว
  int _area = 0;    // พื้นที่สี่เหลี่ยม

  // TextEditingController ใช้ควบคุมและดึงค่าจาก TextField
  TextEditingController _widthCtrl = TextEditingController();
  TextEditingController _lengthCtrl = TextEditingController();

  // =======================
  // แม่แบบตกแต่ง TextField
  // =======================
  final InputDecoration _textFiedStyle = InputDecoration(
    filled: true, // ทำให้ช่องมีสีพื้น
    fillColor: Colors.white, // สีพื้นหลังของช่องกรอกข้อมูล
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14), // ทำมุมโค้ง
    ),
  );

  // =======================
  // ฟังก์ชันคำนวณพื้นที่
  // =======================
  void _calRectangle() {
    // ดึงค่าจาก TextField แล้วแปลงเป็น int
    // ถ้าแปลงไม่ได้จะใช้ค่า 0 เพื่อป้องกัน error
    _width = int.tryParse(_widthCtrl.text) ?? 0;
    _length = int.tryParse(_lengthCtrl.text) ?? 0;

    // setState ใช้แจ้ง Flutter ว่ามีการเปลี่ยนค่า
    // เพื่อให้ UI อัปเดตผลลัพธ์ใหม่
    setState(() {
      _area = _width * _length; // สูตรคำนวณพื้นที่สี่เหลี่ยม
    });
  }

  // =======================
  // ส่วนแสดงผลหน้าจอ
  // =======================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar ด้านบนของหน้าจอ
      appBar: AppBar(
        title: Text("คำนวณพื้นที่สี่เหลี่ยม"), // ชื่อหน้า
        centerTitle: true, // จัดให้อยู่ตรงกลาง
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      // เนื้อหาหลักของหน้า
      body: Container(
        width: double.infinity, // ให้กว้างเต็มจอ
        decoration: BoxDecoration(
          // พื้นหลังแบบไล่สีจากบนลงล่าง
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.surface,
              Colors.indigo.shade50,
            ],
          ),
        ),

        // ป้องกันจอล้นเมื่อคีย์บอร์ดเด้งขึ้น
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [

              // Card ใช้รวมเนื้อหาให้ดูเป็นกล่อง
              Card(
                elevation: 6, // ความสูงของเงา
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [

                      // ไอคอนสี่เหลี่ยม
                      Icon(
                        Icons.crop_square_rounded,
                        size: 60,
                        color: Colors.indigo,
                      ),

                      SizedBox(height: 20),

                      // แสดงค่าความกว้างและความยาว
                      Text(
                        "กว้าง $_width เมตร ยาว $_length เมตร",
                        style: TextStyle(fontSize: 18),
                      ),

                      SizedBox(height: 8),

                      // แสดงผลลัพธ์พื้นที่
                      Text(
                        "พื้นที่คือ $_area ตารางเมตร",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 30),

                      // ช่องกรอกความกว้าง
                      TextField(
                        controller: _widthCtrl, // ผูกกับ controller
                        keyboardType: TextInputType.number, // รับเฉพาะตัวเลข
                        decoration: _textFiedStyle.copyWith(
                          label: Text("ความกว้าง"),
                          hint: Text("กรอกความกว้าง"),
                          prefixIcon: Icon(Icons.width_full),
                        ),
                      ),

                      SizedBox(height: 20),

                      // ช่องกรอกความยาว
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

                      // ปุ่มคำนวณ
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton.icon(
                          onPressed: () => _calRectangle(),
                          // เมื่อกดปุ่ม จะเรียกฟังก์ชันคำนวณ
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
    );
  }
}
