import 'package:flutter/material.dart';
import 'package:my_app/images.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class MovieData {
  late String movieTitle;
  late String movieDate;
  late String movieSubtitle;
  late Image movieImage;
  MovieData(
      {required title, required date, required subtitle, required image}) {
    this.movieTitle = title;
    this.movieDate = date;
    this.movieSubtitle = subtitle;
    this.movieImage = image;
  }
}

class _MovieListState extends State<MovieList> {
  List<MovieData> movies = [
    MovieData(
        image: AppImages.movieVinlandPoster,
        title: "Vinland Saga",
        date: "July 7, 2019",
        subtitle:
            "Thorfinn is a young Iceland villager who aims to participate in wars like his retired father, Thors. One day, mercenaries are hired to kill Thors for abandoning the forces and Thorfinn sneaks in his ship to accompany him."),
    MovieData(
        image: AppImages.movieVinlandPoster,
        title: "Mortal Kombat",
        date: "July 7, 2019",
        subtitle:
            "Thorfinn is a young Iceland villager who aims to participate in wars like his retired father, Thors. One day, mercenaries are hired to kill Thors for abandoning the forces and Thorfinn sneaks in his ship to accompany him."),
    MovieData(
        image: AppImages.movieVinlandPoster,
        title: "Austral",
        date: "July 7, 2019",
        subtitle:
            "Thorfinn is a young Iceland villager who aims to participate in wars like his retired father, Thors. One day, mercenaries are hired to kill Thors for abandoning the forces and Thorfinn sneaks in his ship to accompany him."),
    MovieData(
        image: AppImages.movieVinlandPoster,
        title: "Vikings",
        date: "July 7, 2019",
        subtitle:
            "Thorfinn is a young Iceland villager who aims to participate in wars like his retired father, Thors. One day, mercenaries are hired to kill Thors for abandoning the forces and Thorfinn sneaks in his ship to accompany him."),
    MovieData(
        image: AppImages.movieVinlandPoster,
        title: "Peaky blinders",
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
  List<MovieData> filteredMovies = [];
  TextEditingController _controller = TextEditingController();

  void getFilteredMovies() {
    String text = _controller.text.toLowerCase();
    if (text.isNotEmpty) {
      filteredMovies = movies
          .where((MovieData movie) =>
              movie.movieTitle.toLowerCase().contains(text))
          .toList();
    } else {
      filteredMovies = movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    filteredMovies = movies;

    _controller.addListener(getFilteredMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.only(top: 60),
          itemCount: filteredMovies.length,
          itemExtent: 180,
          itemBuilder: (context, index) {
            final movieData = filteredMovies[index];
            return MovieTile(movieData: movieData);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
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
                contentPadding: const EdgeInsets.all(14)),
          ),
        ),
      ],
    );
  }
}

class MovieTile extends StatelessWidget {
  late final MovieData _movieData;
  MovieTile({
    required movieData,
  }) {
    this._movieData = movieData;
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
              _movieData.movieImage,
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
                      _movieData.movieTitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 16),
                    ),
                    Text(
                      _movieData.movieDate,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 131, 131, 131),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _movieData.movieSubtitle,
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
