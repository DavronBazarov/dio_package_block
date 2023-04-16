import 'package:dio_package/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return _scaffold(context, state);
      },
    );
  }

  Scaffold _scaffold(BuildContext context, HomeState state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello world"),
      ),
      body: Builder(builder: (context) {
        if (state is HomeLoadingState) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is HomeSuccessState) {
          return ListView.builder(
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(state.data[index].name.toString()),
                ),
              );
            },
          );
        }
        else if(state is HomeErrorState){
          return Center(child: Text(state.error),);
        }
        else{
          return const SizedBox();
        }
      }),
    );
  }
}
