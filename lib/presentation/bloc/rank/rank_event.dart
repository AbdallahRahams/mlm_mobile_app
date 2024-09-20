import 'package:equatable/equatable.dart';

abstract class RankEvent extends Equatable {
  const RankEvent();

  @override
  List<Object> get props => [];
}

class LoadRanksEvent extends RankEvent {}
