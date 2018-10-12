import 'package:flutter/material.dart';


import 'dart:ui';


class LanguageSelectorPage extends StatefulWidget {
  @override
  _LanguageSelectorPageState createState() => _LanguageSelectorPageState();
}

class _LanguageSelectorPageState extends State<LanguageSelectorPage> {
  final List<String> languagesList = ["English", "Korean"];
  final List<String> languagesTitle = ["Select language", "언어 선택"];
  String select_lang = "Select language";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(select_lang),
      ),
      body: _buildLanguagesList(),
    );
  }

  _buildLanguagesList() {
    return ListView.builder(
      itemCount: languagesList.length,
      itemBuilder: (context, index){
        return _buildLanguageItem(languagesList[index], index);
      },
    );
  }

  _buildLanguageItem(String language, int index){
    return InkWell(
      onTap: () {
        setState(() {
          select_lang = languagesTitle[index];

        });
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            language,
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
