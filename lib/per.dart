import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontSizeScreen extends StatefulWidget {
  const FontSizeScreen({Key? key}) : super(key: key);

  @override
  _FontSizeScreenState createState() => _FontSizeScreenState();
}

class _FontSizeScreenState extends State<FontSizeScreen> {
  late SharedPreferences _prefs;
  double _fontSize = 20.0;

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  void _loadPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _fontSize = _prefs.getDouble('fontSize') ?? 16.0;
    });
  }

  void _savePrefs() async {
    await _prefs.setDouble('fontSize', _fontSize);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Font Size'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Slider(
            value: _fontSize,
            min: 8.0,
            max: 32.0,
            divisions: 8,
            label: _fontSize.round().toString(),
            onChanged: (value) {
              setState(() {
                _fontSize = value;
              });
            },
            onChangeEnd: (value) {
              _savePrefs();
            },
          ),
          Text(
            'Current font size: $_fontSize',
            style: TextStyle(fontSize: _fontSize),
          ),
        ],
      ),
    );
  }
}
