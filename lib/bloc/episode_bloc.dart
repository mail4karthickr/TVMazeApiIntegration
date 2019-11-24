import 'package:rxdart/rxdart.dart';
import 'package:tvmaze_api_integration/model/episode.dart';
import 'package:tvmaze_api_integration/service/tvmaze_api.dart';

class EpisodesBloc {
  /// Dependencies
  TVMazeApi tvMazeApi;

  /// Inputs
  final _initStateSubject = PublishSubject();
  Sink get initState => _initStateSubject.sink;

  final _episodeNameSubject = PublishSubject<String>();
  Sink<String> get episodeName => _episodeNameSubject.sink;

  /// Outputs
  Stream<List<Episode>> episodesList;
  Stream<bool> showActivityIndicator;

  EpisodesBloc({TVMazeApi tvMazeApi}) : assert(tvMazeApi != null) {
    this.tvMazeApi = tvMazeApi;

    final searchEpisodeResult = _episodeNameSubject
        .throttleTime(Duration(milliseconds: 300))
        .switchMap((name) => tvMazeApi.getShowByName(name).asStream())
        .map((episodesList) => episodesList.episodes);

    showActivityIndicator = Observable.merge([
      _episodeNameSubject.map((_) => true),
      searchEpisodeResult.map((_) => false)
    ]);

    episodesList =
        searchEpisodeResult.map((searchEpisodeResult) => searchEpisodeResult);
  }

  close() {
    _initStateSubject.close();
    _episodeNameSubject.close();
  }
}
