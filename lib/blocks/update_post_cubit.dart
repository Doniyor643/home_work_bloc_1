import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_work_bloc/blocks/update_post_state.dart';

import '../models/post_model.dart';
import '../services/http_service.dart';


class UpdatePostCubit extends Cubit<UpdatePostState>  {
  UpdatePostCubit() : super(UpdatePostInit());


  void apiPostUpdate(Post post) async{
    post.id = 1;
    print(post.toJson());
    emit(UpdatePostLoading());
    final response = await Network.putResponse(Network.apiUpdate + post.id.toString(), Network.paramsUpdate(post));
    print(response);
    if (response != null) {
      emit(UpdatePostLoaded(isUpdated: true));
    } else {
      emit(UpdatePostError(error: "Couldn't update post"));
    }
  }
}