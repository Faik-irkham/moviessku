import 'package:flutter/material.dart';
import 'package:moviessku/data/movie_model.dart';
import 'package:moviessku/theme.dart';

class DetailMoviePage extends StatelessWidget {
  final MovieModel movie;
  const DetailMoviePage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(movie.image!),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.white,
                      Colors.blue.shade200.withOpacity(.1),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                movie.judul!,
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 2),
                  RichText(
                    text: TextSpan(
                      text: movie.rating,
                      style: amberTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: semiBold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' (50)',
                          style: blackTextStyle.copyWith(
                            fontSize: 8,
                            fontWeight: medium,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.maxFinite,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue.shade50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(
                        Icons.calendar_month_rounded,
                        size: 14,
                      ),
                      Text(
                        movie.tahun!,
                        style: blackTextStyle,
                      ),
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 14,
                      ),
                      Text(
                        '${movie.durasi!} menit',
                        style: blackTextStyle,
                      ),
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(
                        Icons.flag_circle_rounded,
                        size: 14,
                      ),
                      Text(
                        movie.genre!,
                        style: blackTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sinopsis',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: Text(
                      movie.plot!,
                      textAlign: TextAlign.justify,
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
