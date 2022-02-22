import 'dart:convert';
import 'package:bitcoin_rates_api/Constants/constants.dart';
import 'package:bitcoin_rates_api/Models/bitcoin_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  ///final id
  static final id = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///Var
  Map data;

  ///API Link Object
  String apiURL = 'https://api.coindesk.com/v1/bpi/currentprice.json';

  ///FetchData Method
  Future<BitCoinModel> fetchData() async {
    BitCoinModel bitCoinModel;
    http.Response response = await http.get(Uri.parse(apiURL));
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    bitCoinModel = BitCoinModel.fromJson(jsonResponse);
    print(jsonResponse);
    print(response.body);
    return bitCoinModel;
  }

  ///Init State
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///Size
    final Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Bitcoin Updates'),
        centerTitle: true,
      ),
      body: Container(
        height: s.height,
        width: s.width,
        child: FutureBuilder<BitCoinModel>(
          future: fetchData(),
          builder:
              (BuildContext context, AsyncSnapshot<BitCoinModel> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            final val = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      _widget('Time of Release', headTextStyle),
                      Divider(),
                      _widget('${val.time.updated}', lowerTextStyle),
                      Divider(),
                      _widget('Dsisclaimer', headTextStyle),
                      Divider(),
                      _widget('${val.disclaimer}', lowerTextStyle),
                      Divider(),
                      _widget('Rates', headTextStyle),
                      Divider(),
                      _widget('EURO ', lowerTextStyle),
                      _widget('${val.bpi.eur.rate}', lowerTextStyle),
                      Divider(),
                      _widget('GBP ', lowerTextStyle),
                      _widget('${val.bpi.gbp.rate}', lowerTextStyle),
                      Divider(),
                      _widget('USD ', lowerTextStyle),
                      _widget('${val.bpi.usd.rate}', lowerTextStyle),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _widget(String text, TextStyle textStyle) {
    return Container(
      child: ListTile(
        title: Center(
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
