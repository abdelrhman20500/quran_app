import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../cubits/cubits/sajga_cubit.dart';
import '../../cubits/states/sajda_state.dart';
import 'build_list_of_sujda.dart';

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
            return Center(
              child: LoadingAnimationWidget.inkDrop(
                color: const Color(0xff14213D),
                size: 75,
              ),
            );
          } else if (state is SuccessSajdaState) {
            return ListView.builder(
              itemCount: state.sajdaModel.data!.ayahs!.length,
              itemBuilder: (context, index) {
                return BuildListOfSajda(ayahs: state.sajdaModel.data!.ayahs![index]);
              },
            );
          } else if (state is ErrorSajdaState) {
            return const Center(child: Text("Error loading Sajda data."));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}