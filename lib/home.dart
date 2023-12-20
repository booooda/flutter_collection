import 'package:flutter/material.dart';
import 'package:flutter_collection/shared_data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'custom_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final BannerAd myBanner = BannerAd(
  //   adUnitId: 'ca-app-pub-8426797145803818/6228101070',
  //   size: AdSize.banner,
  //   request: const AdRequest(),
  //   listener: BannerAdListener(
  //     // Called when an ad is successfully received.

  //     // Called when an ad request failed.
  //     onAdFailedToLoad: (Ad ad, LoadAdError error) {
  //       // Dispose the ad here to free resources.
  //       ad.dispose();
  //       // print('Ad failed to load: $error');
  //     },
  //   ),
  // );
  @override
  void initState() {
    super.initState();
    //myBanner.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 15),
                const Text("Flutter Collectios",
                    style: TextStyle(fontSize: 25, color: Colors.white)),
                const Text('Improve your skills easily 🙌',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 79, 234, 102))),
                const SizedBox(height: 10),
                const Text('@Credits: Abdelrahman Sobhy',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 79, 234, 193))),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        launchUrl(
                            Uri.parse('https://www.linkedin.com/in/abdo2999/'));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/img/Main/linked.png',
                          height: 40,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(
                            'https://www.instagram.com/flutter_developer_as/'));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/img/Main/insta.png',
                          height: 40,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(
                            'mailto:abdosobhy1200@gmail.com?subject=Product Inquiry&body='));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/img/Main/gmail.png',
                          height: 40,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    launchUrl(Uri.parse(
                        'https://github.com/abdo1200/flutter_collection'));
                  },
                  child: const Text('Click Here To get project code',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 79, 208, 234))),
                ),
                const SizedBox(height: 20),
                // SizedBox(
                //   height: 60,
                //   width: 320,
                //   child: AdWidget(ad: myBanner),
                // ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    for (int i = 0; i < cardData.length; i++)
                      CustomCard(
                        project: Project.fromMap(cardData[i]),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
