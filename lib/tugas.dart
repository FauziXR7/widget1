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
          'Home Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          'Perpus Main Page',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Portfolio Summary Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryCard('Total Value', '\25.000', Colors.blue),
                _buildSummaryCard('Invested', '\20.000', Colors.orange),
                _buildSummaryCard('Gain/Loss', '+\5.000', Colors.green),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Your Stocks',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildPortfolioStockRow('BBCA', '10.250', '100', '+5.25%'),
                  _buildPortfolioStockRow('BBRI', '5200', '50', '-1.50%'),
                  _buildPortfolioStockRow('TLKM', '3040', '150', '+2.00%'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactions() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildTransactionRow(
                      'BBCA', 'Buy', '10', '\10.000', '05 Nov 2024'),
                  _buildTransactionRow(
                      'BBRI', 'Sell', '20', '\15.000', '03 Nov 2024'),
                  _buildTransactionRow(
                      'TLKM', 'Buy', '30', '\8.000', '01 Nov 2024'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value, Color color) {
    return Expanded(
      child: Card(
        color: color.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14, color: color),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPortfolioStockRow(
      String ticker, String price, String quantity, String change) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blueGrey.shade100,
          child: Text(
            ticker[0],
            style: const TextStyle(color: Colors.blueGrey),
          ),
        ),
        title: Text(ticker),
        subtitle: Text('Price: \$${price} | Quantity: ${quantity}'),
        trailing: Text(
          change,
          style: TextStyle(
            color: change.contains('+') ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionRow(
      String ticker, String type, String quantity, String value, String date) {
    return Card(
      child: ListTile(
        leading: Icon(
          type == 'Buy' ? Icons.arrow_upward : Icons.arrow_downward,
          color: type == 'Buy' ? Colors.green : Colors.red,
        ),
        title: Text('$ticker - $type'),
        subtitle: Text('Quantity: $quantity | Value: $value'),
        trailing: Text(
          date,
          style: const TextStyle(color: Colors.grey),
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
