import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_api_integration/bloc/episode_bloc.dart';
import 'package:tvmaze_api_integration/bloc/episode_info_bloc.dart';
import 'package:tvmaze_api_integration/model/episode.dart';
import 'package:tvmaze_api_integration/service/tvmaze_api.dart';

import 'episode_info.dart';

class EpisodesListWidget extends StatefulWidget {
  final EpisodesBloc bloc;

  EpisodesListWidget({this.bloc}) : assert(bloc != null);

  @override
  _EpisodesListWidgetState createState() => _EpisodesListWidgetState();
}

class _EpisodesListWidgetState extends State<EpisodesListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Episodes List'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: widget.bloc.episodeName.add,
              decoration: InputDecoration(
                  suffixIcon: StreamBuilder<bool>(
                      initialData: false,
                      stream: widget.bloc.showActivityIndicator,
                      builder: (context, snapShot) {
                        return snapShot.data ? CupertinoActivityIndicator(animating: snapShot.data) :
                            Container(
                              width: 10,
                              height: 10,
                            );
                      }),
                  labelText: 'Search by Episode',
                  hintText: 'Enter episode name',
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Episode>>(
                stream: widget.bloc.episodesList,
                initialData: [],
                builder: (context, snapShot) {
                  if (snapShot.data.isEmpty) {
                    return Center(
                      child: Text('No Episodes'),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapShot.data.length,
                        itemBuilder: (context, index) {
                          final episode = snapShot.data[index];
                          return ListTile(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                return EpisodeInfo(episodeId: episode.show.id, bloc: EpisodeInfoBloc(tvMazeApi:  TVMazeApi()));
                              }));
                            },
                            title: Text(episode.show.name),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.bloc.close();
    super.dispose();
  }
}
