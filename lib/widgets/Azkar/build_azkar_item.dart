import 'package:flutter/material.dart';
import '../../models/azkar/azkar.dart';
import '../../ui/screens/azkar_details/azkar_details.dart';

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
