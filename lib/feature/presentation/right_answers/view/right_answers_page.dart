// Flutter imports:
import 'package:flutter/material.dart';

class RightAnswersPage extends StatelessWidget {
  final int countRightAnswers;
  final int allCountAnswers;
  const RightAnswersPage(
      {Key? key,
      required this.countRightAnswers,
      required this.allCountAnswers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          'Quize',
          style: TextStyle(
            fontFamily: 'GeneralSans',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'You have $countRightAnswers/$allCountAnswers questions.',
                style: const TextStyle(
                  fontFamily: 'GeneralSans',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  minimumSize: MaterialStateProperty.all(const Size(200, 60)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Save results',
                  style: TextStyle(
                    fontFamily: 'GeneralSans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
