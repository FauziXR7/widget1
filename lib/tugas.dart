import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Tugas extends StatelessWidget {
  const Tugas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Trading App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const TradingHome(),
    );
  }
}

class TradingHome extends StatefulWidget {
  const TradingHome({super.key});

  @override
  _TradingHomeState createState() => _TradingHomeState();
}

class _TradingHomeState extends State<TradingHome> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildMarketOverview();
      case 1:
        return _buildPortfolio();
      case 2:
        return _buildTransactions();
      default:
        return _buildMarketOverview();
    }
  }

  Widget _buildMarketOverview() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Market Overview',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          'IDX 30',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      Expanded(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildStockRow('BBCA', 'PT Bank Central Asia Tbk.', '10.250',
                '+1.25%', Colors.green),
            _buildStockRow('BBRI', 'PT Bank Rakyat Indonesia. (Persero) Tbk',
                '5200', '-0.50%', Colors.red),
            _buildStockRow('PGEO', 'Pertamina Geothermal Energy.', '1145',
                '+0.75%', Colors.green),
            _buildStockRow(
              'TLKM',
              'PT. Telkom Indonesia (Persero) Tbk ',
              '3040',
              '-1.15%',
              Colors.red,
            ),
            _buildStockRow(
                'PTBA', 'PT Bukit Asam Tbk', '2670', '+0.95%', Colors.green),
          ],
        ),
      )
    ]);
  }

  Widget _buildStockRow(String ticker, String nama, String harga,
      String pergerakan, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ticker,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                nama,
                style: const TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                harga,
                style: TextStyle(fontSize: 16, color: color),
              ),
              Text(
                pergerakan,
                style: TextStyle(fontSize: 16, color: color),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolio() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.grey[200]),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                height: 250,
                child: Stack(
                  // alignment: Alignment.topCenter,
                  children: [
                    Center(
                      child: Image(
                        image: AssetImage("assets/money_bg.png"),
                        width: 200,
                      ),
                    ),
                    Positioned(
                      left: 15,
                      bottom: 10,
                      child: Text(
                        "Saldo Rp. 1.000.000,-",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 175,
                      right: 20,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.red,
                        backgroundImage: AssetImage("assets/person.png"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 20),
                      child: Text(
                        "Transaksi",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(color: Colors.grey),
                      )),
                    ),
                    Container(
                      height: 200,
                      child: GridView.count(
                        crossAxisCount: 5,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 0,
                        padding: EdgeInsets.all(8),
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage('assets/pulsa.png'),
                                  width: 50,
                                ),
                                Text(
                                  "Pulsa",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage('assets/pln.png'),
                                  width: 50,
                                ),
                                Text(
                                  "PLN",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage('assets/tv.png'),
                                  width: 50,
                                ),
                                Text(
                                  "Langganan TV",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage('assets/pulsa.png'),
                                  width: 50,
                                ),
                                Text(
                                  "Pulsa",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage('assets/pulsa.png'),
                                  width: 50,
                                ),
                                Text(
                                  "Pulsa",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage('assets/pulsa.png'),
                                  width: 50,
                                ),
                                Text(
                                  "Pulsa",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage('assets/pulsa.png'),
                                  width: 50,
                                ),
                                Text(
                                  "Pulsa",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 20),
                      child: Text(
                        "Transaksi",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(color: Colors.grey),
                      )),
                    ),
                    Container(
                      height: 200,
                      child: GridView.count(
                        crossAxisCount: 5,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 0,
                        padding: EdgeInsets.all(8),
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage('assets/pulsa.png'),
                                  width: 50,
                                ),
                                Text(
                                  "Pulsa",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage('assets/pln.png'),
                                  width: 50,
                                ),
                                Text(
                                  "PLN",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage('assets/tv.png'),
                                  width: 50,
                                ),
                                Text(
                                  "Langganan TV",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage('assets/pulsa.png'),
                                  width: 50,
                                ),
                                Text(
                                  "Pulsa",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage('assets/pulsa.png'),
                                  width: 50,
                                ),
                                Text(
                                  "Pulsa",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage('assets/pulsa.png'),
                                  width: 50,
                                ),
                                Text(
                                  "Pulsa",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage('assets/pulsa.png'),
                                  width: 50,
                                ),
                                Text(
                                  "Pulsa",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactions() {
    return Stack();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Trading App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.show_chart),
              title: const Text('Market Overview'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet),
              title: const Text('Portfolio'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Transactions'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(2);
              },
            ),
          ],
        ),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Transactions',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueGrey[900],
        onTap: _onItemTapped,
      ),
    );
  }
}
