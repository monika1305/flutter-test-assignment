import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/homepage/presentation/bloc/movie/remote/remote_movie_bloc.dart';
import 'package:movie_app/features/homepage/presentation/bloc/movie/remote/remote_movie_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );

  }

  _buildAppbar(){
    return AppBar(
      title: Text('Movies list',
      style: TextStyle(color: Colors.black),
      ),
    );
  }

 Widget _buildBody(){
    return BlocBuilder<RemoteMovieBloc, RemoteMovieState>(
        builder: (_,state) {
          if(state is RemoteMovieStateLoading){
            return const Center(child: CircularProgressIndicator());
          } if(state is RemoteMovieStateError){
            return const Center(child: Icon(Icons.refresh));
          } if(state is RemoteMovieStateDone){
            return ListView.builder(
              itemCount: state.movies!.length,
                itemBuilder: (context, index){
                return ListTile(
                  title: Text("${index}"),
                );
                },
            );
          }
          return const SizedBox();
        },
    );
  }
}
