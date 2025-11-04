import 'package:flutter/material.dart';
import 'logic.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String playerChoice = '❓';
  String computerChoice = '❓';
  int playerScore = 0;
  int computerScore = 0;
  String message = '';

  void _playGame(String choice) {
    String computer = RpsLogic.getRandomChoice();
    String result = RpsLogic.getResult(choice, computer);

    setState(() {
      playerChoice = choice;
      computerChoice = computer;
      message = result;

      if (result.contains('Win')) {
        playerScore++;
      } else if (result.contains('Lose')) {
        computerScore++;
      }
    });
  }

  void _resetGame() {
    setState(() {
      playerChoice = '❓';
      computerChoice = '❓';
      playerScore = 0;
      computerScore = 0;
      message = '';
    });
  }

  Widget _buildChoiceButton(String emoji) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(24),
        backgroundColor: Color.fromARGB(255, 76, 157, 233),
      ),
      onPressed: () => _playGame(emoji),
      child: Text(emoji, style: const TextStyle(fontSize: 40)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Let's Play Rock-Paper-Scissors",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 30),

            // Player & Computer choices
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text('You:',
                        style: TextStyle(color: Colors.black, fontSize: 22)),
                    Text(playerChoice, style: const TextStyle(fontSize: 40)),
                  ],
                ),
                Column(
                  children: [
                    const Text('Computer:',
                        style: TextStyle(color: Colors.black, fontSize: 22)),
                    Text(computerChoice, style: const TextStyle(fontSize: 40)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildChoiceButton('✊'),
                _buildChoiceButton('✌️'),
                _buildChoiceButton('🖐️'),
              ],
            ),
            const SizedBox(height: 25),

            Text(
              message,
              style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),

            Text(
              'Your Score: $playerScore   Computer Score: $computerScore',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 30),

            IconButton(
              icon: const Icon(Icons.refresh, color: Colors.black, size: 40),
              onPressed: _resetGame,
            ),
          ],
        ),
      ),
    );
  }
}
