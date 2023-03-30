import 'package:flutter/material.dart';

class ScreenSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan lebar dan tinggi layar
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Size'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Lebar Layar: $screenWidth',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Tinggi Layar: $screenHeight',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
