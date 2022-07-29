import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:home_work_bloc/models/post_model.dart';
import '../blocks/list_post_cubit.dart';
import '../pages/home_page.dart';
import '../services/http_service.dart';

Widget itemOfPost(Post post) {
  return Slidable(
      endActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              backgroundColor: Colors.red,
              onPressed: (context){
                BlocProvider.of<ListPostCubit>(context).apiPostDelete(post);
                // Network.deleteResponse(Network.apiList, Network.paramsEmpty()).whenComplete(() => {
                //   Navigator.push(context, MaterialPageRoute(
                //       builder: (context) => HomePage())),
                // });
              },
              icon: Icons.delete_outline,
              label: "Delete",),
          ]),
      startActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              backgroundColor: Colors.green,
              onPressed: (context){
                // Navigator.push(context, MaterialPageRoute(
                //     builder: (context) => EditUser(
                //       userId: post.id.toString(),
                //       userBody: post.body,
                //       userText: post.title,
                //     )));
              },
              icon: Icons.drive_file_rename_outline,
              label: "Rename",),
          ]),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.name.toUpperCase(),
              style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(post.phone),
          ],
        ),
      ),
    );

}