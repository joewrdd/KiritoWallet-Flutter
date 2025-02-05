import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  bool oTurn = true;
  String resultDeclaration = '';
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  bool winnerFound = false;
  double playerOBalance = 10000.0;
  double playerXBalance = 10000.0;
  double currentBet = 100.0;
  bool gameStarted = false;

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
                padding: EdgeInsets.symmetric(horizontal: myWidth * 0.07),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text(
                      'TIC TAC TOE',
                      style: GoogleFonts.pressStart2p(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 40),
                  ],
                ),
              ),
              SizedBox(height: myHeight * 0.05),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: myWidth * 0.03,
                  vertical: myHeight * 0.02,
                ),
                decoration: BoxDecoration(
                  color: Colors.cyanAccent.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Player O',
                          style: GoogleFonts.pressStart2p(fontSize: 12),
                        ),
                        Text(
                          oScore.toString(),
                          style: GoogleFonts.pressStart2p(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(width: myWidth * 0.1),
                    Column(
                      children: [
                        Text(
                          'Player X',
                          style: GoogleFonts.pressStart2p(fontSize: 12),
                        ),
                        Text(
                          xScore.toString(),
                          style: GoogleFonts.pressStart2p(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: myHeight * 0.02),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: myWidth * 0.03,
                  vertical: myHeight * 0.02,
                ),
                decoration: BoxDecoration(
                  color: Colors.cyanAccent.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Text(
                          'O Balance',
                          style: GoogleFonts.pressStart2p(fontSize: 10),
                        ),
                        Text(
                          '\$${playerOBalance.toStringAsFixed(2)}',
                          style: GoogleFonts.pressStart2p(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: myWidth * 0.1),
                    Column(
                      children: [
                        Text(
                          'X Balance',
                          style: GoogleFonts.pressStart2p(fontSize: 10),
                        ),
                        Text(
                          '\$${playerXBalance.toStringAsFixed(2)}',
                          style: GoogleFonts.pressStart2p(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: myHeight * 0.02),
              if (!gameStarted) ...[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Current Bet: \$${currentBet.toStringAsFixed(2)}',
                        style: GoogleFonts.pressStart2p(fontSize: 12),
                      ),
                      SizedBox(height: myHeight * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () => _changeBet(100),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: currentBet == 100
                                  ? Colors.cyanAccent
                                  : Colors.cyanAccent.withOpacity(0.5),
                            ),
                            child: Text(
                              '\$100',
                              style: GoogleFonts.silkscreen(
                                color: Colors.yellowAccent,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Colors.black87,
                                    offset: Offset(0, 1),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () => _changeBet(500),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: currentBet == 500
                                  ? Colors.cyanAccent
                                  : Colors.cyanAccent.withOpacity(0.5),
                            ),
                            child: Text(
                              '\$500',
                              style: GoogleFonts.silkscreen(
                                color: Colors.yellowAccent,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Colors.black87,
                                    offset: Offset(0, 1),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () => _changeBet(1000),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: currentBet == 1000
                                  ? Colors.cyanAccent
                                  : Colors.cyanAccent.withOpacity(0.5),
                            ),
                            child: Text(
                              '\$1000',
                              style: GoogleFonts.silkscreen(
                                color: Colors.yellowAccent,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Colors.black87,
                                    offset: Offset(0, 1),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: myHeight * 0.01),
                      ElevatedButton(
                        onPressed: playerOBalance >= currentBet &&
                                playerXBalance >= currentBet
                            ? _placeBet
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyanAccent,
                          padding: EdgeInsets.symmetric(
                            horizontal: myWidth * 0.1,
                            vertical: myHeight * 0.015,
                          ),
                        ),
                        child: Text(
                          'Place Bet',
                          style: GoogleFonts.pressStart2p(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: myHeight * 0.02),
              ],
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(20),
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: gameStarted ? () => _tapped(index) : null,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                Colors.black.withOpacity(gameStarted ? 1 : 0.6),
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            displayXO[index],
                            style: GoogleFonts.pressStart2p(
                              fontSize: 40,
                              color: displayXO[index] == 'O'
                                  ? Colors.green
                                  : displayXO[index] == 'X'
                                      ? Colors.red
                                      : Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Text(
                resultDeclaration,
                style: GoogleFonts.pressStart2p(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: myHeight * 0.02),
              ElevatedButton(
                onPressed: _clearBoard,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyanAccent,
                  padding: EdgeInsets.symmetric(
                    horizontal: myWidth * 0.1,
                    vertical: myHeight * 0.015,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Play Again',
                  style: GoogleFonts.pressStart2p(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: myHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (!winnerFound && displayXO[index] == '') {
        displayXO[index] = oTurn ? 'O' : 'X';
        filledBoxes++;
        oTurn = !oTurn;
        _checkWinner();
      }
    });
  }

  void _checkWinner() {
    for (int i = 0; i < 9; i += 3) {
      if (displayXO[i] != '' &&
          displayXO[i] == displayXO[i + 1] &&
          displayXO[i] == displayXO[i + 2]) {
        _setResult(displayXO[i]);
        return;
      }
    }

    for (int i = 0; i < 3; i++) {
      if (displayXO[i] != '' &&
          displayXO[i] == displayXO[i + 3] &&
          displayXO[i] == displayXO[i + 6]) {
        _setResult(displayXO[i]);
        return;
      }
    }

    if (displayXO[0] != '' &&
        displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8]) {
      _setResult(displayXO[0]);
      return;
    }
    if (displayXO[2] != '' &&
        displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6]) {
      _setResult(displayXO[2]);
      return;
    }

    if (filledBoxes == 9 && !winnerFound) {
      _setResult('');
    }
  }

  void _setResult(String winner) {
    setState(() {
      if (winner == '') {
        resultDeclaration = "Draw!";
        playerOBalance += currentBet;
        playerXBalance += currentBet;
      } else {
        winnerFound = true;
        resultDeclaration = "Player $winner Wins!";
        if (winner == 'O') {
          oScore++;
          playerOBalance += currentBet * 2;
        } else {
          xScore++;
          playerXBalance += currentBet * 2;
        }
      }
    });
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
      resultDeclaration = '';
      filledBoxes = 0;
      winnerFound = false;
      gameStarted = false;
    });
  }

  void _placeBet() {
    if (playerOBalance >= currentBet && playerXBalance >= currentBet) {
      setState(() {
        playerOBalance -= currentBet;
        playerXBalance -= currentBet;
        gameStarted = true;
      });
    }
  }

  void _changeBet(double amount) {
    setState(() {
      currentBet = amount;
    });
  }
}
