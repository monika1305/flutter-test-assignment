import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/homepage/datalayers/models/movie_model.dart';
import 'package:movie_app/features/homepage/domain/entities/movie_entities.dart';
import 'package:movie_app/features/homepage/presentation/bloc/movie/remote/remote_movie_bloc.dart';
import 'package:movie_app/features/homepage/presentation/bloc/movie/remote/remote_movie_state.dart';
import 'package:movie_app/features/homepage/presentation/widget/latest_widget.dart';

import '../../../../config/constant/constant.dart';
import '../widget/expansion.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: LatestWidget(),
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
         return ConditionalBuilder(
              condition: state.latestData.isNotEmpty &&
              state.popularData.isNotEmpty &&
              state.topratedData.isNotEmpty &&
              state.upcomingData.isNotEmpty,
              builder: (context) {

                return  SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      // LatestWidget(),
                      ExpansionTile(
                        title: const Text(
                      'Latest',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    maintainState: true,
                    children: _getChildren(state.latestData.length, state.latestData),  // <------ add this
                  ),


                     ],
                  ),
                );


          }, fallback: (context) {
            return Center(child: CircularProgressIndicator());
          },
    );
     },
    );
 }
  List<Widget> _getChildren(int count, List<MovieEntities> arrData) =>
      List<Widget>.generate(
        arrData.length,
            (i) => Card(
          child: ListTile(
            //**** IMAGE LOADING WITH PLACEHOLDER ****/
            leading: ClipRRect(
              child: CachedNetworkImage(
                imageUrl: ConstantValueApiGet.imagePath(arrData[i].PosterPath),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
                height: 60,
                width: 60,
              ),
            ),
            title: Text(arrData[i].Title,
                style: const TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text(arrData[i].originalTitle),

          ),
        ),
      );
}
