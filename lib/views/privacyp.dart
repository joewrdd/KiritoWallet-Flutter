import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
                            'PRIVACY POLICY',
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
                        'DATA COLLECTION QUEST',
                        'On your crypto journey, we collect:\n• Player Stats (email, username)\n• Game Data (preferences, scores)\n• Device Info (for optimization)',
                      ),
                      _buildSection(
                        'POWER-UPS & BUFFS',
                        'We use your data to:\n• Level up your experience\n• Send rare item notifications\n• Keep the realm secure',
                      ),
                      _buildSection(
                        'ALLIED KINGDOMS',
                        'Trusted partners help enhance your quest:\n• Google Analytics (realm statistics)\n• Firebase (save progress)\n• CoinGecko (crypto data)',
                      ),
                      _buildSection(
                        'INVENTORY SECURITY',
                        'Your data is stored in secure vaults with:\n• End-to-end encryption\n• Regular security updates\n• Protected cloud servers',
                      ),
                      _buildSection(
                        'PLAYER RIGHTS',
                        'You can:\n• View your collected data\n• Request data deletion\n• Opt out of tracking\n• Export your data',
                      ),
                      _buildSection(
                        'YOUNG PLAYERS',
                        'Players under 16 need a guardian\'s permission to join our realm.',
                      ),
                      _buildSection(
                        'PATCH NOTES',
                        'Privacy policy updates will be announced like game updates. Check back for new versions!',
                      ),
                      _buildSection(
                        'CONTACT THE WIZARD',
                        'Questions about your data?\nSend a message to:\njoewrdd@gmail.com',
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
          ' PRIVACY SCROLL ',
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
