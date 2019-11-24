import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:tvmaze_api_integration/bloc/episode_info_bloc.dart';
import 'package:html/parser.dart';
import 'package:tvmaze_api_integration/model/show_info.dart';

class EpisodeInfo extends StatefulWidget {
  final int episodeId;
  final EpisodeInfoBloc bloc;

  EpisodeInfo({this.episodeId, this.bloc})
      : assert(episodeId != null),
        assert(bloc != null);

  @override
  _EpisodeInfoState createState() => _EpisodeInfoState();
}

class _EpisodeInfoState extends State<EpisodeInfo> {

  @override
  void initState() {
    super.initState();
    widget.bloc.initState.add(widget.episodeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<ShowInfo>(
          stream: widget.bloc.showInfo,
          builder: (context, snapshot) {
            return snapshot.hasData ? CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 210,
                  flexibleSpace: LayoutBuilder(
                    builder: (context, constraints) {
                      final top = constraints.biggest.height;
                      return FlexibleSpaceBar(
                        centerTitle: true,
                        title: Opacity(
                          opacity: top == 100.0 ? 1.0: 0.0,
                          child: Text('${snapshot.data.name}'),
                        ),
                        background: FadeInImage.memoryNetwork(
                            fit: BoxFit.fill,
                            placeholder: kTransparentImage,
                            image: snapshot.data.image.original
                        )
                      );
                    },
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                      <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                          child: Text(
                              snapshot.data.name,
                              style: TextStyle(fontSize: 25,
                                  fontStyle: FontStyle.italic
                              )
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 25, 10, 5),
                          child: Text(
                              _parseHtmlString(snapshot.data.summary),
                              style: TextStyle(fontSize: 20,
                                  fontStyle: FontStyle.italic
                              )
                          ),
                        ),
                      ]
                  ),
                )
              ],
            ) : Center(child: CircularProgressIndicator());
          }
        )
    );
  }

  String _parseHtmlString(String htmlString) {
    var document = parse(htmlString);
    String parsedString = parse(document.body.text).documentElement.text;
    return parsedString;
  }

  @override
  void dispose() {
    widget.bloc.close();
    super.dispose();
  }
}
