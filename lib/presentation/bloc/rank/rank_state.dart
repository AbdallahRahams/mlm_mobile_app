import 'package:equatable/equatable.dart';

import '../../../data/models/rankModel.dart';

abstract class RankState extends Equatable {
  const RankState();

  @override
  List<Object> get props => [];
}

class RankInitial extends RankState {}

class RankLoading extends RankState {}

class RankLoaded extends RankState {
  final List<Rank> ranks;

  const RankLoaded(this.ranks);

  @override
  List<Object> get props => [ranks];
}

class RankError extends RankState {
  final String message;

  const RankError(this.message);

  @override
  List<Object> get props => [message];
}
