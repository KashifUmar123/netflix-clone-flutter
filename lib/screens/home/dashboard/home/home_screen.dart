import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/constants/app_colors.dart';
import 'package:netflix/constants/app_data.dart';
import 'package:netflix/constants/app_images.dart';
import 'package:netflix/constants/app_styles.dart';
import 'package:netflix/models/movie_model.dart';
import 'package:netflix/screens/home/dashboard/video_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Movie> allMovies;

  @override
  void initState() {
    allMovies = movies;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buidlUpperPortion(
              movie: allMovies[allMovies.length - 2],
            ),
            Padding(
              padding: EdgeInsets.only(left: Get.width * 0.05),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Only on Netflix",
                    style: AppStyles.headingStyle,
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  SizedBox(
                    height: Get.height * 0.2,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: allMovies.map((e) {
                        return CustomMovieContainer(movie: e);
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  const Text(
                    "Continue Watching for Screen 1",
                    style: AppStyles.headingStyle,
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  SizedBox(
                    height: Get.height * 0.2,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CustomMovieContainer(
                          movie: allMovies[0],
                        ),
                        CustomMovieContainer(
                          movie: allMovies[0],
                        ),
                        CustomMovieContainer(
                          movie: allMovies[0],
                        ),
                        CustomMovieContainer(
                          movie: allMovies[0],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buidlUpperPortion({
    required Movie movie,
  }) {
    return Container(
      height: Get.height * 0.69,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            movie.thumbailUrl!,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        height: Get.height * 0.7,
        width: Get.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              AppColors.kBlackColor,
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              height: Get.height * 0.19,
              decoration: BoxDecoration(
                color: AppColors.kBlackColor.withOpacity(.1),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                      Image.asset(
                        AppImages.netflixIconN,
                        height: 48,
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.search,
                          color: AppColors.kWhiteColor.withOpacity(.8),
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.06,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.emoji_emotions,
                              color: AppColors.kWhiteColor,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        "TV Shows",
                        style: TextStyle(
                          color: AppColors.kWhiteColor,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Movies",
                        style: TextStyle(
                          color: AppColors.kWhiteColor,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Categories",
                        style: TextStyle(
                          color: AppColors.kWhiteColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.netflixTop10,
                  height: 20,
                ),
                Text(
                  movie.title!,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kWhiteColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.add,
                      color: AppColors.kWhiteColor,
                    ),
                    Text(
                      "My List",
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.kWhiteColor,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.kWhiteColor.withOpacity(.8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.play_arrow,
                        color: AppColors.kBlackColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Play",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.kBlackColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.info_outline,
                      color: AppColors.kWhiteColor,
                    ),
                    Text(
                      "My List",
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.kWhiteColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomMovieContainer extends StatelessWidget {
  const CustomMovieContainer({
    required this.movie,
    this.calledFromBottomSheet = false,
    Key? key,
  }) : super(key: key);

  final Movie movie;
  final bool calledFromBottomSheet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: InkWell(
        onTap: () {
          if (calledFromBottomSheet) {
            return;
          }
          Get.bottomSheet(
            Container(
              height: Get.height * 0.35,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 10.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomMovieContainer(
                          movie: movie,
                          calledFromBottomSheet: true,
                        ),
                        SizedBox(
                          width: Get.width * 0.01,
                        ),
                        // upper name and cross icon
                        SizedBox(
                          width: Get.width * 0.65,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    movie.title!.toUpperCase(),
                                    style: AppStyles.headingStyle,
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: InkWell(
                                      onTap: () => Get.back(),
                                      child: CircleAvatar(
                                        radius: 13,
                                        backgroundColor: AppColors.kGreyColor,
                                        child: const Center(
                                          child: Icon(
                                            Icons.close,
                                            color: AppColors.kWhiteColor,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // date, age group, total episodes if have
                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "2022",
                                    style: TextStyle(
                                      color:
                                          AppColors.kWhiteColor.withOpacity(.6),
                                      fontSize: 13.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.02,
                                  ),
                                  Text(
                                    "18+",
                                    style: TextStyle(
                                      color:
                                          AppColors.kWhiteColor.withOpacity(.6),
                                      fontSize: 13.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.02,
                                  ),
                                  Text(
                                    "10 Episodes",
                                    style: TextStyle(
                                      color:
                                          AppColors.kWhiteColor.withOpacity(.6),
                                      fontSize: 13.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              // movie description
                              AutoSizeText(
                                movie.description!,
                                style: TextStyle(
                                    color:
                                        AppColors.kWhiteColor.withOpacity(.8)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    // actions buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomActionIcon(
                          name: "Play",
                          backgroundColor:
                              AppColors.kWhiteColor.withOpacity(.8),
                          icon: Icons.play_arrow,
                          iconColor: AppColors.kBlackColor,
                          callback: () {
                            Get.back();
                            Get.to(() => VideoScreen(url: movie.movieUrl!));
                          },
                        ),
                        CustomActionIcon(
                          name: "Download",
                          backgroundColor: AppColors.kLightBlack,
                          icon: Icons.download_for_offline_outlined,
                          iconColor: AppColors.kWhiteColor.withOpacity(.8),
                          callback: () {},
                        ),
                        CustomActionIcon(
                          name: "My List",
                          backgroundColor: AppColors.kLightBlack,
                          icon: Icons.add,
                          iconColor: AppColors.kWhiteColor.withOpacity(.8),
                          callback: () {},
                        ),
                        CustomActionIcon(
                          name: "Share",
                          backgroundColor: AppColors.kLightBlack,
                          icon: Icons.share_outlined,
                          iconColor: AppColors.kWhiteColor.withOpacity(.8),
                          callback: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Divider(
                      color: AppColors.kWhiteColor.withOpacity(.3),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: AppColors.kWhiteColor.withOpacity(.8),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              "Episodes & Info",
                              style: TextStyle(
                                color: AppColors.kWhiteColor.withOpacity(.8),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Transform.rotate(
                            angle: 3.14159,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.kWhiteColor.withOpacity(.8),
                              size: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            elevation: 5,
          );
        },
        child: Container(
          height: Get.height * .18,
          width: Get.width * .27,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                movie.thumbailUrl!,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  AppImages.netflixIconN,
                  height: 20,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  AppImages.netflixTop10,
                  height: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomActionIcon extends StatelessWidget {
  const CustomActionIcon({
    Key? key,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.callback,
    required this.name,
  }) : super(key: key);

  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback callback;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Column(
        children: [
          CircleAvatar(
            radius: 17,
            backgroundColor: backgroundColor,
            child: Center(
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            name,
            style: TextStyle(
                color: AppColors.kWhiteColor.withOpacity(.6), fontSize: 11.0),
          ),
        ],
      ),
    );
  }
}
