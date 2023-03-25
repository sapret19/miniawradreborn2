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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Font Setting"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Font Size",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8.0),
            Slider(
              value: _fontSize,
              min: 10.0,
              max: 32.0,
              divisions: 6,
              onChanged: _setFontSize,
            ),
          ],
        ),
      ),
    );
  }
}
