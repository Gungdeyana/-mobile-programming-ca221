import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(
        primaryColor: const Color(0xFF075E54),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF25D366),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF075E54),
        ),
      ),
      home: const WhatsAppHome(),
    );
  }
}

class WhatsAppHome extends StatefulWidget {
  const WhatsAppHome({super.key});

  @override
  State<WhatsAppHome> createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
        elevation: 0.7,
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {
              // Ikon untuk kamera
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Ikon untuk pencarian
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert), // Ikon titik tiga
            onPressed: () {
              // Ikon untuk menu lainnya
            },
          ),
        ],
        // Tampilan TabBar
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ChatsTab(),
          StatusTab(),
          CallsTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.message, color: Colors.white),
        onPressed: () {
          // Tambahkan aksi ketika tombol ditap
        },
      ),
    );
  }
}
// Tampilan ChatsTab
class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar objek kontak yang berbeda
   final List<Map<String, dynamic>> chats = [
      {
        'name': 'Gungde',
        'lastMessage': 'Udah ngirim tugas?',
        'time': '12:00 PM',
      },
      {
        'name': 'Agus',
        'lastMessage': 'Ayo gas mabar emel?',
        'time': '11:30 AM'
      },
      {
        'name': 'Wira', 
        'lastMessage': 'Telpon aku kalau kelas udh dimulai',
        'time': '10:15 AM'
        },
      {
        'name': 'Gung Mayun',
        'lastMessage': 'Bantu instalin PS?',
        'time': '9:45 AM'
        },
      {
        'name': 'Surya',
        'lastMessage': 'Makasi ya',
        'time': 'Yesterday, 4:30 PM'
        },
      {
        'name': 'Dimas',
        'lastMessage': 'Kelompok sama siapa?',
        'time': 'Yesterday, 3:00 PM'
        },
      {
        'name': 'Afif',
        'lastMessage': 'Oke sip',
        'time': '2 days ago'
        },
      {
        'name': 'Febri',
        'lastMessage': 'Males nok',
        'time': '3 days ago'},
    ];

    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: Text(chats[index]['name']!), // Menggunakan daftar dari nama
          subtitle: Text(chats[index]['lastMessage']!), // Menggunakan pesan terakhir
          trailing: Text(chats[index]['time']!), // Menggunakan waktu pesan
        );
      },
    );
  }
}



class StatusTab extends StatelessWidget {
  const StatusTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green,
            child: Icon(Icons.add, color: Colors.white),
          ),
          title: Text('My Status'),
          subtitle: Text('Tap to add status update'),
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: Text('Dimas'),
          subtitle: Text('25 minutes ago'),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: Text('Febri'),
          subtitle: Text('54 minutes ago'),
        ),
      ],
    );
  }
}

class CallsTab extends StatelessWidget {
  const CallsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: const Text('Wira'),
          subtitle: const Row(
            children: [
              Icon(Icons.call_made, color: Colors.green, size: 16),
              SizedBox(width: 5),
              Text('Today, 12:00 PM'),
            ],
          ),
          trailing: Icon(Icons.call, color: Theme.of(context).primaryColor),
        ),
        ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: const Text('Gung Mayun'),
          subtitle: const Row(
            children: [
              Icon(Icons.call_received, color: Colors.red, size: 16),
              SizedBox(width: 5),
              Text('Yesterday, 10:00 AM'),
            ],
          ),
          trailing: Icon(Icons.videocam, color: Theme.of(context).primaryColor),
        ),
      ],
    );
  }
}
