part of 'lobby_bloc.dart';

abstract class LobbyState extends Equatable {
  const LobbyState();

  @override
  List<Object> get props => [];
}

class LobbyActonState extends LobbyState {}

class LobbyInitial extends LobbyState {}

class LobbyChatNavigatorActionState extends LobbyActonState {
  String name;

  LobbyChatNavigatorActionState({
    required this.name,
  });
}
