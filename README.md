# Kirito Crypto Wallet Quest 🎮

A pixel-themed cryptocurrency tracking app built with Flutter that combines crypto monitoring, news updates, and gaming elements in a unique retro-styled interface.

## ✨ Features

### 💰 Cryptocurrency Tracking

- Real-time cryptocurrency price updates
- Detailed coin information and statistics
- Interactive price charts with multiple timeframes
- Market cap and volume tracking
- Portfolio value tracking
- Top performing coins section

### 📰 Crypto News

- Latest cryptocurrency news updates
- News filtering and categorization
- Direct links to news sources
- Real-time news refresh

### 🎮 Gaming Elements

- Integrated Tic-Tac-Toe mini-game
- Virtual betting system
- Player balances and scores
- Win/loss tracking

### 🎨 Unique UI/UX

- Pixel art design theme
- Retro-styled animations
- Interactive charts and graphs
- Responsive layout
- Custom navigation

## 🛠 Technical Stack

### Frontend

- Flutter for cross-platform development
- Custom animations and transitions
- Responsive design implementation
- Chart visualization using SyncFusion
- Google Fonts integration

### Backend Services

- CoinGecko API for cryptocurrency data
- NewsData.io for crypto news
- Environment variable management
- HTTP request handling

## 🚀 Getting Started

### Prerequisites

- Flutter (latest version)
- Dart SDK
- API keys for NewsData.io
- Android Studio / VS Code
- Git

### Installation

1. Clone the repository

```bash
git clone https://github.com/joewrdd/kirito_crypto_wallet.git
```

2. Install dependencies

```bash
cd kirito_crypto_wallet
flutter pub get
```

3. Configure API Keys

- Create a .env file in the root directory
- Add your NewsData.io API key:

```
NEWS_API_KEY=your_api_key_here
```

4. Run the app

```bash
flutter run
```

## 📁 Project Structure

```
lib/
├── models/             # Data models
├── services/           # API services
├── views/             # UI screens
│   ├── widgets/      # Reusable widgets
│   └── screens/      # Main screens
└── main.dart         # Entry point
```

## 🎯 Features in Detail

### Cryptocurrency Features

- Real-time price tracking
- Historical price charts
- Market statistics
- Portfolio management
- Top performers tracking

### News Features

- Latest crypto news
- News categorization
- Source filtering
- Share functionality

### Game Features

- Tic-Tac-Toe gameplay
- Virtual betting system
- Score tracking
- Player statistics

## 🔒 Privacy & Security

- Secure API handling
- Local data storage
- No personal data collection
- Transparent data usage

## 📸 Screenshots

<div align="center">
  <!-- Main Screen -->
  <div style="display: flex; align-items: center; margin-top: 20px;">
    <div style="flex: 1; padding: 10px;">
      <img src="assets/screenshots/1.png" width="250" alt="Screenshot 1"/>
    </div>
    <div style="flex: 1; padding: 10px;">
      <img src="assets/screenshots/2.png" width="250" alt="Screenshot 2"/>
    </div>
  </div>

  <!-- Crpyto Details / Top Performers -->
  <div style="display: flex; align-items: center; margin-top: 20px;">
    <div style="flex: 1; padding: 10px;">
      <img src="assets/screenshots/3.png" width="250" alt="Screenshot 3"/>
    </div>
    <div style="flex: 1; padding: 10px;">
      <img src="assets/screenshots/4.png" width="250" alt="Screenshot 4"/>
    </div>
  </div>

  <!-- Betting System Game / Search -->
  <div style="display: flex; align-items: center; margin-top: 20px;">
    <div style="flex: 1; padding: 10px;">
      <img src="assets/screenshots/5.png" width="250" alt="Screenshot 5"/>
    </div>
    <div style="flex: 1; padding: 10px;">
      <img src="assets/screenshots/6.png" width="250" alt="Screenshot 6"/>
    </div>
  </div>

  <!-- Crpyto News / Settings -->
  <div style="display: flex; align-items: center; margin-top: 20px;">
    <div style="flex: 1; padding: 10px;">
      <img src="assets/screenshots/7.png" width="250" alt="Screenshot 7"/>
    </div>
    <div style="flex: 1; padding: 10px;">
      <img src="assets/screenshots/8.png" width="250" alt="Screenshot 8"/>
    </div>
  </div>

  <!-- TOS / Privacy Policy -->
  <div style="display: flex; align-items: center; margin-top: 20px;">
    <div style="flex: 1; padding: 10px;">
      <img src="assets/screenshots/9.png" width="250" alt="Screenshot 9"/>
    </div>
    <div style="flex: 1; padding: 10px;">
      <img src="assets/screenshots/10.png" width="250" alt="Screenshot 10"/>
    </div>
  </div>
</div>

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👨‍💻 Author

Joe Ward - [GitHub Profile](https://github.com/joewrdd)

## 🙏 Acknowledgments

- CoinGecko API for cryptocurrency data
- NewsData.io for news updates
