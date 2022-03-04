// ignore_for_file: unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vardiya Görevlendirme',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
      supportedLocales: const [Locale('tr')],
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final formKey = GlobalKey<FormState>();
  final formKeyB = GlobalKey<FormState>();

  // ignore: prefer_typing_uninitialized_variables
  var date;

  getDateText() {
    // ignore: unnecessary_null_comparison
    if (date == null) {
      return DateFormat('dd.MM.yyyy EEEE', 'tr_TR').format(DateTime.now());
    } else {
      return DateFormat('dd.MM.yyyy EEEE', 'tr_TR').format(date);
    }
  }

  //A Blok
  List<String> liste = [];
  final String _aTarihKey = '*Tarih*';
  String _aTarih = '';
  //TextEditingController _aTarihController = TextEditingController();
  String _a1KatKey = '*A Yaşlı Katı*';
  String _a1Kat = '';
  final TextEditingController _a1KatController = TextEditingController();
  String _a2KatKey = '*A 2 Kat*';
  String _a2Kat = '';
  final TextEditingController _a2KatController = TextEditingController();
  String _aKafeteryaKey = '*A Kafeterya*';
  String _aKafeterya = '';
  final TextEditingController _aKafeteryaController = TextEditingController();
  String _aSaYeTemizlikKey = '*Sabah Yemekhane Temizliği*';
  String _aSaYeTemizlik = '';
  final TextEditingController _aSaYeTemizlikController =
      TextEditingController();
  String _aOgYeTemizlikKey = '*Öğlen Yemekhane Temizliği*';
  String _aOgYeTemizlik = '';
  final TextEditingController _aOgYeTemizlikController =
      TextEditingController();
  String _aSagGruTemizlikKey =
      '*Sağlık Odası ve Grup Etkinlik Odası Temizliği*';
  String _aSagGruTemizlik = '';
  final TextEditingController _aSagGruTemizlikController =
      TextEditingController();
  String _aYeDagitimiKey = '*Yemek Dagıtımı*';
  String _aYeDagitimi = '';
  final TextEditingController _aYeDagitimiController = TextEditingController();

  String _sonuc = '';

  //B blok
  List<String> listeB = [];

  final String _bTarihKey = '*Tarih*';
  String _bTarih = '';
  String _bDanismaKey = '*Danışma*';
  String _bDanisma = '';
  final TextEditingController _bDanismaController = TextEditingController();
  String _bZeminKatKey = '*B Zemin Kat*';
  String _bZeminKat = '';
  final TextEditingController _bZeminKatController = TextEditingController();
  String _b1KatKey = '*B 1.Kat Sürekli Kat Görevlisi*';
  String _b1Kat = '';
  final TextEditingController _b1KatController = TextEditingController();
  String _b2KatKey = '*B 2.Kat*';
  String _b2Kat = '';
  final TextEditingController _b2KatController = TextEditingController();
  String _bBahceKey = '*B Bahçe Görevlisi ve Danışma Önü Temizliği*';
  String _bBahce = '';
  final TextEditingController _bBahceController = TextEditingController();
  String _bKafeteryaKey = '*B Kafeterya*';
  String _bKafeterya = '';
  final TextEditingController _bKafeteryaController = TextEditingController();
  String _bSaYeTemizlikKey = '*Sabah Yemekhane Temizliği*';
  String _bSaYeTemizlik = '';
  final TextEditingController _bSaYeTemizlikController =
      TextEditingController();
  String _bOgYeTemizlikKey = '*Öğlen Yemekhane Temizliği*';
  String _bOgYeTemizlik = '';
  final TextEditingController _bOgYeTemizlikController =
      TextEditingController();
  String _bSagGruTemizlikKey =
      '*Sağlık Odası ve Grup Etkinlik Odası Temizliği*';
  String _bSagGruTemizlik = '';
  final TextEditingController _bSagGruTemizlikController =
      TextEditingController();
  String _bYeDagitimiKey = '*Yemek Dagıtımı*';
  String _bYeDagitimi = '';
  final TextEditingController _bYeDagitimiController = TextEditingController();
  String _bMutfakGorevlisiKey = '*Yemekhane Görevlisi*';
  String _bMutfakGorevlisi = '';
  final TextEditingController _bMutfakGorevlisiController =
      TextEditingController();
  String _bCamasirGorevlisiKey = '*Çamaşırhane Görevlisi*';
  String _bCamasirGorevlisi = '';
  final TextEditingController _bCamasirGorevlisiController =
      TextEditingController();

  String _sonucB = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('tr');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vardiya Görevlendirme'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [Tab(child: Text('A Blok')), Tab(child: Text('B Blok'))],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          tab1(),
          tab2(),
        ],
      ),
    );
  }

  Widget tab1() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(children: [
                      ElevatedButton(
                        onPressed: () {
                          pickDate(context);
                          _aTarih = getDateText();
                          if (_aTarih.isNotEmpty) {
                            liste.add('*');
                            liste.add(_aTarih);
                            liste.add(' Görevlendirme*');
                            liste.add('\n');
                          }
                        },
                        child: Text(getDateText()),
                      ),
                    ]),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _a1KatController,
                      onSaved: (deger) {
                        _a1Kat = deger!;
                        if (deger.isNotEmpty) {
                          liste.add(_a1KatKey);
                          liste.add(' : ');
                          liste.add(_a1Kat);
                          liste.add('\n');
                        }
                      },
                      decoration: InputDecoration(
                        labelText: _a1KatKey,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _a1KatController.text =
                                  ' - ' + _a1KatController.text;
                            },
                            icon: const Icon(Icons.add)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _a2KatController,
                      onSaved: (deger) {
                        _a2Kat = deger!;
                        if (deger.isNotEmpty) {
                          liste.add(_a2KatKey);
                          liste.add(' : ');
                          liste.add(_a2Kat);
                          liste.add('\n');
                        }
                      },
                      decoration: InputDecoration(
                        labelText: _a2KatKey,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _a2KatController.text =
                                  ' - ' + _a2KatController.text;
                            },
                            icon: const Icon(Icons.add)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _aKafeteryaController,
                      onSaved: (deger) {
                        _aKafeterya = deger!;
                        if (deger.isNotEmpty) {
                          liste.add(_aKafeteryaKey);
                          liste.add(' : ');
                          liste.add(_aKafeterya);
                          liste.add('\n');
                        }
                      },
                      decoration: InputDecoration(
                        labelText: _aKafeteryaKey,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _aKafeteryaController.text =
                                  ' - ' + _aKafeteryaController.text;
                            },
                            icon: const Icon(Icons.add)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _aSaYeTemizlikController,
                      onSaved: (deger) {
                        _aSaYeTemizlik = deger!;
                        if (deger.isNotEmpty) {
                          liste.add(_aSaYeTemizlikKey);
                          liste.add(' : ');
                          liste.add(_aSaYeTemizlik);
                          liste.add('\n');
                        }
                      },
                      decoration: InputDecoration(
                        labelText: _aSaYeTemizlikKey,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _aSaYeTemizlikController.text =
                                  ' - ' + _aSaYeTemizlikController.text;
                            },
                            icon: const Icon(Icons.add)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _aOgYeTemizlikController,
                      onSaved: (deger) {
                        _aOgYeTemizlik = deger!;
                        if (deger.isNotEmpty) {
                          liste.add(_aOgYeTemizlikKey);
                          liste.add(' : ');
                          liste.add(_aOgYeTemizlik);
                          liste.add('\n');
                        }
                      },
                      decoration: InputDecoration(
                        labelText: _aOgYeTemizlikKey,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _aOgYeTemizlikController.text =
                                  ' - ' + _aOgYeTemizlikController.text;
                            },
                            icon: const Icon(Icons.add)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _aSagGruTemizlikController,
                      onSaved: (deger) {
                        _aSagGruTemizlik = deger!;
                        if (deger.isNotEmpty) {
                          liste.add(_aSagGruTemizlikKey);
                          liste.add(' : ');
                          liste.add(_aSagGruTemizlik);
                          liste.add('\n');
                        }
                      },
                      decoration: InputDecoration(
                        labelText: _aSagGruTemizlikKey,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _aYeDagitimiController,
                      onSaved: (deger) {
                        _aYeDagitimi = deger!;
                        if (deger.isNotEmpty) {
                          liste.add(_aYeDagitimiKey);
                          liste.add(' : ');
                          liste.add(_aYeDagitimi);
                          liste.add('\n');
                        }
                      },
                      decoration: InputDecoration(
                        labelText: _aYeDagitimiKey,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _aYeDagitimiController.text =
                                  ' - ' + _aYeDagitimiController.text;
                            },
                            icon: const Icon(Icons.add)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('Kolaylıklar Arkadaşlar.'),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () {
                          formKey.currentState!.save();
                          if (_sonuc.isEmpty) {
                            for (int i = 0; i < liste.length; i++) {
                              _sonuc = _sonuc + liste[i];
                            }
                          }
                          if (_sonuc.isNotEmpty) {
                            Share.share(_sonuc + 'Kolaylıklar Arkadaşlar.');
                          }
                        },
                        child: const Text('Paylaş')),
                  ],
                )),
          )
        ],
      ),
    );
  }

  Widget tab2() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Form(
                key: formKeyB,
                child: Column(
                  children: [
                    Row(children: [
                      ElevatedButton(
                        onPressed: () {
                          pickDate(context);
                          _bTarih = getDateText();
                          if (_aTarih.isNotEmpty) {
                            listeB.add('*');
                            listeB.add(_bTarih);
                            listeB.add(' Görevlendirme*');
                            listeB.add('\n');
                          }
                        },
                        child: Text(getDateText()),
                      ),
                    ]),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _bDanismaController,
                      onSaved: (deger) {
                        _bDanisma = deger!;
                        if (deger.isNotEmpty) {
                          listeB.add(_bDanismaKey);
                          listeB.add(' : ');
                          listeB.add(_bDanisma);
                          listeB.add('\n');
                        }
                      },
                      decoration: InputDecoration(
                        labelText: _bDanismaKey,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _bZeminKatController,
                      onSaved: (deger) {
                        _bZeminKat = deger!;
                        if (deger.isNotEmpty) {
                          listeB.add(_bZeminKatKey);
                          listeB.add(' : ');
                          listeB.add(_bZeminKat);
                          listeB.add('\n');
                        }
                      },
                      decoration: InputDecoration(
                        labelText: _bZeminKatKey,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _b1KatController,
                      onSaved: (deger) {
                        _b1Kat = deger!;
                        if (deger.isNotEmpty) {
                          listeB.add(_b1KatKey);
                          listeB.add(' : ');
                          listeB.add(_b1Kat);
                          listeB.add('\n');
                        }
                      },
                      decoration: InputDecoration(
                        labelText: _b1KatKey,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _b2KatController,
                      onSaved: (deger) {
                        _b2Kat = deger!;
                        if (deger.isNotEmpty) {
                          listeB.add(_b2KatKey);
                          listeB.add(' : ');
                          listeB.add(_b2Kat);
                          listeB.add('\n');
                        }
                      },
                      decoration: InputDecoration(
                        labelText: _b2KatKey,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _bBahceController,
                      onSaved: (deger) {
                        _bBahce = deger!;
                        if (deger.isNotEmpty) {
                          listeB.add(_bBahceKey);
                          listeB.add(' : ');
                          listeB.add(_bBahce);
                          listeB.add('\n');
                        }
                      },
                      decoration: InputDecoration(
                        labelText: _bBahceKey,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _bKafeteryaController,
                      onSaved: (deger) {
                        _bKafeterya = deger!;
                        if (deger.isNotEmpty) {
                          listeB.add(_bKafeteryaKey);
                          listeB.add(' : ');
                          listeB.add(_bKafeterya);
                          listeB.add('\n');
                        }
                      },
                      decoration: InputDecoration(
                        labelText: _bKafeteryaKey,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _bSaYeTemizlikController,
                      onSaved: (deger) {
                        _bSaYeTemizlik = deger!;
                        if (deger.isNotEmpty) {
                          listeB.add(_bSaYeTemizlikKey);
                          listeB.add(' : ');
                          listeB.add(_bSaYeTemizlik);
                          listeB.add('\n');
                        }
                      },
                      decoration: InputDecoration(
                        labelText: _bSaYeTemizlikKey,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _bOgYeTemizlikController,
                      onSaved: (deger) {
                        _bOgYeTemizlik = deger!;
                        if (deger.isNotEmpty) {
                          listeB.add(_bOgYeTemizlikKey);
                          listeB.add(' : ');
                          listeB.add(_bOgYeTemizlik);
                          listeB.add('\n');
                        }
                      },
                      decoration: InputDecoration(
                        labelText: _bOgYeTemizlikKey,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _bSagGruTemizlikController,
                      onSaved: (deger) {
                        _bSagGruTemizlik = deger!;
                        if (deger.isNotEmpty) {
                          listeB.add(_bSagGruTemizlikKey);
                          listeB.add(' : ');
                          listeB.add(_bSagGruTemizlik);
                          listeB.add('\n');
                        }
                      },
                      decoration: InputDecoration(
                        labelText: _bSagGruTemizlikKey,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _bYeDagitimiController,
                      onSaved: (deger) {
                        _bYeDagitimi = deger!;
                        if (deger.isNotEmpty) {
                          listeB.add(_bYeDagitimiKey);
                          listeB.add(' : ');
                          listeB.add(_bYeDagitimi);
                          listeB.add('\n');
                        }
                      },
                      decoration: InputDecoration(
                        labelText: _bYeDagitimiKey,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _bMutfakGorevlisiController,
                      onSaved: (deger) {
                        _bMutfakGorevlisi = deger!;
                        if (deger.isNotEmpty) {
                          listeB.add(_bMutfakGorevlisiKey);
                          listeB.add(' : ');
                          listeB.add(_bMutfakGorevlisi);
                          listeB.add('\n');
                        }
                      },
                      decoration: InputDecoration(
                        labelText: _bMutfakGorevlisiKey,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _bCamasirGorevlisiController,
                      onSaved: (deger) {
                        _bCamasirGorevlisi = deger!;
                        if (deger.isNotEmpty) {
                          listeB.add(_bCamasirGorevlisiKey);
                          listeB.add(' : ');
                          listeB.add(_bCamasirGorevlisi);
                          listeB.add('\n');
                        }
                      },
                      decoration: InputDecoration(
                        labelText: _bCamasirGorevlisiKey,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('Kolaylıklar Arkadaşlar.'),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () {
                          formKeyB.currentState!.save();
                          if (_sonucB.isEmpty) {
                            for (int i = 0; i < listeB.length; i++) {
                              _sonucB = _sonucB + listeB[i];
                            }
                          }
                          if (_sonucB.isNotEmpty) {
                            Share.share(_sonucB + 'Kolaylıklar Arkadaşlar.');
                          }
                        },
                        child: const Text('Paylaş')),
                  ],
                )),
          )
        ],
      ),
    );
  }

  pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        locale: const Locale('tr', 'TR'));

    if (newDate == null) return;
    setState(() {
      date = newDate;
    });
  }
}
