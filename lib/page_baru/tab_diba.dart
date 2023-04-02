import 'package:flutter/material.dart';
import 'package:miniawradreborn2/page_baru/an_namatab.dart';
import 'package:miniawradreborn2/page_baru/an_yasintah.dart';
import 'package:miniawradreborn2/set.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Diba extends StatefulWidget {
  const Diba({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<Diba> with SingleTickerProviderStateMixin {
  late TabController tabController;
  double _fontSize = 16;
  double _currentFontSize = 16;

  @override
  void initState() {
    tabController = TabController(length: 28, vsync: this);
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
          'Maulid Diba',
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
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20, right: 20),
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
                        isScrollable: true,
                        // indicatorWeight: 2,
                        indicator: BoxDecoration(
                          color: Color.fromARGB(255, 39, 110, 176),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        controller: tabController,
                        tabs: const [
                          nama_tab(namatab: "Ya Rabbi shalli..."),
                          nama_tab(namatab: 'Laqod jaakum...'),
                          nama_tab(namatab: 'Ya Rasulallah...'),
                          nama_tab(namatab: 'Al-hamdulillahil qawiyy...'),
                          nama_tab(namatab: "Qila huwa adam..."),
                          nama_tab(namatab: "Yub'atsu min tihamah..."),
                          nama_tab(namatab: 'Tsumma ardudduhu...'),
                          nama_tab(namatab: 'Shalatullahi ma lahat...'),
                          nama_tab(namatab: "Fasubhanaman khashshahu..."),
                          nama_tab(namatab: 'Awwalu ma nastaftihu...'),
                          nama_tab(namatab: 'Al-haditsul awwal...'),
                          nama_tab(namatab: 'Al-haditsul tsani...'),
                          nama_tab(namatab: "Fayaqulul haqqu..."),
                          nama_tab(namatab: 'Ahdliru qulubakum...'),
                          nama_tab(namatab: 'Fahtazzal arsyu...'),
                          nama_tab(namatab: 'Mahallul Qiyam...'),
                          nama_tab(namatab: "Wawulida shallallahu..."),
                          nama_tab(namatab: 'Qila man yakfulu...'),
                          nama_tab(namatab: "Tsumma a'radla..."),
                          nama_tab(namatab: "Fabainama huwa dzata..."),
                          nama_tab(namatab: 'Faqolatil malaikatu...'),
                          nama_tab(namatab: "Fabainama habibu..."),
                          nama_tab(namatab: "Falamma ra'athu..."),
                          nama_tab(namatab: 'Wa kana shallallahu...'),
                          nama_tab(namatab: "Wa qila liba'dhihim..."),
                          nama_tab(namatab: "Wa ma 'asa an yuqala..."),
                          nama_tab(namatab: "Ya badratim..."),
                          nama_tab(namatab: "Doa Maulid Diba'"),
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
                    yasinan(data: "diba1.json", fontSize: _currentFontSize),
                    yasinan(data: "diba2.json", fontSize: _currentFontSize),
                    yasinan(data: "diba3.json", fontSize: _currentFontSize),
                    yasinan(data: "diba4.json", fontSize: _currentFontSize),
                    yasinan(data: "diba5.json", fontSize: _currentFontSize),
                    yasinan(data: "diba6.json", fontSize: _currentFontSize),
                    yasinan(data: "diba7.json", fontSize: _currentFontSize),
                    yasinan(data: "diba8.json", fontSize: _currentFontSize),
                    yasinan(data: "diba9.json", fontSize: _currentFontSize),
                    yasinan(data: "diba10.json", fontSize: _currentFontSize),
                    yasinan(data: "diba11.json", fontSize: _currentFontSize),
                    yasinan(data: "diba12.json", fontSize: _currentFontSize),
                    yasinan(data: "diba13.json", fontSize: _currentFontSize),
                    yasinan(data: "diba14.json", fontSize: _currentFontSize),
                    yasinan(data: "diba15.json", fontSize: _currentFontSize),
                    yasinan(data: "diba16.json", fontSize: _currentFontSize),
                    yasinan(data: "diba17.json", fontSize: _currentFontSize),
                    yasinan(data: "diba18.json", fontSize: _currentFontSize),
                    yasinan(data: "diba19.json", fontSize: _currentFontSize),
                    yasinan(data: "diba20.json", fontSize: _currentFontSize),
                    yasinan(data: "diba21.json", fontSize: _currentFontSize),
                    yasinan(data: "diba22.json", fontSize: _currentFontSize),
                    yasinan(data: "diba23.json", fontSize: _currentFontSize),
                    yasinan(data: "diba24.json", fontSize: _currentFontSize),
                    yasinan(data: "diba25.json", fontSize: _currentFontSize),
                    yasinan(data: "diba26.json", fontSize: _currentFontSize),
                    yasinan(data: "diba27.json", fontSize: _currentFontSize),
                    yasinan(data: "diba28.json", fontSize: _currentFontSize),
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
