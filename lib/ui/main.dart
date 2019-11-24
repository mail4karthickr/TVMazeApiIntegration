import 'package:flutter/material.dart';
import 'package:tvmaze_api_integration/bloc/episode_bloc.dart';
import 'package:tvmaze_api_integration/service/tvmaze_api.dart';
import 'package:tvmaze_api_integration/ui/episode_list.dart';

void main() {
  runApp(
    MaterialApp(
      home: EpisodesListWidget(
        bloc: EpisodesBloc(
            tvMazeApi: TVMazeApi()
        )
      ),
    )
  );
}