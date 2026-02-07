import 'package:flutter/material.dart';
// นำเข้า material.dart เพื่อใช้ Widget พื้นฐานของ Flutter
// เช่น Scaffold, AppBar, TextField, Card, ElevatedButton

// ===================================================
// หน้าคำนวณเส้นรอบรูปสี่เหลี่ยมคางหมู
// ใช้ StatefulWidget เพราะมีการรับค่า + คำนวณ + เปลี่ยนผลลัพธ์
// ===================================================
class TrapezoidPerimeterPage extends StatefulWidget {
  const TrapezoidPerimeterPage({super.key});
  // constructor ของหน้า ใช้สร้าง Widget นี้

  @override
  State<TrapezoidPerimeterPage> createState() =>
      _TrapezoidPerimeterPageState();
  // เชื่อม StatefulWidget กับคลาส State
}

// ===================================================
// คลาส State
// ทำหน้าที่เก็บข้อมูล คำนวณ และควบคุมการแสดงผล
// ===================================================
class _TrapezoidPerimeterPageState
    extends State<TrapezoidPerimeterPage> {

  // ---------------------------
  // ตัวแปรเก็บค่าความยาวด้านของสี่เหลี่ยมคางหมู
  // ใส่ _ เพื่อให้เป็น private ใช้เฉพาะในคลาสนี้
  // ---------------------------
  int _topBase = 0;      // ฐานบน
  int _bottomBase = 0;   // ฐานล่าง
  int _leftSide = 0;     // ด้านซ้าย
  int _rightSide = 0;    // ด้านขวา

  int _perimeter = 0;    // ตัวแปรเก็บค่าเส้นรอบรูปที่คำนวณได้

  // ---------------------------
  // TextEditingController
  // ใช้ดึงค่าที่ผู้ใช้กรอกจาก TextField
  // ---------------------------
  final TextEditingController _topCtrl = TextEditingController();
  final TextEditingController _bottomCtrl = TextEditingController();
  final TextEditingController _leftCtrl = TextEditingController();
  final TextEditingController _rightCtrl = TextEditingController();

  // ---------------------------
  // รูปแบบ TextField (แม่แบบ)
  // ใช้ซ้ำหลายช่อง เพื่อให้โค้ดไม่ซ้ำและดูเป็นระเบียบ
  // ---------------------------
  final InputDecoration _textFieldStyle = InputDecoration(
    filled: true,                // ทำให้ช่องกรอกมีพื้นหลัง
    fillColor: Colors.white,     // สีพื้นหลังช่องกรอก
    border: InputBorder.none,    // ไม่แสดงเส้นขอบ
    enabledBorder: InputBorder.none, // ตอนยังไม่พิมพ์
    focusedBorder: InputBorder.none, // ตอนกำลังพิมพ์
  );

  // ===================================================
  // ฟังก์ชันคำนวณเส้นรอบรูปสี่เหลี่ยมคางหมู
  // ===================================================
  void _calculatePerimeter() {

    // ดึงค่าจาก TextField ผ่าน controller
    // แปลงจาก String เป็น int
    // ถ้าแปลงไม่ได้ (เช่น ช่องว่าง) จะใช้ค่า 0
    _topBase = int.tryParse(_topCtrl.text) ?? 0;
    _bottomBase = int.tryParse(_bottomCtrl.text) ?? 0;
    _leftSide = int.tryParse(_leftCtrl.text) ?? 0;
    _rightSide = int.tryParse(_rightCtrl.text) ?? 0;

    // setState ใช้แจ้ง Flutter ว่าข้อมูลเปลี่ยน
    // เพื่อให้หน้าจออัปเดตผลลัพธ์ใหม่
    setState(() {
      // สูตรเส้นรอบรูป = ผลรวมของด้านทั้ง 4
      _perimeter =
          _topBase + _bottomBase + _leftSide + _rightSide;
    });
  }

  @override
  Widget build(BuildContext context) {
    // build() ใช้สร้าง UI ของหน้าจอ
    // จะถูกเรียกใหม่ทุกครั้งที่ setState() ทำงาน
    return Scaffold(

      // ---------------------------
      // AppBar ส่วนหัวของหน้า
      // ---------------------------
      appBar: AppBar(
        title: const Text("เส้นรอบรูปสี่เหลี่ยมคางหมู"),
        centerTitle: true, // จัดข้อความไว้ตรงกลาง
        backgroundColor:
        Theme.of(context).colorScheme.inversePrimary,
      ),

      // ---------------------------
      // ส่วนเนื้อหาหลักของหน้า
      // ---------------------------
      body: SingleChildScrollView(
        // ป้องกันจอล้นเมื่อคีย์บอร์ดแสดง
        padding: const EdgeInsets.all(24),

        child: Card(
          elevation: 6, // ความสูงของเงา
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          child: Padding(
            // Padding คือการเว้นระยะด้านใน
            padding: const EdgeInsets.all(24),

            child: Column(
              children: [

                // ไอคอนแสดงสัญลักษณ์รูปทรง
                const Icon(
                  Icons.change_history,
                  size: 60,
                  color: Colors.deepPurple,
                ),

                const SizedBox(height: 20),

                // แสดงผลลัพธ์เส้นรอบรูป
                Text(
                  "เส้นรอบรูป = $_perimeter หน่วย",
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                // ---------------------------
                // ช่องกรอกฐานบน
                // ---------------------------
                TextField(
                  controller: _topCtrl,               // รับค่าฐานบน
                  keyboardType: TextInputType.number, // รับเฉพาะตัวเลข
                  decoration: _textFieldStyle.copyWith(
                    labelText: "ฐานบน",
                  ),
                ),

                const SizedBox(height: 16),

                // ช่องกรอกฐานล่าง
                TextField(
                  controller: _bottomCtrl,
                  keyboardType: TextInputType.number,
                  decoration: _textFieldStyle.copyWith(
                    labelText: "ฐานล่าง",
                  ),
                ),

                const SizedBox(height: 16),

                // ช่องกรอกด้านซ้าย
                TextField(
                  controller: _leftCtrl,
                  keyboardType: TextInputType.number,
                  decoration: _textFieldStyle.copyWith(
                    labelText: "ด้านซ้าย",
                  ),
                ),

                const SizedBox(height: 16),

                // ช่องกรอกด้านขวา
                TextField(
                  controller: _rightCtrl,
                  keyboardType: TextInputType.number,
                  decoration: _textFieldStyle.copyWith(
                    labelText: "ด้านขวา",
                  ),
                ),

                const SizedBox(height: 30),

                // ---------------------------
                // ปุ่มคำนวณเส้นรอบรูป
                // ---------------------------
                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    onPressed: _calculatePerimeter,
                    // เมื่อกดปุ่ม จะเรียกฟังก์ชันคำนวณ
                    child: const Text(
                      "คำนวณเส้นรอบรูป",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
