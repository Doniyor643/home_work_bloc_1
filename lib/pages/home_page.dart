import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocks/list_post_cubit.dart';
import '../blocks/list_post_state.dart';
import '../models/post_model.dart';
import '../views/view_of_home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ListPostCubit>(context).apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BloC1"),
        ),
        body: BlocBuilder<ListPostCubit,ListPostState>(
          builder: (BuildContext context, ListPostState state){
            if(state is ListPostError){
              return viewOfHome(items, true);
            }
            if(state is ListPostLoaded){
              items = state.posts;
              return viewOfHome(items, false);
            }
            return viewOfHome(items, true);
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            // Respond to button press
          },
          child: const Icon(Icons.add),
        ));
  }
}