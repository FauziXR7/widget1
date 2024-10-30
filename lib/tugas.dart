import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '';

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
                '+1.25%', Colors.green, 'asset/BBCA.png'),
            _buildStockRow('BBRI', 'PT Bank Rakyat Indonesia. (Persero) Tbk',
                '5200', '-0.50%', Colors.red, 'asset/bbri.png'),
            _buildStockRow('PGEO', 'Pertamina Geothermal Energy.', '1145',
                '+0.75%', Colors.green, 'asset/pgeo.png'),
            _buildStockRow('TLKM', 'PT. Telkom Indonesia (Persero) Tbk ',
                '3040', '-1.15%', Colors.red, 'asset/tlkm.png'),
            _buildStockRow('PTBA', 'PT Bukit Asam Tbk', '2670', '+0.95%',
                Colors.green, 'asset/ptba.png'),
          ],
        ),
      )
    ]);
  }

  Widget _buildStockRow(String ticker, String nama, String harga,
      String pergerakan, Color color, String logoUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius:
                BorderRadius.circular(10.0), // Set rounded corners here
            child: Image.network(
              logoUrl,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
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
      appBar: AppBar(
        title: const Text('Portfolio'),
      ),
      body: Center(
        child: Text(
          'Halaman Portofolio',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  Widget _buildTransactions() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: Center(
        child: Text(
          'Halaman Transaksi',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
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
