import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:youtube_search_tutorial/data/model/detail/video_snippet.dart';
import 'package:youtube_search_tutorial/ui/detail/detail.dart';
import 'package:youtube_search_tutorial/ui/search/widget/centered_message.dart';

class DetailPage extends StatefulWidget {
  final String videoId;

  DetailPage({
    Key key,
    @required this.videoId,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _detailBloc = kiwi.Container().resolve<DetailBloc>();

  @override
  void initState() {
    super.initState();
    _detailBloc.onShowDetail(id: widget.videoId);
  }

  @override
  void dispose() {
    super.dispose();
    _detailBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _detailBloc,
      child: Scaffold(
        body: BlocBuilder(
          bloc: _detailBloc,
          builder: _buildScaffoldContent,
        ),
      ),
    );
  }

  Widget _buildScaffoldContent(BuildContext context, DetailState state) {
    // CustomScrollView can hold multiple Slivers which have custom scrolling effects
    // A Sliver is simply a portion of a scrollable area.
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 178,
          pinned: true,
          flexibleSpace: _buildSliverAppBarContent(state),
        ),
        _buildPageBody(state)
      ],
    );
  }

  FlexibleSpaceBar _buildSliverAppBarContent(DetailState state) {
    if (state.isLoading) {
      return FlexibleSpaceBar();
    }

    if (state.isSuccessful) {
      return FlexibleSpaceBar(
        title: Text(
          state.videoItem.snippet.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        // Stack orders children behind each other
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(
              state.videoItem.snippet.thumbnails.high.url,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.15, 0.5],
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return FlexibleSpaceBar(
        background: CenteredMessage(
          message: state.error,
          icon: Icons.error_outline,
        ),
      );
    }
  }

  Widget _buildPageBody(DetailState state) {
    if (state.isLoading) {
      return SliverFillRemaining(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (state.isSuccessful) {
      return _buildVideoDetailList(state.videoItem.snippet);
    } else {
      return SliverFillRemaining(
        child: CenteredMessage(
          message: state.error,
          icon: Icons.error_outline,
        ),
      );
    }
  }

  Widget _buildVideoDetailList(VideoSnippet videoSnippet) {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverList(
        // Takes in children list directly without a builder
        delegate: SliverChildListDelegate(
          <Widget>[
            SizedBox(height: 5),
            Text(
              videoSnippet.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: MediaQuery.of(context).size.width * 2,
                child: Wrap(
                  spacing: 10,
                  children: _getTagsAsChipWidgets(videoSnippet),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Description',
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(height: 5),
            Text(videoSnippet.description),
          ],
        ),
      ),
    );
  }

  List<Widget> _getTagsAsChipWidgets(VideoSnippet videoSnippet) {
    return videoSnippet.tags.map((tag) {
      return Chip(
        label: Text(tag),
      );
    }).toList();
  }
}
