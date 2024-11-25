import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bloc/states/sajda_state.dart';
import '../../bloc/cubits/sajga_cubit.dart';
import 'build_list_of_sajda.dart';

class DisplayListSajda extends StatelessWidget {
  const DisplayListSajda({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SajdaCubit()..getSajda(),
        child: BlocConsumer<SajdaCubit, SajdaState>(
          listener: (context, state) {
            if (state is ErrorSajdaState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errMessage)),
              );
            }
          },
          builder: (context, state) {
            if (state is LoadingSajdaState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SuccessSajdaState) {
              return ListView.builder(
                itemCount: state.sajdaModel.data!.ayahs!.length,
                itemBuilder: (context, index) {
                  return BuildListOfSajda(ayahs: state.sajdaModel.data!.ayahs![index]);
                },
              );
            } else {
              return const Center(child: Text("Error loading Sajda data."));
            }
          },
        ),
      );
  }
}