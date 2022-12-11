import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'crop_name.dart';

class Crop
{
  Crop({
    required this.crop_name
  });

  String crop_name;
}

class ShowCrop extends StatelessWidget
{
  const ShowCrop({Key? key}) : super(key: key);

  static const String _title = 'AgreGood®';

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_title),
        backgroundColor: Colors.blue,
      ),
      body: const ShowCropStateful(),
    );
  }
}

class ShowCropStateful extends StatefulWidget
{
  const ShowCropStateful({Key? key}) : super(key: key);

  @override
  State<ShowCropStateful> createState() => _ShowCropStateful();
}

class _ShowCropStateful extends State<ShowCropStateful>
{
  Future<String> postParameters(String nit, String phos, String pot, String temp, String hum, String ph, String rainfall) async
  {
    String link = 'http://10.0.2.2:5003/api/get?nitrogen=' + nit.toString() +'&phosphorus=' + phos.toString() +'&potassium='+ pot.toString() + '&temperature=' + temp.toString() + '&humidity=' + hum.toString() +'&ph='+ ph.toString() +'&rainfall=' + rainfall.toString();

    final response = await http.get(
      Uri.parse(link)
    );

    if(response.statusCode == HttpStatus.ok)
    {
      final String parsed = response.body;
      return parsed;
    }

    else
    {
      throw Exception("Not working!!");
    }
  }

  TextEditingController nitrogenCont = TextEditingController();
  TextEditingController phosCont = TextEditingController();
  TextEditingController potCont = TextEditingController();
  TextEditingController tempCont = TextEditingController();
  TextEditingController humCont = TextEditingController();
  TextEditingController phCont = TextEditingController();
  TextEditingController rainCont = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              cursorColor: Colors.blue,
              controller: nitrogenCont,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  labelText: 'Nitrogen',
                  labelStyle: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              cursorColor: Colors.blue,
              controller: phosCont,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  labelText: 'Phosphorus',
                  labelStyle: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              cursorColor: Colors.blue,
              controller: potCont,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  labelText: 'Potassium',
                  labelStyle: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              cursorColor: Colors.blue,
              controller: tempCont,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  labelText: 'Temperature - Centigrade',
                  labelStyle: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              cursorColor: Colors.blue,
              controller: humCont,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  labelText: 'Humidity - %',
                  labelStyle: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              cursorColor: Colors.blue,
              controller: phCont,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  labelText: 'pH',
                  labelStyle: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              cursorColor: Colors.blue,
              controller: rainCont,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  labelText: 'Rainfall - mm',
                  labelStyle: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: ElevatedButton(
              onPressed: () async
              {
                String cr = await postParameters(nitrogenCont.text, phosCont.text, potCont.text, tempCont.text, humCont.text, phCont.text, rainCont.text);
                Alert(
                  context: context,
                  type: AlertType.success,
                  title: "SUCCESSFUL",
                  desc: "",
                  buttons: [
                    DialogButton(
                      onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setString("Crop_Name", cr);
                        Navigator.of(context, rootNavigator: true).pop();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CropName()));
                      },
                      width: 120,
                      child: const Text(
                        "OK",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ).show();
              },
              child: const Text('SUBMIT'),
            ),
          ),
        ],
      ),
    );
  }
}