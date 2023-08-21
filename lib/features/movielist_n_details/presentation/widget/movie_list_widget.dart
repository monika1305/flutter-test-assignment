import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movielist_n_details/presentation/bloc/movie/remote/remote_movie_bloc.dart';
import 'package:movie_app/features/movielist_n_details/presentation/bloc/movie/remote/remote_movie_state.dart';
import 'package:movie_app/features/movielist_n_details/presentation/views/detail_page.dart';

import '../../../../config/constant/constant.dart';

class MovieListWidget extends StatelessWidget {

  const MovieListWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteMovieBloc, RemoteMovieState>(

      builder: (context, state) {
        return  ConditionalBuilder(
            condition: state.latestData.isNotEmpty &&
                state.popularData.isNotEmpty &&
                state.topratedData.isNotEmpty &&
                state.upcomingData.isNotEmpty,
            builder: (context) {

              return  SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 8.0,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.20,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: home_cover_image,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.18,
                    placeholder: (context, value) {
                      return const Image(
                        image: AssetImage(
                            'assets/image/86075-loading-upload-image.gif'),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: 500,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.80,
                child: ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    Card(
                      color: Colors.white,
                      elevation: 8.0,
                      margin: const EdgeInsets.all(5.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: ExpansionTile(
                        title: Text('Latest'),
                        children: [
                          Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.20,
                            width: double.infinity,
                            margin: const EdgeInsets.all(5),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.latestData.length,
                              itemBuilder: (context, index) {
                                final item = state!.latestData[index];

                                return GestureDetector(
                                  onTap: () =>
                                      showModalBottomSheet(
                                        context: context,
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) =>
                                            DetailPage(id: item.id),
                                      ),

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      Card(
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 10),
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.10,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.40,
                                          child: CachedNetworkImage(
                                            imageUrl: ConstantValueApiGet
                                                .imagePath(item.BackdropPath),
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                            height: 300,
                                            placeholder: (context, value) {
                                              return Container(
                                                child: const Image(
                                                  image: AssetImage(
                                                      'assets/image/86075-loading-upload-image.gif'),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),

                                      Text(
                                          item.originalTitle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)

                                      ),
                                    ],
                                  ),
                                );
                              },

                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      elevation: 8.0,
                      margin: const EdgeInsets.all(5.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: ExpansionTile(
                        title: Text('Popular'),
                        children: [
                          Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.20,
                            width: double.infinity,
                            margin: EdgeInsets.all(5),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.popularData.length,
                                itemBuilder: (context, index) {
                                  final item = state!.popularData[index];

                                  return GestureDetector(
                                      onTap: () =>
                                      showModalBottomSheet(
                                        context: context,
                                        clipBehavior: Clip.hardEdge,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) =>
                                            DetailPage(id: item.id),
                                      ),

                                  child:  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      Card(
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 10),
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.10,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.40,
                                          child: CachedNetworkImage(
                                            imageUrl: ConstantValueApiGet
                                                .imagePath(item.BackdropPath),
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                            height: 300,
                                            placeholder: (context, value) {
                                              return Container(
                                                child: const Image(
                                                  image: AssetImage(
                                                      'assets/image/86075-loading-upload-image.gif'),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),

                                      Text(
                                          item.originalTitle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)

                                      ),
                                    ],
                                  ),
                                  );
                                }

                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      elevation: 8.0,
                      margin: const EdgeInsets.all(5.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: ExpansionTile(
                        title: Text('TopRated'),
                        children: [
                          Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.20,
                            width: double.infinity,
                            margin: EdgeInsets.all(5),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.topratedData.length,
                                itemBuilder: (context, index) {
                                  final item = state!.topratedData[index];

                                  return GestureDetector(
                                    onTap: () =>
                                        showModalBottomSheet(
                                          context: context,
                                          clipBehavior: Clip.hardEdge,
                                          backgroundColor: Colors.transparent,
                                          builder: (context) =>
                                              DetailPage(id: item.id),
                                        ),

                                    child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      Card(
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 10),
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.10,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.40,
                                          child: CachedNetworkImage(
                                            imageUrl: ConstantValueApiGet
                                                .imagePath(item.BackdropPath),
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                            height: 300,
                                            placeholder: (context, value) {
                                              return Container(
                                                child: const Image(
                                                  image: AssetImage(
                                                      'assets/image/86075-loading-upload-image.gif'),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),

                                      Text(
                                          item.originalTitle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)

                                      ),
                                    ],
                                  ),
                                  );
                                }

                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      elevation: 8.0,
                      margin: const EdgeInsets.all(5.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: ExpansionTile(
                        title: const Text('Up Coming'),
                        children: [
                          Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.20,
                            width: double.infinity,
                            margin: EdgeInsets.all(5),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.upcomingData.length,
                                itemBuilder: (context, index) {
                                  final item = state!.upcomingData[index];

                                  return GestureDetector(
                                    onTap: () =>
                                        showModalBottomSheet(
                                          context: context,
                                          clipBehavior: Clip.hardEdge,
                                          backgroundColor: Colors.transparent,
                                          builder: (context) =>
                                              DetailPage(id: item.id),
                                        ),

                                    child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      Card(
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 10),
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.10,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.40,
                                          child: CachedNetworkImage(
                                            imageUrl: ConstantValueApiGet
                                                .imagePath(item.BackdropPath),
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                            height: 300,
                                            placeholder: (context, value) {
                                              return Container(
                                                child: const Image(
                                                  image: AssetImage(
                                                      'assets/image/86075-loading-upload-image.gif'),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),

                                      Text(
                                          item.originalTitle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)

                                      ),
                                    ],
                                  ),
                                  );
                                }

                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
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


}
