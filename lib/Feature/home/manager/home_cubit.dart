// import 'package:bloc/bloc.dart';
import 'package:chat_gpt/Feature/home/data/gpt_model/gpt_model.dart';
import 'package:chat_gpt/Feature/home/data/messageModel/message_model.dart';
import 'package:chat_gpt/Feature/home/manager/home_states.dart';
import 'package:chat_gpt/core/constans/const.dart';
import 'package:chat_gpt/core/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  bool islight = false;
  void changeTheme() {
    islight = !islight;
    emit(ChangeThemeState());
  }

  HomeCubit() : super(InitState());
  GptModel? model;
  static HomeCubit get(context) => BlocProvider.of(context);
  Future<void> chatwithGpt({
    required String msq,
  }) async {
    emit(LoadingGetResponState());
    print(token);
    DioHelper.postData(url: endPoint, token: 'sk-$token', data: {
      "prompt": msq,
      "max_tokens": 600,
      "temperature": 0,
      "stop": null,
    }).then((value) {
      model = GptModel.fromJson(value.data);
      addTochangeList(
          text: value.data['choices'][0]['text'],
          id: 2,
          dateTime: DateTime.now().toString());
      emit(SuccGetResponState());
    }).catchError((onError) {
      emit(FailureGetResponState(msq: onError.toString()));
    });
  }

  Map<int, List<MessageModel>> chats = {};

  List<MessageModel> chatList = [];
  Future<void> addTochangeList(
      {required String text, required int id, required String dateTime}) async {
    chatList.add(MessageModel(text: text, id: id, dateTime: dateTime));
    emit(AddTolistState());
  }

  Future<void> addNewChat({required int? index}) async {
    if (index == null) {
      chats.addAll(
        {
          (chats.length) + 1: chatList,
        },
      );
    } else {
      chats[index] = chatList;
    }

    chatList = [];
    emit(SuccAddListState());
  }

  Future<void> clearConversation() async {
    chats = {};
    emit(SuccAddListState());
  }

  Future<void> deleteList({required int index}) async {
    chats[index] = [];
    // chats.remove(index);
    emit(SuccAddListState());
  }

  Future<void> putEditList({required List<MessageModel> editModel}) async {
    chatList = editModel;
    emit(LoadingEditAddListState());
  }
}
