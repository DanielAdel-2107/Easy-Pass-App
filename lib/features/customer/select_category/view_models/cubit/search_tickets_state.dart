part of 'search_tickets_cubit.dart';

@immutable
sealed class SearchTicketsState {}

final class SearchTicketsInitial extends SearchTicketsState {}
final class TicketsLoaded extends SearchTicketsState {}
