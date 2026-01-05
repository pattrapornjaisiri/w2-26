import 'package:flutter/material.dart';
import 'package:w2_26/rectangle_page.dart';
import 'package:w2_26/trapezoid_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Geometry Calculator',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Prompt',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB39DDB), // ม่วงพาสเทล
          brightness: Brightness.light,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/rectangle_page': (context) => const RectanglePage(),
        '/trapezold_page': (context) => const TrapezoidPerimeterPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Geometry Tool ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFEDE7F6),
        foregroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
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
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.calculate_rounded,
                  size: 60,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "กรุณาเลือกรายการคำนวณ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 40),

              _buildMenuButton(
                context,
                title: "คำนวณพื้นที่สี่เหลี่ยม",
                icon: Icons.crop_square_rounded,
                color: const Color(0xFFFFCDD2), // ชมพูพาสเทล
                textColor: Colors.redAccent,
                route: '/rectangle_page',
              ),
              const SizedBox(height: 20),
              _buildMenuButton(
                context,
                title: "คำนวณเส้นรอบรูปขนมเปียกปูน",
                icon: Icons.linear_scale_rounded,
                color: const Color(0xFFBBDEFB), // ฟ้าพาสเทล
                textColor: Colors.blueAccent,
                route: '/trapezold_page',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(
      BuildContext context, {
        required String title,
        required IconData icon,
        required Color color,
        required Color textColor,
        required String route,
      }) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: ElevatedButton.icon(
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
