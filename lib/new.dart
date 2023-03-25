import 'package:flutter/material.dart';
import 'package:miniawradreborn2/set.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _fontSize = 16;

  @override
  void initState() {
    super.initState();
    _loadFontSize();
  }

  Future<void> _loadFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _fontSize = prefs.getDouble('font_size') ?? 16;
    });
  }

  Future<void> _saveFontSize(double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('font_size', value);
  }

  void _onFontSizeChanged(double value) {
    setState(() {
      _fontSize = value;
    });
    _saveFontSize(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Text(
          "Hello, World!",
          style: TextStyle(fontSize: _fontSize),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final fontSize = await Navigator.push<double>(
            context,
            MaterialPageRoute(
              builder: (context) => FontSettingPage(
                initialFontSize: _fontSize,
                onFontSizeChanged: _onFontSizeChanged,
              ),
            ),
          );
          if (fontSize != null) {
            setState(() {
              _fontSize = fontSize;
            });
            _saveFontSize(fontSize);
          }
        },
        child: const Icon(Icons.settings),
      ),
    );
  }
}
