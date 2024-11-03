import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  final String title;

  LanguageScreen({super.key, required this.title});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int? isCheck;

  void toggleCheck(int index) {
    setState(() {
      isCheck = isCheck == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Choose Language :",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey),
                ),
              ),
            ],
          ),

          // Khmer Language
          GestureDetector(
            onTap: () => toggleCheck(0),
            child: languageChoice(
              index: 0,
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Flag_of_Cambodia.svg/800px-Flag_of_Cambodia.svg.png?20231030035509",
              language: "Cambodia",
            ),
          ),
          // English Language
          GestureDetector(
            onTap: () => toggleCheck(1),
            child: languageChoice(
              index: 1,
              imageUrl:
                  "https://img.freepik.com/free-vector/illustration-uk-flag_53876-18166.jpg",
              language: "English",
            ),
          ),
          // Chinese Language
          GestureDetector(
            onTap: () => toggleCheck(2),
            child: languageChoice(
              index: 2,
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Flag_of_China.png/1024px-Flag_of_China.png",
              language: "中國人",
            ),
          ),
        ],
      ),
    );
  }

  Widget languageChoice({
    required int index,
    required String imageUrl,
    required String language,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              offset: Offset.fromDirection(2),
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    language,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              if (isCheck == index) const Icon(Icons.check),
            ],
          ),
        ),
      ),
    );
  }
}
