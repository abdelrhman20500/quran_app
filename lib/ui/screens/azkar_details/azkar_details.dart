import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quran_app/models/azkar_details_model.dart';

class AzkarDetails extends StatefulWidget {
  const AzkarDetails({super.key, required this.id, required this.title});

  final int id;
  final String title;

  @override
  State<AzkarDetails> createState() => _AzkarDetailsState();
}

class _AzkarDetailsState extends State<AzkarDetails> {
   List<AzkarDetailsModel> azkarDetails=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAzkarDetail();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()
            {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white,)),
        title: Text(widget.title, style: const TextStyle(
            fontSize:24, fontWeight: FontWeight.bold, color: Colors.white),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: azkarDetails.length,
          separatorBuilder: (context, index)=>const Divider(color: Colors.black,thickness: 2,),
            itemBuilder: (context,index)
          {
            return BuildAzkarDetails(model: azkarDetails[index],);
          },

            ),
      )
    );
  }
  loadAzkarDetail() async {
    azkarDetails = [];
    DefaultAssetBundle.of(context)
        .loadString("assets/files/section_details_db.json")
        .then((data) {
      var response = jsonDecode(data);
      response.forEach((section) {
        AzkarDetailsModel azkarDetailsModel = AzkarDetailsModel.fromJson(section);

        if(azkarDetailsModel.sectionId == widget.id) {
          azkarDetails.add(azkarDetailsModel);
        }

      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}

class BuildAzkarDetails extends StatelessWidget {
  const BuildAzkarDetails({super.key, required this.model,});

  final AzkarDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListTile(
        title: Text(model.reference!, textDirection: TextDirection.rtl,style: const TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold,
        ),),
        subtitle: Text(model.content!, textDirection: TextDirection.rtl,style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.w600,
        )),
      ),
    );
  }
}
