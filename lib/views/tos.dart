import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TOS extends StatefulWidget {
  const TOS({super.key});

  @override
  State<TOS> createState() => _TOSState();
}

class _TOSState extends State<TOS> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: myHeight,
        width: myWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xEEFAFA33), Colors.cyanAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: myWidth * 0.05,
                  vertical: myHeight * 0.02,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.cyanAccent.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.arrow_back, size: 24),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: myWidth * 0.03,
                            vertical: myHeight * 0.005,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.cyanAccent.withOpacity(0.8),
                            border: Border.all(width: 2),
                          ),
                          child: Text(
                            'TERMS OF SERVICE',
                            style: GoogleFonts.pressStart2p(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 40),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(myWidth * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPixelArt(),
                      SizedBox(height: myHeight * 0.02),
                      _buildSection(
                        'WELCOME PLAYER!',
                        'By entering the Kirito crypto realm, you agree to follow our quest guidelines. Level requirement: 18+',
                      ),
                      _buildSection(
                        'YOUR MISSION',
                        'Track crypto coins, compete in a Dapp mini-game, and manage your digital treasure chest. No cheats or exploits allowed!',
                      ),
                      _buildSection(
                        'PLAYER ACCOUNT',
                        'Guard your login credentials like rare loot. You are responsible for all actions under your username.',
                      ),
                      _buildSection(
                        'GAME ASSETS',
                        'All pixel art, code, and content belong to the Kirito realm. Respect the creator\'s work!',
                      ),
                      _buildSection(
                        'QUEST RULES',
                        '• No illegal activities\n• No spamming\n• Be respectful to other players\n• Report bugs, don\'t exploit them',
                      ),
                      _buildSection(
                        'GAME UPDATES',
                        'Terms may be updated like a game patch. Check back for new versions!',
                      ),
                      _buildSection(
                        'CONTACT THE GAME MASTER',
                        'For support or questions:\njoewrdd@gmail.com',
                      ),
                      Center(
                        child: Image.asset(
                          'assets/images/ghostgif.gif',
                          height: myHeight * 0.15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPixelArt() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          border: Border.all(
            color: Colors.cyanAccent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          '⚔️ KIRITO CRYPTO QUEST ⚔️',
          style: GoogleFonts.pressStart2p(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        border: Border.all(
          color: Colors.black.withOpacity(0.5),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.pressStart2p(
              fontSize: 10,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: GoogleFonts.pressStart2p(
              fontSize: 8,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
