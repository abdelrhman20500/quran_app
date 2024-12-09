import 'package:flutter/material.dart';

import '../../models/azkar/azkar_details_model.dart';

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
