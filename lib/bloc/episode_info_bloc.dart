import 'package:rxdart/rxdart.dart';
import 'package:tvmaze_api_integration/model/show_info.dart';
import 'package:tvmaze_api_integration/service/tvmaze_api.dart';

class EpisodeInfoBloc {

  /// Dependencies
  final TVMazeApi tvMazeApi;

  /// Inputs
  final _initStateSubject = BehaviorSubject<int>();
  Sink<int> get initState => _initStateSubject.sink;

  /// Outputs
  Stream<ShowInfo> showInfo;

  EpisodeInfoBloc({this.tvMazeApi}) : assert(tvMazeApi != null) {
      showInfo = _initStateSubject
        .switchMap((showId) => tvMazeApi.getShowInfoById(showId).asStream());
  }

  close() {
    _initStateSubject.close();
  }
}