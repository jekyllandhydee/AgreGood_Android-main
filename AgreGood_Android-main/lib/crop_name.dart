import 'package:flutter/material.dart';
import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';

class CropName extends StatelessWidget
{
  const CropName({Key? key}) : super(key: key);

  static const String _title = 'AgreGood®';

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_title),
        backgroundColor: Colors.blue,
      ),
      body: const CropNameStateful(),
    );
  }
}

class CropNameStateful extends StatefulWidget
{
  const CropNameStateful({Key? key}) : super(key: key);

  @override
  State<CropNameStateful> createState() => _CropNameStateful();
}

class _CropNameStateful extends State<CropNameStateful>
{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String crop_name = "";

  Future<void> getName() async
  {
    final SharedPreferences prefs = await _prefs;
    crop_name = prefs.getString("Crop_Name") ?? "Error";
  }

  @override
  Widget build(BuildContext context)
  {
    return FutureBuilder(
      future: getName(),
      builder: (context, AsyncSnapshot<void> snapshot){
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                height: 200,
              ),
              Text(
                  "Your suggested crop is " + crop_name + ".",
                style: TextStyle(
                    fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
                textAlign: TextAlign.center,
              ),

              Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                  onPressed: ()
                  {
                    Navigator.pop(context);
                  },
                  child: const Text('RETURN'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}