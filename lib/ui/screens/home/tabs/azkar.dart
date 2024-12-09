import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quran_app/models/azkar.dart';
import 'package:quran_app/ui/screens/azkar_details/azkar_details.dart';

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

class BuildAzkarItem extends StatelessWidget {
  const BuildAzkarItem({super.key, required this.model,});

  final AzkarModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>AzkarDetails(id: model.id!, title: model.name!,)));
        print(model.id);
      },
      child: Container(
        height: MediaQuery.of(context).size.height*0.12,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
            color: const Color(0xff1D2038),
        ),
        child: Center(child: Text(model.name!, style: const TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),)),
      ),
    );
  }
}
