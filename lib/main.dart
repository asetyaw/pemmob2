import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as cs;

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Layout Task',
      theme: ThemeData.dark(),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // untuk melacak segmen aktif

  final List<String> nowPlaying = [
    'assets/images/download.jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (3).jpeg',
    'assets/images/download (4).jpeg',
  ];

  final List<String> trending = [
    'assets/images/download.jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (3).jpeg',
    'assets/images/download (4).jpeg',
  ];

  final List<String> popular = [
    'assets/images/download.jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (3).jpeg',
    'assets/images/download (4).jpeg',
  ];

  final List<String> topRated = [
    'assets/images/download.jpeg',
    'assets/images/download (1).jpeg',
    'assets/images/download (2).jpeg',
    'assets/images/download (3).jpeg',
    'assets/images/download (4).jpeg',
  ];

  Widget buildMovieSection(String title, List<String> images) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              const Text('More',
                  style: TextStyle(fontSize: 14, color: Colors.redAccent)),
            ],
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(images[index],
                      width: 120, fit: BoxFit.cover),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ini konten tiap segmen
  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      // Segmen 1: Home
      ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text('Now Playing',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          cs.CarouselSlider(
            options: cs.CarouselOptions(
              height: 250,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items: nowPlaying.map((imageUrl) {
              return Builder(
                builder: (context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(imageUrl,
                        fit: BoxFit.cover, width: double.infinity),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 8),
          buildMovieSection('Trending', trending),
          buildMovieSection('Popular', popular),
          buildMovieSection('Top Rated', topRated),
        ],
      ),

      // Segmen 2: Explore
      const Center(
        child: Text("Explore Page",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ),

      // Segmen 3: Profile
      const Center(
        child: Text("Profile Page",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      // === FOOTER ===
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.black,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
