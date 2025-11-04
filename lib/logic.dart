import 'dart:math';

class RpsLogic {
  static const List<String> choices = ['✊', '✌️', '🖐️'];

  static String getRandomChoice() {
    final random = Random();
    return choices[random.nextInt(choices.length)];
  }

  static String getResult(String player, String computer) {
    if (player == computer) return "It is a Tie 😐";
    if ((player == '✊' && computer == '✌️') ||
        (player == '✌️' && computer == '🖐️') ||
        (player == '🖐️' && computer == '✊')) {
      return "You Win 😄";
    } else {
      return "You Lose 😢";
    }
  }
}
