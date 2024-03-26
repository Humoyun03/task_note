part of 'complete_bloc.dart';

@immutable
abstract class CompleteEvent {}

class BackToMain extends CompleteEvent{
  final BuildContext context;
  BackToMain(this.context);
}

class GetCompleteNote extends CompleteEvent{}