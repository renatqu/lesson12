import 'dart:io';
import 'dart:math';

void main() {
  startGame();
}

startGame() {
  print('Добро пожаловать в игру! Выбери режим:');
  print('1 Комп загадывает число ты угадываеш');
  print('2 Ты загадываешь число комп отгадывает');
  String userUmswer = stdin.readLineSync()!;
  if (userUmswer == '1') {
    gameBot();
  } else if (userUmswer == '2') {
    binarySearch();
  } else {
    print('для выбора режима нажмите: 1 или 2');
  }
}

void gameBot() {
  print('Комп угадывает число ты отгадываешь');
  int numComp = Random().nextInt(100) + 1;
  int usernamber = 0;
  print('(подсказка) вот что загадал этот хитрец! $numComp');

  while (numComp != usernamber) {
    stdout.write('Введи число от 1 до 100: ');
    usernamber = int.parse(stdin.readLineSync()!);

    if (usernamber < 1 || usernamber > 100) {
      print('Пожалуйста, введи число коректно!.');
    } else {
      if (numComp == usernamber) {
        print('Поздравляю! Ты угадал');
      } else {
        print('Продолжай! Я в тебя верю');
      }
    }
  }
}




int binarySearch() {
  int min = 1;
  int max = 100;
  int mid = (min + max) ~/ 2;
  int counter = 0;

  String userAnswer = '';
  print('Ты загадываешь число от 1 до 100, этот хитрец угадает');
print('Если число угадано, напиши "yes". Если твое число меньше, напиши "-". Если твое число больше, напиши"+".');

  while (userAnswer != 'yes') {
    print('Твое число $mid? ');
    userAnswer = stdin.readLineSync()!;
    counter++;
    print('комп магет!!!');

    if (userAnswer == '-') {
      max = mid - 1;
      mid = (min + max) ~/ 2;
    } else if (userAnswer == '+') {
      min = mid + 1;
      mid = (min + max) ~/ 2;
    }
  }

  return counter;
}