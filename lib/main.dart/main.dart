import 'package:flutter/material.dart';

void main() {
  runApp(const RawteriApp());
}

class RawteriApp extends StatelessWidget {
  const RawteriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rawteri - روتري',
      theme: ThemeData(
        primaryColor: const Color(0xFFE65100),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE65100)),
        useMaterial3: true,
        fontFamily: 'Cairo',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  String _city = 'المكلا';

  final List<Map<String, dynamic>> restaurants = [
    {'name': 'مطعم حضرموت', 'type': 'مندي - مضبي', 'time': '25-35 د', 'rating': '4.8', 'img': '🍖'},
    {'name': 'بيتزا هت المكلا', 'type': 'بيتزا - برجر', 'time': '20-30 د', 'rating': '4.6', 'img': '🍕'},
    {'name': 'عصائر طيبة', 'type': 'عصائر - حلويات', 'time': '15-25 د', 'rating': '4.9', 'img': '🥤'},
    {'name': 'شاورما الشام', 'type': 'شاورما - بروست', 'time': '20-30 د', 'rating': '4.7', 'img': '🌯'},
    {'name': 'مطبخ البادية', 'type': 'أكل شعبي', 'time': '30-40 د', 'rating': '4.5', 'img': '🍲'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE65100),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('التوصيل إلى', style: TextStyle(fontSize: 12, color: Colors.white70)),
            Text(_city, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications, color: Colors.white)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart, color: Colors.white)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: const TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(hintText: 'ابحث عن مطعم أو وجبة...', border: InputBorder.none, icon: Icon(Icons.search)),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: const Color(0xFFE65100), borderRadius: BorderRadius.circular(16)),
              child: const Row(
                children: [
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('خصم 30%', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)), Text('على أول طلب لك في المكلا', style: TextStyle(color: Colors.white))])),
                  Text('🎉', style: TextStyle(fontSize: 50)),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(16), child: Text('المطاعم القريبة منك', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            ...restaurants.map((r) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
              child: ListTile(
                leading: CircleAvatar(backgroundColor: const Color(0xFFFFF3E0), child: Text(r['img'], style: const TextStyle(fontSize: 24))),
                title: Text(r['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('${r['type']} • ${r['time']}'),
                trailing: Row(mainAxisSize: MainAxisSize.min, children: [const Icon(Icons.star, color: Colors.amber, size: 18), Text(r['rating'])]),
                onTap: () {},
              ),
            )),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        selectedItemColor: const Color(0xFFE65100),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'بحث'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'طلباتي'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
        ],
      ),
    );
  }
}
