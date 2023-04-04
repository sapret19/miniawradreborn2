import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontSettingPage extends StatefulWidget {
  final Function(double fontSize) onFontSizeChanged;

  const FontSettingPage(
      {Key? key,
      required this.onFontSizeChanged,
      required double initialFontSize})
      : super(key: key);

  @override
  _FontSettingPageState createState() => _FontSettingPageState();
}

class _FontSettingPageState extends State<FontSettingPage> {
  double _fontSize = 16.0;
  late SharedPreferences _prefs;
  final String _key = "font_size";

  @override
  void initState() {
    super.initState();
    loadFontSize();
  }

  void loadFontSize() async {
    _prefs = await SharedPreferences.getInstance();
    final double? fontSize = _prefs.getDouble(_key);
    if (fontSize != null) {
      setState(() {
        _fontSize = fontSize;
      });
    }
  }

  void _setFontSize(double value) async {
    setState(() {
      _fontSize = value;
    });
    widget.onFontSizeChanged(_fontSize);
    await _prefs.setDouble(_key, _fontSize);
  }

  void _resetData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('font_size');
    setState(() {
      _fontSize = 16.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pengaturan Font"),
        backgroundColor: Color.fromARGB(255, 39, 110, 176),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            Slider(
              value: _fontSize,
              min: 10.0,
              max: 40.0,
              onChanged: _setFontSize,
            ),
            Text("بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ",
                style: TextStyle(
                    fontSize: _fontSize,
                    fontFamily: "KFGQPC Uthmanic Script HAFS",
                    fontWeight: FontWeight.w500,
                    height: 2)),
          ],
        ),
      ),
    );
  }
}
