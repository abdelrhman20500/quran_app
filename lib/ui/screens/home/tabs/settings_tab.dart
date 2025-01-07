import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 84,
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color(0xff14213D),
                borderRadius: BorderRadius.circular(22)
            ),
            child:  const Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image(image: AssetImage("assets/images/quran_audio_logo.png"),
                    fit: BoxFit.fill,height: 50, width: 50,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("AbdElrhman", style: TextStyle(color: Colors.white),),
                      Text("abdelrhman@gmail.com", style: TextStyle(color: Colors.white, fontSize: 20),),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.04,),
          ItemRowProfile(onTap: (){},iconData:Icons.share, text: "Invite to App"),
          SizedBox(height: MediaQuery.of(context).size.height*0.04,),
          ItemRowProfile(onTap: (){},iconData: Icons.language_outlined, text:"Language"),
          SizedBox(height: MediaQuery.of(context).size.height*0.04,),
          ItemRowProfile(onTap: (){},iconData:Icons.dark_mode_outlined,text: "Dark mode"),
          SizedBox(height: MediaQuery.of(context).size.height*0.04,),
          ItemRowProfile(onTap: (){},iconData: Icons.settings, text: "Settings"),
          SizedBox(height: MediaQuery.of(context).size.height*0.04,),
          ItemRowProfile(onTap: (){},iconData: Icons.logout, text:"Logout"),

        ],
      ),
    );
  }
}

class ItemRowProfile extends StatelessWidget {
  const ItemRowProfile({super.key,required this.iconData, required this.text,required this.onTap});

  final IconData iconData;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Icon(iconData, color: const Color(0xff14213D),size: 36,),
              SizedBox(width: MediaQuery.of(context).size.width*0.07,),
              Text(text, style :const TextStyle(fontSize: 24,
                  fontWeight: FontWeight.w500,color: Colors.black),),
            ],
          ),
          const Divider(color: Color(0xff14213D),
            thickness: 2,
          )
        ],
      ),
    );
  }
}
