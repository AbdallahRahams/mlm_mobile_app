// services_event.dart
import 'package:equatable/equatable.dart';

abstract class ServicesEvent extends Equatable {
  const ServicesEvent();

  @override
  List<Object?> get props => [];
}

// Event to load all services
class LoadServicesEvent extends ServicesEvent {}

// Event to search services based on a query
class SearchServicesEvent extends ServicesEvent {
  final String query;

  const SearchServicesEvent(this.query);

  @override
  List<Object?> get props => [query];
}
