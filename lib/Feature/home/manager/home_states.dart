abstract class HomeStates {}

class InitState extends HomeStates {}

class LoadingGetResponState extends HomeStates {}

class SuccGetResponState extends HomeStates {}

class FailureGetResponState extends HomeStates {
  final String msq;

  FailureGetResponState({required this.msq});
}

class LoadingSendmessageState extends HomeStates {}

class SuccSendmessageState extends HomeStates {}

class FailureSendmessageState extends HomeStates {}

class AddTolistState extends HomeStates {}

class SuccAddListState extends HomeStates {}

class LoadingEditAddListState extends HomeStates {}

class ChangeThemeState extends HomeStates {}
