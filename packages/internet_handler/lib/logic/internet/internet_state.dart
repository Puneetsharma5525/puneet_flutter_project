// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'internet_cubit.dart';

class InternetState extends Equatable {
  final bool loading;
  final bool connected;
  final bool disconnected;
  final InternetConnectionType internetConnectionType;

  const InternetState({
    this.loading = false,
    this.connected = false,
    this.disconnected = false,
    required this.internetConnectionType,
  });

  @override
  List<Object> get props {
    return [
      loading,
      connected,
      disconnected,
      internetConnectionType,
    ];
  }

  InternetState copyWith({
    bool? loading,
    bool? connected,
    bool? disconnected,
    InternetConnectionType? internetConnectionType,
  }) {
    return InternetState(
      loading: loading ?? false,
      connected: connected ?? false,
      disconnected: disconnected ?? false,
      internetConnectionType:
          internetConnectionType ?? InternetConnectionType.none,
    );
  }
}
