import 'package:flutter/material.dart';
import '../../models/juz_model/num_of_juz.dart';
import 'list_surah_of_juz.dart';

class BuildListJuz extends StatelessWidget {
  const BuildListJuz({super.key});

  // Function to generate a list of NumOfJuz instances
  List<NumOfJuz> generateNumOfJuz() {
    return List<NumOfJuz>.generate(30,
          (index) => NumOfJuz(number: index + 1), // Create NumOfJuz with numbers 1 to 30
    );
  }

  @override
  Widget build(BuildContext context) {

    final List<NumOfJuz> numOfJuz = generateNumOfJuz();

    return GridView.builder(
      itemCount: numOfJuz.length, // Use the length of the generated list
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns
        mainAxisSpacing: 4, // Space between rows
        crossAxisSpacing: 4, // Space between columns
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder:
                (context)=>ListSurahOfJuz(numberOfJuz: numOfJuz[index].number!)));
            // Print the number of the tapped item
            print('Tapped on Juz number: ${numOfJuz[index].number}');
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: const Color(0xff14213D),
                  borderRadius: BorderRadius.circular(22)
              ),
              child: Center(
                child: Text(
                  numOfJuz[index].number.toString(), // Display the number
                  style: const TextStyle(color: Colors.white,
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}