import 'package:flutter/material.dart';
import 'package:moviessku/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          const SizedBox(height: 60),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/img_profile.jpg',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Column(
                  children: [
                    ProfileItem(
                      title: 'Nama:',
                      name: 'Faik Irkhamudin',
                    ),
                    SizedBox(height: 10),
                    ProfileItem(
                      title: 'Email:',
                      name: 'faikirkham@gmail.com',
                    ),
                    SizedBox(height: 10),
                    ProfileItem(
                      title: 'Username:',
                      name: 'faikirkham',
                    ),
                    SizedBox(height: 10),
                    ProfileItem(
                      title: 'No Hp:',
                      name: '0813 2805 1202',
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String title;
  final String? name;
  const ProfileItem({
    super.key,
    required this.title,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
          Text(
            name!,
            style: blackTextStyle,
          ),
        ],
      ),
    );
  }
}
