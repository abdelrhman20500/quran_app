import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quran_app/models/azkar/azkar.dart';
import '../../../../widgets/Azkar/build_azkar_item.dart';

class AzkarTab extends StatefulWidget {
   const AzkarTab({super.key});

  @override
  State<AzkarTab> createState() => _AzkarTabState();
}


class _AzkarTabState extends State<AzkarTab> {
  final List<AzkarModel> listAzkar=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAzkar();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: listAzkar.length,
        itemBuilder: (context, index)
            {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: BuildAzkarItem(model: listAzkar[index],),
              );
            }
    );
  }

  loadAzkar() async {
    DefaultAssetBundle.of(context)
        .loadString("assets/files/sections_db.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        AzkarModel azkarModel = AzkarModel.fromJson(section);
        listAzkar.add(azkarModel);
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}

