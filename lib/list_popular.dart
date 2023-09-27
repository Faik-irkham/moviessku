import 'package:flutter/material.dart';
import 'package:moviessku/data/movie_model.dart';
import 'package:moviessku/detail_movie.dart';
import 'package:moviessku/theme.dart';

class PopularMovie extends StatelessWidget {
  final MovieModel data;
  const PopularMovie({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailMoviePage(
                    movie: data,
                  ),
                ),
              );
            },
            child: SizedBox(
              width: double.infinity,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(data.image!),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.genre!,
                            style: blackTextStyle,
                          ),
                          Text(
                            data.judul!,
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time_filled_rounded,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${data.durasi} menit',
                                style: blackTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40),
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
                            text: data.rating,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
