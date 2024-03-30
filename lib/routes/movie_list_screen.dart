import 'package:flutter/material.dart';
import 'package:my_app/images.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class SearchFieldWidget extends StatefulWidget {
  const SearchFieldWidget({
    super.key,
  });

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class MovieData {
  late String _movieTitle;
  late String _movieDate;
  late String _movieSubtitle;
  late Image _movieImage;
  MovieData(
      {required title, required date, required subtitle, required image}) {
    this._movieTitle = title;
    this._movieDate = date;
    this._movieSubtitle = subtitle;
    this._movieImage = image;
  }
}

class _MovieListState extends State<MovieList> {
  List<MovieData> movieDataList = [
    MovieData(
        image: AppImages.movieVinlandPoster,
        title: "Vinland Saga",
        date: "July 7, 2019",
        subtitle:
            "Thorfinn is a young Iceland villager who aims to participate in wars like his retired father, Thors. One day, mercenaries are hired to kill Thors for abandoning the forces and Thorfinn sneaks in his ship to accompany him."),
    MovieData(
        image: AppImages.movieVinlandPoster,
        title: "Vinland Saga",
        date: "July 7, 2019",
        subtitle:
            "Thorfinn is a young Iceland villager who aims to participate in wars like his retired father, Thors. One day, mercenaries are hired to kill Thors for abandoning the forces and Thorfinn sneaks in his ship to accompany him."),
    MovieData(
        image: AppImages.movieVinlandPoster,
        title: "Vinland Saga",
        date: "July 7, 2019",
        subtitle:
            "Thorfinn is a young Iceland villager who aims to participate in wars like his retired father, Thors. One day, mercenaries are hired to kill Thors for abandoning the forces and Thorfinn sneaks in his ship to accompany him."),
    MovieData(
        image: AppImages.movieVinlandPoster,
        title: "Vinland Saga",
        date: "July 7, 2019",
        subtitle:
            "Thorfinn is a young Iceland villager who aims to participate in wars like his retired father, Thors. One day, mercenaries are hired to kill Thors for abandoning the forces and Thorfinn sneaks in his ship to accompany him."),
    MovieData(
        image: AppImages.movieVinlandPoster,
        title: "Vinland Saga",
        date: "July 7, 2019",
        subtitle:
            "Thorfinn is a young Iceland villager who aims to participate in wars like his retired father, Thors. One day, mercenaries are hired to kill Thors for abandoning the forces and Thorfinn sneaks in his ship to accompany him."),
    MovieData(
        image: AppImages.movieVinlandPoster,
        title: "Vinland Saga",
        date: "July 7, 2019",
        subtitle:
            "Thorfinn is a young Iceland villager who aims to participate in wars like his retired father, Thors. One day, mercenaries are hired to kill Thors for abandoning the forces and Thorfinn sneaks in his ship to accompany him."),
    MovieData(
        image: AppImages.movieVinlandPoster,
        title: "Vinland Saga",
        date: "July 7, 2019",
        subtitle:
            "Thorfinn is a young Iceland villager who aims to participate in wars like his retired father, Thors. One day, mercenaries are hired to kill Thors for abandoning the forces and Thorfinn sneaks in his ship to accompany him.")
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.only(top: 60),
            itemCount: movieDataList.length,
            itemExtent: 180,
            itemBuilder: (context, index) {
              final movie = movieDataList[index];
              return MovieTile(
                  image: movie._movieImage,
                  title: movie._movieTitle,
                  date: movie._movieDate,
                  subtitle: movie._movieSubtitle);
            },
          ),
        ),
        SearchFieldWidget(),
      ],
    );
  }
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  static TextEditingController _controller = TextEditingController();
  /*
  static List<MovieData> filter(List<MovieData> list) {
    //variables
    List<MovieData> newMovieList = [];
    _controller.addListener(() {
      if (_controller.text.isNotEmpty) {
        for (MovieData movie in list) {
          if (movie._movieTitle.contains(_controller.text)) {
            newMovieList.add(movie);
          }
        }
      } else {
        newMovieList = list;
      }
    });
    return newMovieList;
  }
*/
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
            labelText: "Search",
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.black)),
            isCollapsed: true,
            contentPadding: EdgeInsets.all(14)),
      ),
    );
  }
}

class MovieTile extends StatelessWidget {
  late String _movieTitle;
  late String _movieDate;
  late String _movieSubtitle;
  late Image _movieImage;
  MovieTile(
      {required title, required date, required subtitle, required image}) {
    this._movieTitle = title;
    this._movieDate = date;
    this._movieSubtitle = subtitle;
    this._movieImage = image;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(0, 2))
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.hardEdge,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _movieImage,
              const SizedBox(
                width: 14,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      _movieTitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 16),
                    ),
                    Text(
                      _movieDate,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 131, 131, 131),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _movieSubtitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ]),
          ),
          Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
