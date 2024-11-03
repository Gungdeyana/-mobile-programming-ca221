import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
 // Menampilkan gambar pada halaman search page
  final List<String> _imageUrls = [
    'https://i.pravatar.cc/150?img=10',
    'https://i.pravatar.cc/150?img=11',
    'https://i.pravatar.cc/150?img=12',
    'https://i.pravatar.cc/150?img=13',
    'https://i.pravatar.cc/150?img=14',
    'https://i.pravatar.cc/150?img=15',
    'https://i.pravatar.cc/150?img=16',
    'https://i.pravatar.cc/150?img=17',
    'https://i.pravatar.cc/150?img=18',
    'https://i.pravatar.cc/150?img=19',
    'https://i.pravatar.cc/150?img=20',
    'https://i.pravatar.cc/150?img=21',
    'https://i.pravatar.cc/150?img=22',
    'https://i.pravatar.cc/150?img=23',
    'https://i.pravatar.cc/150?img=24',
    'https://i.pravatar.cc/150?img=25',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     title: Text(
  '  >,< Buatlah setiap moment berarti dalam kehidupan kita >,< ',
  style: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold, 
    color: const Color.fromARGB(255, 72, 70, 70),
  ),
),
    
      ),
      body: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'Cari moment...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), 
                ),
              ),
              onChanged: (value) {
               
                setState(() {
                 
                });
              },
            ),
          ),
          Expanded(
            child: _buildImageGrid(),
          ),
        ],
      ),
    );
  }

  Widget _buildImageGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        crossAxisSpacing: 2.0, 
        mainAxisSpacing: 2.0, 
      ),
      itemCount: _imageUrls.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(1.0), 
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)), 
            borderRadius: BorderRadius.circular(8.0), 
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              _imageUrls[index],
              fit: BoxFit.cover, 
            ),
          ),
        );
      },
    );
  }
}
