import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:crypto_wallet/views/tos.dart';
import 'package:crypto_wallet/views/privacyp.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  String selectedCurrency = 'USD';
  bool notifications = true;
  bool biometricAuth = false;
  bool priceAlerts = true;
  bool newsNotifications = true;
  String defaultChartPeriod = '7D';
  bool showPortfolioBalance = true;
  double minPriceChangeAlert = 5.0; // 5% change
  bool gameNotifications = true;

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
              _buildHeader(myHeight, myWidth),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(myWidth * 0.05),
                  children: [
                    _buildPreferencesSection(myHeight),
                    SizedBox(height: myHeight * 0.02),
                    _buildNotificationsSection(myHeight),
                    SizedBox(height: myHeight * 0.02),
                    _buildDisplaySection(myHeight),
                    SizedBox(height: myHeight * 0.02),
                    _buildGameSection(myHeight),
                    SizedBox(height: myHeight * 0.02),
                    _buildLegalSection(myHeight),
                    SizedBox(height: myHeight * 0.02),
                    _buildAboutSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(double myHeight, double myWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: myWidth * 0.05,
        vertical: myHeight * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
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
              'SETTINGS',
              style: GoogleFonts.pressStart2p(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreferencesSection(double myHeight) {
    return _buildSection(
      'App Preferences',
      Column(
        children: [
          _buildSwitchTile(
            'Dark Mode',
            'Switch between light and dark theme',
            isDarkMode,
            (value) => setState(() => isDarkMode = value),
          ),
          _buildDropdownTile(
            'Currency',
            'Select your preferred currency',
            ['USD', 'EUR', 'GBP', 'JPY'],
            selectedCurrency,
            (value) => setState(() => selectedCurrency = value!),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsSection(double myHeight) {
    return _buildSection(
      'Notifications',
      Column(
        children: [
          _buildSwitchTile(
            'Price Alerts',
            'Get notified of significant price changes',
            priceAlerts,
            (value) => setState(() => priceAlerts = value),
          ),
          _buildSwitchTile(
            'News Updates',
            'Receive crypto news notifications',
            newsNotifications,
            (value) => setState(() => newsNotifications = value),
          ),
          _buildSwitchTile(
            'Game Alerts',
            'Get notified about game results and rewards',
            gameNotifications,
            (value) => setState(() => gameNotifications = value),
          ),
        ],
      ),
    );
  }

  Widget _buildDisplaySection(double myHeight) {
    return _buildSection(
      'Display Settings',
      Column(
        children: [
          _buildDropdownTile(
            'Default Chart Period',
            'Select default timeframe for charts',
            ['24H', '7D', '30D', '1Y'],
            defaultChartPeriod,
            (value) => setState(() => defaultChartPeriod = value!),
          ),
          _buildSwitchTile(
            'Show Balance',
            'Display portfolio balance in header',
            showPortfolioBalance,
            (value) => setState(() => showPortfolioBalance = value),
          ),
        ],
      ),
    );
  }

  Widget _buildGameSection(double myHeight) {
    return _buildSection(
      'Game Settings',
      Column(
        children: [
          ListTile(
            title: Text(
              'Reset Game Progress',
              style: GoogleFonts.pressStart2p(fontSize: 10),
            ),
            subtitle: Text(
              'Clear all game data and start fresh',
              style: GoogleFonts.pressStart2p(fontSize: 8),
            ),
            trailing: Icon(
              Icons.refresh,
              size: 20,
              color: Colors.yellowAccent,
              shadows: [
                Shadow(
                  blurRadius: 2,
                  offset: Offset(1, 1),
                ),
              ],
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    'Reset Game?',
                    style: GoogleFonts.pressStart2p(fontSize: 12),
                  ),
                  content: Text(
                    'This will reset all game progress and balances.',
                    style: GoogleFonts.pressStart2p(fontSize: 8),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.pressStart2p(fontSize: 8),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Reset',
                        style: GoogleFonts.pressStart2p(
                          fontSize: 8,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          _buildSliderTile(
            'Minimum Alert %',
            'Minimum price change for notifications',
            minPriceChangeAlert,
            (value) => setState(() => minPriceChangeAlert = value),
          ),
        ],
      ),
    );
  }

  Widget _buildLegalSection(double myHeight) {
    return _buildSection(
      'Legal',
      Column(
        children: [
          _buildNavigationTile(
            'Terms of Service',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TOS()),
            ),
          ),
          _buildNavigationTile(
            'Privacy Policy',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PrivacyPolicy()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return _buildSection(
      'About',
      Column(
        children: [
          ListTile(
            title: Text(
              'Version',
              style: GoogleFonts.pressStart2p(fontSize: 10),
            ),
            subtitle: Text(
              'v1.0.0',
              style: GoogleFonts.pressStart2p(fontSize: 8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black.withOpacity(0.5),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: GoogleFonts.pressStart2p(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content,
        ],
      ),
    );
  }

  Widget _buildSwitchTile(
    String title,
    String subtitle,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.pressStart2p(fontSize: 10),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.pressStart2p(fontSize: 8),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.cyanAccent,
      ),
    );
  }

  Widget _buildDropdownTile(
    String title,
    String subtitle,
    List<String> items,
    String value,
    ValueChanged<String?> onChanged,
  ) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.pressStart2p(fontSize: 10),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.pressStart2p(fontSize: 8),
      ),
      trailing: DropdownButton<String>(
        value: value,
        items: items
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: GoogleFonts.pressStart2p(fontSize: 10),
                  ),
                ))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildNavigationTile(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.pressStart2p(fontSize: 10),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  Widget _buildSliderTile(
    String title,
    String subtitle,
    double value,
    ValueChanged<double> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            title,
            style: GoogleFonts.pressStart2p(fontSize: 10),
          ),
          subtitle: Text(
            subtitle,
            style: GoogleFonts.pressStart2p(fontSize: 8),
          ),
        ),
        Slider(
          value: value,
          min: 1.0,
          max: 20.0,
          divisions: 19,
          label: '${value.toStringAsFixed(1)}%',
          onChanged: onChanged,
          activeColor: Colors.cyanAccent,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Text(
            '${value.toStringAsFixed(1)}%',
            style: GoogleFonts.pressStart2p(fontSize: 8),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
