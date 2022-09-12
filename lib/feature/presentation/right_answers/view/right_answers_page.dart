// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hive/hive.dart';

class RightAnswersPage extends StatefulWidget {
  final int countRightAnswers;
  final int allCountAnswers;
  const RightAnswersPage(
      {Key? key,
      required this.countRightAnswers,
      required this.allCountAnswers})
      : super(key: key);

  @override
  State<RightAnswersPage> createState() => _RightAnswersPageState();
}

class _RightAnswersPageState extends State<RightAnswersPage> {
  static Box<dynamic> savedResult = Hive.box('results');
  List<dynamic> savedResults = savedResult.get('result', defaultValue: []);
  @override
  Widget build(BuildContext context) {
    String result =
        'You have ${widget.countRightAnswers}/${widget.allCountAnswers} questions.';
    Map<String, dynamic> resultToSave = {
      "countRightAnswers": widget.countRightAnswers,
      "allCountAnswers": widget.allCountAnswers,
      "dateTime": DateTime.now().toString(),
    };

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 150, bottom: 30),
            child: Text(
              result,
              style: const TextStyle(
                fontFamily: 'GeneralSans',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'Your history:',
              style: TextStyle(
                fontFamily: 'GeneralSans',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: savedResults.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            "${savedResult.get('result')[index]['countRightAnswers'].toString()}/${savedResult.get('result')[index]['allCountAnswers']}",
                            style: const TextStyle(
                              fontFamily: 'GeneralSans',
                              fontSize: 18,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "${savedResult.get('result')[index]['dateTime']}",
                            style: const TextStyle(
                              fontFamily: 'GeneralSans',
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                minimumSize: MaterialStateProperty.all(const Size(200, 60)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  savedResults.add(resultToSave);
                  savedResult.put('result', savedResults);
                });
              },
              child: const Text(
                'Save results',
                style: TextStyle(
                  fontFamily: 'GeneralSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
