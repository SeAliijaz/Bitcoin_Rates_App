import 'dart:convert';
import 'package:bitcoin_rates_api/Models/bitcoin_model.dart';
import 'package:bitcoin_rates_api/Widgets/coins_rates.dart';
import 'package:bitcoin_rates_api/Widgets/coins_symbol.dart';
import 'package:bitcoin_rates_api/Widgets/head_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

/************
 * Use this link to make API Models Quickly
 * https://app.quicktype.io/
 ************/

class HomeScreen extends StatefulWidget {
  ///final id
  static final id = '/HomeScreen';

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  ///Var
  Map data;

  ///API Link Object
  String url = 'https://api.coindesk.com/v1/bpi/currentprice.json';

  ///FetchData Method
  Future<BitCoinModel> fetchData() async {
    BitCoinModel bitCoinModel;
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    bitCoinModel = BitCoinModel.fromJson(jsonResponse);
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
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "LOADING...",
                      style: GoogleFonts.lateef(
                        textStyle: TextStyle(
                          fontSize: 35.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: LinearProgressIndicator(),
                  ),
                ],
              );
            }
            final val = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  /************
                   * HeadingcText Widget
                   ************/
                  HeadingTextWidget(txt: 'Time Of Release'),

                  /************
                   * Timer of Update Price
                   ************/
                  Container(
                    width: s.width,
                    child: Center(
                      child: Text(
                        '${val.time.updated}',
                        style: GoogleFonts.lateef(
                          textStyle: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ),

                  /************
                  * Divider
                  ************/
                  Divider(),

                  /************
                   * Heading Text Widget
                   ************/
                  HeadingTextWidget(txt: 'Disclaimer'),

                  /************
                   * Disclaimer
                   ************/
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: s.width,
                      child: Center(
                        child: Text(
                          '${val.disclaimer}',
                          style: GoogleFonts.lateef(
                            textStyle: TextStyle(
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  /************
                  * Divider
                  ************/
                  Divider(),

                  /************
                   * Heading Text Widget
                   ************/
                  HeadingTextWidget(txt: 'Coins Rates'),

                  /************
                   * Coins Rates Widget
                   ************/
                  CoinRatesWidget(
                    txtCode: '${val.bpi.eur.code}',
                    txtPrice: '${val.bpi.eur.rate}',
                    s: s,
                  ),
                  CoinRatesWidget(
                    txtCode: '${val.bpi.gbp.code}',
                    txtPrice: '${val.bpi.gbp.rate}',
                    s: s,
                  ),
                  CoinRatesWidget(
                    txtCode: '${val.bpi.usd.code}',
                    txtPrice: '${val.bpi.usd.rate}',
                    s: s,
                  ),

                  /************
                   * Divider
                   ************/
                  Divider(),

                  /************
                   * Heading Text Widget
                   ************/
                  HeadingTextWidget(txt: 'Coins Symbols'),

                  /************
                   * Coins Symbol Widget
                   ************/
                  CoinsSymbolWidget(
                    txtCode: '${val.bpi.eur.code}',
                    txtSymbol: '${val.bpi.eur.symbol}',
                  ),
                  CoinsSymbolWidget(
                    txtCode: '${val.bpi.gbp.code}',
                    txtSymbol: '${val.bpi.gbp.symbol}',
                  ),
                  CoinsSymbolWidget(
                    txtCode: '${val.bpi.usd.code}',
                    txtSymbol: '${val.bpi.usd.symbol}',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
