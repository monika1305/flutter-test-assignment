import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/config/constant/constant.dart';
import 'package:movie_app/features/movielist_n_details/presentation/bloc/movie_detail/remote/remote_movie_detail_bloc.dart';
import 'package:movie_app/features/movielist_n_details/presentation/bloc/movie_detail/remote/remote_movie_detail_events.dart';
import 'package:movie_app/features/movielist_n_details/presentation/bloc/movie_detail/remote/remote_movie_detail_state.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/entities/movie_entities.dart';

class DetailImageWidget extends StatefulWidget {
  DetailImageWidget({Key? key, required this.item}) : super(key: key);
  final MovieEntities? item;
  @override
  State<DetailImageWidget> createState() => _DetailImageWidgetState();
}

class _DetailImageWidgetState extends State<DetailImageWidget> {
  bool isMore = true;
  //bool isButton = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25),),
              ),
              child: CachedNetworkImage(

                imageUrl: ConstantValueApiGet.imagePath(
                    '${widget.item != null ? widget.item?.BackdropPath : ''}'),
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.fill,
                width: double.infinity,
                imageBuilder: (context, ImageProvider) {
                  return Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: double.infinity,
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(25),),
                        image: DecorationImage(
                          image: ImageProvider,
                          fit: BoxFit.fill,
                        )),
                  );
                },
                errorWidget: (context, value, error) {
                  return Container(
                    child: const Image(
                      image: AssetImage('assets/image/no-pictures.png'),
                    ),
                  );
                },
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
            BlocBuilder<RemoteMovieDetailBloc, RemoteMovieDetailState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () async {
                    BlocProvider.of<RemoteMovieDetailBloc>(context)
                      ..add(GetDetailMovieVideoEvent(widget.item!.id));
                    final Uri _url = Uri.parse(
                        'https://www.youtube.com/embed/${state.video}');
                    if (!await launchUrl(_url)) {
                      throw Exception('Could not launch ');
                    }
                  },
                  child: const Icon(
                    Icons.play_circle_outline_outlined,
                    color: Colors.black,
                    size: 60,
                  ),
                );
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 7, right: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Text(
                '${widget.item != null ? widget.item?.Title : ''}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 0.2,
                      color: Colors.black,
                      offset: Offset.fromDirection(100),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                          'Release Date (${widget.item != null ? widget.item?.ReleaseDate : ''})'),
                      Text(
                          'Vote Count    (${widget.item != null ? widget.item?.VoteCount : ''})'),
                      Row(
                        children: [
                          Text('Vote Average '),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                  '${widget.item != null ? widget.item?.VoteAverage : ''}'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'About the Movie',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 0.2,
                      color: Colors.black,
                      offset: Offset.fromDirection(100),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '${widget.item != null ? widget.item?.Overview : ''}',
                maxLines: isMore == true ? 3 : 10,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 0.2,
                      color: Colors.black,
                      offset: Offset.fromDirection(100),
                    ),
                  ],
                ),
              ),
              Center(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        isMore == false;
                        isMore = !isMore;
                      });
                    },
                    child: Text(
                      isMore == true ? 'See More' : 'See Less ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        shadows: [
                          Shadow(
                            blurRadius: 0.2,
                            color: Colors.blue,
                            offset: Offset.fromDirection(100),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
