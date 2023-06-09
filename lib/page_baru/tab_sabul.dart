import 'package:flutter/material.dart';
import 'package:miniawradreborn2/page_baru/an_namatab.dart';
import 'package:miniawradreborn2/page_baru/an_surat.dart';
import 'package:miniawradreborn2/page_baru/an_yasintah.dart';
import 'package:miniawradreborn2/set.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class Sabul extends StatefulWidget {
  const Sabul({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<Sabul>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  double _fontSize = 20.0;
  double _currentFontSize = 16;

  @override
  void initState() {
    tabController = TabController(length: 7, vsync: this);
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
          'Sab`ul Munjiyat',
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
          // transform: Matrix4.translationValues(0, -50, 1),
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                // height: 50,
                width: 80.w,
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
                        tabs: const [
                          nama_tab(namatab: 'As-Sajdah'),
                          nama_tab(namatab: 'Yasin'),
                          nama_tab(namatab: 'Fussilat'),
                          nama_tab(namatab: 'Ad-Dukhan'),
                          nama_tab(namatab: 'Al-Waqi`ah'),
                          nama_tab(namatab: 'Al-Hasyr'),
                          nama_tab(namatab: 'Al-Mulk')
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
                    Surat(data: "sajdah.json", fontSize: _currentFontSize),
                    Surat(data: "yasin.json", fontSize: _currentFontSize),
                    Surat(data: "fussilat.json", fontSize: _currentFontSize),
                    Surat(data: "dukhon.json", fontSize: _currentFontSize),
                    Surat(data: "waqiah.json", fontSize: _currentFontSize),
                    Surat(data: "hasyr.json", fontSize: _currentFontSize),
                    Surat(data: "mulk.json", fontSize: _currentFontSize)
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
