import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

// class with _ => private
class _DiceRollerState extends State<DiceRoller> {
  late int activeDiceImage;

  @override
  void initState() {
    super.initState();
    activeDiceImage = 1;
  }

  void rollDice() {
    setState(() {
      activeDiceImage = (activeDiceImage % 6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/dice-$activeDiceImage.png',
          width: 200,
          height: 200,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            // padding: EdgeInsets.only(top: 20),
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 28, color: Colors.white),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}
