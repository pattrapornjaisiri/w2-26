import 'package:flutter/material.dart';
// นำเข้า material.dart เพื่อใช้ Widget พื้นฐานของ Flutter

// ===================================================
// หน้าคำนวณเส้นรอบรูปสี่เหลี่ยมคางหมู
// ===================================================
class TrapezoidPerimeterPage extends StatefulWidget {
  const TrapezoidPerimeterPage({super.key});
  // constructor ของหน้า

  @override
  State<TrapezoidPerimeterPage> createState() =>
      _TrapezoidPerimeterPageState();
// เชื่อม StatefulWidget กับคลาส State
}

// ===================================================
// คลาส State ใช้เก็บค่า + คำนวณ + แสดงผล
// ===================================================
class _TrapezoidPerimeterPageState
    extends State<TrapezoidPerimeterPage> {

  // ---------------------------
  // ตัวแปรเก็บค่าด้านของสี่เหลี่ยมคางหมู
  // ---------------------------
  int _topBase = 0;     // ฐานบน
  int _bottomBase = 0;  // ฐานล่าง
  int _leftSide = 0;    // ด้านซ้าย
  int _rightSide = 0;   // ด้านขวา

  int _perimeter = 0;   // ตัวแปรเก็บค่าเส้นรอบรูป

  // ---------------------------
  // Controller สำหรับดึงค่าจาก TextField
  // ---------------------------
  final TextEditingController _topCtrl = TextEditingController();
  final TextEditingController _bottomCtrl = TextEditingController();
  final TextEditingController _leftCtrl = TextEditingController();
  final TextEditingController _rightCtrl = TextEditingController();

  // ---------------------------
  // รูปแบบ TextField (ไม่มีเส้นรอบ)
  // ❌ ห้ามใส่ const เพราะต้องใช้ copyWith()
  // ---------------------------
  final InputDecoration _textFieldStyle = InputDecoration(
    filled: true, // ทำให้ช่องกรอกมีพื้นหลัง
    fillColor: Colors.white, // สีพื้นหลังช่องกรอก
    border: InputBorder.none, // เอาเส้นขอบออก
    enabledBorder: InputBorder.none, // ตอนยังไม่โฟกัส
    focusedBorder: InputBorder.none, // ตอนกำลังพิมพ์
  );

  // ===================================================
  // ฟังก์ชันคำนวณเส้นรอบรูปสี่เหลี่ยมคางหมู
  // ===================================================
  void _calculatePerimeter() {
    // ดึงค่าจาก TextField และแปลงเป็น int
    // ถ้าแปลงไม่ได้ให้เป็น 0 เพื่อป้องกัน error
    _topBase = int.tryParse(_topCtrl.text) ?? 0;
    _bottomBase = int.tryParse(_bottomCtrl.text) ?? 0;
    _leftSide = int.tryParse(_leftCtrl.text) ?? 0;
    _rightSide = int.tryParse(_rightCtrl.text) ?? 0;

    // แจ้ง Flutter ให้รีเฟรชหน้าจอ
    setState(() {
      // สูตรเส้นรอบรูปสี่เหลี่ยมคางหมู
      _perimeter =
          _topBase + _bottomBase + _leftSide + _rightSide;
    });
  }

  @override
  Widget build(BuildContext context) {
    // build ใช้สร้าง UI
    return Scaffold(

      // ---------------------------
      // AppBar ด้านบน
      // ---------------------------
      appBar: AppBar(
        title: const Text("เส้นรอบรูปสี่เหลี่ยมคางหมู"),
        centerTitle: true,
        backgroundColor:
        Theme.of(context).colorScheme.inversePrimary,
      ),

      // ---------------------------
      // ส่วนเนื้อหาหลัก
      // ---------------------------
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Card(
          elevation: 6, // เงาของ Card
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          child: Padding(
            padding: const EdgeInsets.all(24),

            child: Column(
              children: [

                // ไอคอนแทนรูปทรงเรขาคณิต
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
                  controller: _topCtrl,
                  keyboardType: TextInputType.number,
                  decoration: _textFieldStyle.copyWith(
                    labelText: "ฐานบน",
                  ),
                ),

                const SizedBox(height: 16),

                // ---------------------------
                // ช่องกรอกฐานล่าง
                // ---------------------------
                TextField(
                  controller: _bottomCtrl,
                  keyboardType: TextInputType.number,
                  decoration: _textFieldStyle.copyWith(
                    labelText: "ฐานล่าง",
                  ),
                ),

                const SizedBox(height: 16),

                // ---------------------------
                // ช่องกรอกด้านซ้าย
                // ---------------------------
                TextField(
                  controller: _leftCtrl,
                  keyboardType: TextInputType.number,
                  decoration: _textFieldStyle.copyWith(
                    labelText: "ด้านซ้าย",
                  ),
                ),

                const SizedBox(height: 16),

                // ---------------------------
                // ช่องกรอกด้านขวา
                // ---------------------------
                TextField(
                  controller: _rightCtrl,
                  keyboardType: TextInputType.number,
                  decoration: _textFieldStyle.copyWith(
                    labelText: "ด้านขวา",
                  ),
                ),

                const SizedBox(height: 30),

                // ---------------------------
                // ปุ่มคำนวณ
                // ---------------------------
                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    onPressed: _calculatePerimeter,
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
