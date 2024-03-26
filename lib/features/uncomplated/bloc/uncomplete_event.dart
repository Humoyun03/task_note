part of 'uncomplete_bloc.dart';

@immutable
abstract class UnCompleteEvent {}

class BackToMain extends UnCompleteEvent{
  final BuildContext context;
  BackToMain(this.context);
}

class GetUnCompleteNote extends UnCompleteEvent{}