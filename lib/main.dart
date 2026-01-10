import 'package:flutter/material.dart';
// นำเข้าไฟล์หน้าคำนวณพื้นที่สี่เหลี่ยม
import 'package:w2_26/rectangle_page.dart';
// นำเข้าไฟล์หน้าคำนวณเส้นรอบรูปสี่เหลี่ยมคางหมู
import 'package:w2_26/trapezoid_page.dart';

void main() {
  // ฟังก์ชันหลักของแอป ใช้รันแอป Flutter
  runApp(const MyApp());
}

/// คลาส MyApp เป็น widget หลักของแอป
/// ใช้ StatelessWidget เพราะไม่มีการเปลี่ยนแปลงสถานะ
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ปิดแถบ Debug มุมขวาบน
      debugShowCheckedModeBanner: false,

      // ชื่อแอป
      title: 'Geometry Calculator',

      // ตั้งค่าธีมของแอป
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Prompt', // ฟอนต์ภาษาไทย
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB39DDB), // สีหลักม่วงพาสเทล
          brightness: Brightness.light,
        ),
      ),

      // กำหนดหน้าเริ่มต้นของแอป
      initialRoute: '/',

      // กำหนดเส้นทางไปยังหน้าต่าง ๆ
      routes: {
        // หน้าเมนูหลัก
        '/': (context) => const MyHomePage(),

        // หน้าแสดงการคำนวณพื้นที่สี่เหลี่ยม
        '/rectangle_page': (context) => const RectanglePage(),

        // หน้าแสดงการคำนวณเส้นรอบรูปสี่เหลี่ยมคางหมู
        '/trapezold_page': (context) => const TrapezoidPerimeterPage(),
      },
    );
  }
}

/// หน้าเมนูหลักของโปรแกรม
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ดึง theme ปัจจุบันมาใช้งาน
    final theme = Theme.of(context);

    return Scaffold(
      // แถบด้านบนของหน้าจอ
      appBar: AppBar(
        title: const Text(
          "Calculator", // ชื่อแอปที่แสดงบน AppBar
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true, // จัดข้อความให้อยู่กึ่งกลาง
        backgroundColor: const Color(0xFFEDE7F6), // สีพื้นหลัง AppBar
        foregroundColor: Colors.deepPurple, // สีตัวอักษรและไอคอน
        elevation: 0, // ไม่ให้มีเงา
      ),

      // ส่วนเนื้อหาหลักของหน้า
      body: Container(
        width: double.infinity, // กว้างเต็มหน้าจอ

        // พื้นหลังแบบไล่สี
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF3E5F5),
              Color(0xFFE1F5FE),
            ],
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(24), // ระยะห่างรอบขอบ
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่กึ่งกลางแนวตั้ง
            children: [
              // กล่องไอคอนวงกลม
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // รูปทรงวงกลม
                  color: Colors.white,
                  boxShadow: [
                    // เงาด้านหลัง
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.calculate_rounded, // ไอคอนเครื่องคิดเลข
                  size: 60,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 20), // เว้นระยะ

              // ข้อความแนะนำผู้ใช้
              const Text(
                "กรุณาเลือกรายการคำนวณ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 40),

              // ปุ่มไปหน้าคำนวณพื้นที่สี่เหลี่ยม
              _buildMenuButton(
                context,
                title: "คำนวณพื้นที่สี่เหลี่ยม",
                icon: Icons.crop_square_rounded,
                color: const Color(0xFFFFCDD2), // สีชมพูพาสเทล
                textColor: Colors.redAccent,
                route: '/rectangle_page',
              ),

              const SizedBox(height: 20),

              // ปุ่มไปหน้าคำนวณเส้นรอบรูปสี่เหลี่ยมคางหมู
              _buildMenuButton(
                context,
                title: "คำนวณเส้นรอบรูปสี่เหลี่ยมคางหมู",
                icon: Icons.linear_scale_rounded,
                color: const Color(0xFFBBDEFB), // สีฟ้าพาสเทล
                textColor: Colors.blueAccent,
                route: '/trapezold_page',
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ฟังก์ชันสร้างปุ่มเมนู
  /// ใช้ซ้ำได้ ลดโค้ดซ้ำซ้อน
  Widget _buildMenuButton(
      BuildContext context, {
        required String title, // ข้อความบนปุ่ม
        required IconData icon, // ไอคอน
        required Color color, // สีพื้นหลังปุ่ม
        required Color textColor, // สีตัวอักษร
        required String route, // route ที่จะนำทางไป
      }) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: ElevatedButton.icon(
        // เมื่อกดปุ่ม จะเปลี่ยนหน้าไปตาม route
        onPressed: () => Navigator.pushNamed(context, route),

        icon: Icon(icon, size: 28, color: textColor),

        label: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),

        // ตกแต่งปุ่ม
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 4,
          shadowColor: textColor.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
