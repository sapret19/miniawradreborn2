import 'package:flutter/material.dart';
import 'package:miniawradreborn2/Burdah/dua.dart';
import 'package:miniawradreborn2/Burdah/satu.dart';
import 'package:miniawradreborn2/Burdah/tiga.dart';
import 'package:miniawradreborn2/page_baru/an_namatab.dart';
import 'package:miniawradreborn2/page_baru/an_surat.dart';
import 'package:miniawradreborn2/page_baru/an_yasintah.dart';
import 'package:miniawradreborn2/set.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Burdahan extends StatefulWidget {
  const Burdahan({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<Burdahan>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  double _fontSize = 20.0;
  double _currentFontSize = 16;

  @override
  void initState() {
    tabController = TabController(length: 10, vsync: this);
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
          'Qasidah Burdah',
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
                width: 265,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(1),
                      child: TabBar(
                        isScrollable: true,
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.white,
                        indicatorColor: Colors.white,
                        // indicatorWeight: 2,
                        indicator: BoxDecoration(
                          color: Color.fromARGB(255, 39, 110, 176),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        controller: tabController,
                        tabs: [
                          nama_tab(namatab: 'Fashl 1'),
                          nama_tab(namatab: 'Fashl 2'),
                          nama_tab(namatab: 'Fashl 3'),
                          nama_tab(namatab: 'Fashl 4'),
                          nama_tab(namatab: 'Fashl 5'),
                          nama_tab(namatab: 'Fashl 6'),
                          nama_tab(namatab: 'Fashl 7'),
                          nama_tab(namatab: 'Fashl 8'),
                          nama_tab(namatab: 'Fashl 9'),
                          nama_tab(namatab: 'Fashl 10')
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
                    Burdah1(data: "burdah1.json", fontSize: _currentFontSize),
                    Burdah1(data: "burdah2.json", fontSize: _currentFontSize),
                    Burdah1(data: "burdah3.json", fontSize: _currentFontSize),
                    Burdah1(data: "burdah4.json", fontSize: _currentFontSize),
                    Burdah1(data: "burdah5.json", fontSize: _currentFontSize),
                    Burdah1(data: "burdah6.json", fontSize: _currentFontSize),
                    Burdah1(data: "burdah7.json", fontSize: _currentFontSize),
                    Burdah1(data: "burdah8.json", fontSize: _currentFontSize),
                    Burdah1(data: "burdah9.json", fontSize: _currentFontSize),
                    Burdah1(data: "burdah10.json", fontSize: _currentFontSize),
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
