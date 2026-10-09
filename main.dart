import 'package:flutter/material.dart';

void main() => runApp(const AltamashStudioApp());

class AltamashStudioApp extends StatelessWidget {
  const AltamashStudioApp({super.key});

  @override
  Widget build(BuildContext context) {
    const navy = Color(0xFF10213A);
    const teal = Color(0xFF18B6A4);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Altamash Studio',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: teal),
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
        appBarTheme: const AppBarTheme(
          backgroundColor: navy,
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const navy = Color(0xFF10213A);
    const teal = Color(0xFF18B6A4);
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Altamash Studio', style: TextStyle(fontWeight: FontWeight.w800)),
            Text('LEARN • PRACTICE • GROW',
                style: TextStyle(fontSize: 10, letterSpacing: 1.4)),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Notifications',
            onPressed: () => _message(context, 'No new notifications yet.'),
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [navy, Color(0xFF234C70)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('YOUR NEXT CHAPTER STARTS HERE',
                    style: TextStyle(color: teal, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
                SizedBox(height: 12),
                Text('Learn smarter.\nReach higher.',
                    style: TextStyle(color: Colors.white, fontSize: 29, height: 1.12, fontWeight: FontWeight.w800)),
                SizedBox(height: 10),
                Text('Your study space for lessons, revision and practice.',
                    style: TextStyle(color: Colors.white70, height: 1.4)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text('Explore subjects',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: navy)),
          const SizedBox(height: 12),
          _SubjectCard(
            icon: Icons.bolt_rounded,
            title: 'Physics',
            subtitle: 'Concepts, formulas and numericals',
            color: const Color(0xFFFFA43A),
            onTap: () => _message(context, 'Physics lessons will be added here.'),
          ),
          _SubjectCard(
            icon: Icons.biotech_rounded,
            title: 'Biology',
            subtitle: 'Diagrams, chapters and quick revision',
            color: const Color(0xFF20B486),
            onTap: () => _message(context, 'Biology lessons will be added here.'),
          ),
          _SubjectCard(
            icon: Icons.science_rounded,
            title: 'Chemistry',
            subtitle: 'Reactions, concepts and practice',
            color: const Color(0xFF7185F5),
            onTap: () => _message(context, 'Chemistry lessons will be added here.'),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFE7EBF2)),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline_rounded, color: teal, size: 28),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Starter version\nThis demo works offline. Online lessons, login and a shared database can be connected later.',
                    style: TextStyle(height: 1.4, color: Color(0xFF526176)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (index) {
          if (index == 1) _message(context, 'Your courses will appear here.');
          if (index == 2) _message(context, 'Profile setup will be added later.');
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.menu_book_rounded), label: 'My study'),
          NavigationDestination(icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
        ],
      ),
    );
  }

  static void _message(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}

class _SubjectCard extends StatelessWidget {
  const _SubjectCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: Color(0xFFE7EBF2)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.13),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: color, size: 27),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(subtitle, style: const TextStyle(fontSize: 12)),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
        onTap: onTap,
      ),
    );
  }
}
