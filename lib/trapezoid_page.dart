import 'package:flutter/material.dart';

class TrapezoidPerimeterPage extends StatefulWidget {
  const TrapezoidPerimeterPage({super.key});

  @override
  State<TrapezoidPerimeterPage> createState() =>
      _TrapezoidPerimeterPageState();
}

class _TrapezoidPerimeterPageState
    extends State<TrapezoidPerimeterPage> {
  int _frontSide = 0;
  int _backSide = 0;
  int _sideOne = 0;
  int _sideTwo = 0;
  int _perimeter = 0;

  final TextEditingController _frontCtrl = TextEditingController();
  final TextEditingController _backCtrl = TextEditingController();
  final TextEditingController _sideOneCtrl = TextEditingController();
  final TextEditingController _sideTwoCtrl = TextEditingController();

  final InputDecoration _textFieldStyle = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide.none,
    ),
  );

  void _calPerimeter() {
    setState(() {
      _frontSide = int.tryParse(_frontCtrl.text) ?? 0;
      _backSide = int.tryParse(_backCtrl.text) ?? 0;
      _sideOne = int.tryParse(_sideOneCtrl.text) ?? 0;
      _sideTwo = int.tryParse(_sideTwoCtrl.text) ?? 0;

      _perimeter =
          _frontSide + _backSide + _sideOne + _sideTwo;
    });
  }

  @override
  void dispose() {
    _frontCtrl.dispose();
    _backCtrl.dispose();
    _sideOneCtrl.dispose();
    _sideTwoCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "เส้นรอบรูปสี่เหลี่ยมคางหมู",
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Card(
            elevation: 8,
            shadowColor: Colors.deepPurple.withOpacity(0.25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFD1C4E9),
                    ),
                    child: const Icon(
                      Icons.change_history,
                      size: 50,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 20),

                  Text(
                    "ด้านหน้า $_frontSide เมตร\n"
                        "ด้านหลัง $_backSide เมตร\n"
                        "ด้านข้าง 1 $_sideOne เมตร\n"
                        "ด้านข้าง 2 $_sideTwo เมตร",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.deepPurple,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 12),

                  Text(
                    "เส้นรอบรูป = $_perimeter เมตร",
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),

                  const SizedBox(height: 30),

                  _buildTextField(
                    controller: _frontCtrl,
                    label: "ด้านหน้า",
                    icon: Icons.horizontal_rule,
                  ),
                  const SizedBox(height: 18),

                  _buildTextField(
                    controller: _backCtrl,
                    label: "ด้านหลัง",
                    icon: Icons.horizontal_rule,
                  ),
                  const SizedBox(height: 18),

                  _buildTextField(
                    controller: _sideOneCtrl,
                    label: "ด้านข้าง 1",
                    icon: Icons.straighten,
                  ),
                  const SizedBox(height: 18),

                  _buildTextField(
                    controller: _sideTwoCtrl,
                    label: "ด้านข้าง 2",
                    icon: Icons.straighten,
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      onPressed: _calPerimeter,
                      icon: const Icon(Icons.calculate),
                      label: const Text(
                        "คำนวณ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        const Color(0xFFB39DDB),
                        foregroundColor: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: _textFieldStyle.copyWith(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.deepPurple),
      ),
    );
  }
}
