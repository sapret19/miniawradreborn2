import 'package:flutter/material.dart';
import 'package:miniawradreborn2/page_baru/an_namatab.dart';
import 'package:miniawradreborn2/page_baru/an_yasintah.dart';
import 'package:miniawradreborn2/set.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Istighosah extends StatefulWidget {
  const Istighosah({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<Istighosah>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  double _fontSize = 20.0;
  double _currentFontSize = 16;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    _loadFontSize();
  }

  Future<void> _loadFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _fontSize = prefs.getDouble('font_size') ?? 16;
      _currentFontSize = _fontSize;
    });
  }

  Future<void> _saveFontSize(double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('font_size', value);
  }

  void _onFontSizeChanged(double value) {
    setState(() {
      _currentFontSize = value;
      _fontSize = value;
    });
    _saveFontSize(value);
  }

  // @override
  // void initState() {
  //   tabController = TabController(length: 3, vsync: this);
  //   super.initState();
  // }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 39, 110, 176),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 39, 110, 176),
        centerTitle: true,
        title: const Text(
          'Istighosah',
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.text_fields),
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
          )
        ],
      ),
      body: Container(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                // height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(1),
                      child: TabBar(
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.white,
                        indicatorColor: Colors.white,
                        // indicatorWeight: 2,
                        indicator: BoxDecoration(
                          color: Color.fromARGB(255, 39, 110, 176),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        controller: tabController,
                        tabs: const [
                          nama_tab(namatab: 'Istighosah'),
                          nama_tab(namatab: 'Doa')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    yasinan(
                        data: "istighosah.json", fontSize: _currentFontSize),
                    yasinan(
                        data: "doa_istighosah.json", fontSize: _currentFontSize)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
