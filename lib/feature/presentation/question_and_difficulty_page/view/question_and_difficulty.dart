import 'package:flutter/material.dart';

class QuestionAndDiffcultyPage extends StatefulWidget {
  const QuestionAndDiffcultyPage({Key? key}) : super(key: key);

  @override
  State<QuestionAndDiffcultyPage> createState() =>
      _QuestionAndDiffcultyPageState();
}

class _QuestionAndDiffcultyPageState extends State<QuestionAndDiffcultyPage> {
  String category = 'Category';
  String difficulty = "Difficulty";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Quize',
            style: TextStyle(
              fontFamily: 'GeneralSans',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              top: 200,
              bottom: 50,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Choose category and difficulty.',
                    style: TextStyle(
                      fontFamily: 'GeneralSans',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 95,
                            child: Text(
                              category,
                              style: const TextStyle(
                                fontFamily: "GeneralSans",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 120,
                          ),
                          PopupMenuButton(
                            icon: const Icon(
                              Icons.code_rounded,
                              color: Colors.green,
                            ),
                            onSelected: (value) {
                              setState(() {
                                category = value.toString();
                              });
                            },
                            position: PopupMenuPosition.under,
                            itemBuilder: (context) => [
                              const PopupMenuItem<String>(
                                value: "Linux",
                                child: Text(
                                  'Linux',
                                  style: TextStyle(
                                    fontFamily: 'GeneralSans',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const PopupMenuItem<String>(
                                value: "DevOps",
                                child: Text(
                                  'DevOps',
                                  style: TextStyle(
                                    fontFamily: 'GeneralSans',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const PopupMenuItem<String>(
                                value: "Networking",
                                child: Text(
                                  'Networking',
                                  style: TextStyle(
                                    fontFamily: 'GeneralSans',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const PopupMenuItem<String>(
                                value: "Cloud",
                                child: Text(
                                  'Cloud',
                                  style: TextStyle(
                                    fontFamily: 'GeneralSans',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 95,
                            child: Text(
                              difficulty,
                              style: const TextStyle(
                                fontFamily: "GeneralSans",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 120,
                          ),
                          PopupMenuButton(
                            position: PopupMenuPosition.under,
                            icon: const Icon(
                              Icons.announcement_rounded,
                              color: Colors.green,
                            ),
                            onSelected: (value) {
                              setState(() {
                                difficulty = value.toString();
                              });
                            },
                            itemBuilder: (context) => [
                              const PopupMenuItem<String>(
                                value: "Easy",
                                child: Text(
                                  'Easy',
                                  style: TextStyle(
                                    fontFamily: 'GeneralSans',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const PopupMenuItem<String>(
                                value: "Medium",
                                child: Text(
                                  'Medium',
                                  style: TextStyle(
                                    fontFamily: 'GeneralSans',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const PopupMenuItem<String>(
                                value: "Hard",
                                child: Text(
                                  'Hard',
                                  style: TextStyle(
                                    fontFamily: 'GeneralSans',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 4,
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
                    'Continue',
                    style: TextStyle(
                      fontFamily: 'GeneralSans',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
