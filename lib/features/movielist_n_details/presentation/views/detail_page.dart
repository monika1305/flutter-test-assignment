import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movielist_n_details/presentation/bloc/movie_detail/remote/remote_movie_detail_bloc.dart';
import 'package:movie_app/features/movielist_n_details/presentation/bloc/movie_detail/remote/remote_movie_detail_events.dart';
import 'package:movie_app/features/movielist_n_details/presentation/bloc/movie_detail/remote/remote_movie_detail_state.dart';

import '../../../../core/di.dart';
import '../widget/detail_image_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    print('details widget.id ==== ${widget.id}');

    return BlocProvider<RemoteMovieDetailBloc>(
      create: (context) => Sl<RemoteMovieDetailBloc>()
      ..add(GetDetailMovieEvent(id: widget.id))
        ..add(GetDetailMovieVideoEvent(widget.id)),
      child: BlocBuilder<RemoteMovieDetailBloc, RemoteMovieDetailState>(
        builder: (context, state) {
          final movies = state.detailsData;
          print('details ==== ${movies?.Title.toString()}');
          return ConditionalBuilder(
            condition: state.detailsData != null,
            builder: (context) {
              return  markDismissable(
                child: DraggableScrollableSheet(
                  initialChildSize: 0.9,
                  minChildSize: 0.7,
                  maxChildSize: 0.9,
                  builder: (BuildContext context, ScrollController scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(25),),
                      ),
                      padding: EdgeInsets.all(5.0),
                      child: ListView(
                        // controller: scrollController,
                        children: [
                          DetailImageWidget(
                            item: movies,
                          ),

                        ],
                      ),
                    );
                  },
                ),
              );
            },
            fallback: (context) {
              return Center(child: CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }

  Widget markDismissable({required Widget child}) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () => Navigator.of(context).pop(),
    child: GestureDetector(onTap: () {},child: child,),
  );
}
