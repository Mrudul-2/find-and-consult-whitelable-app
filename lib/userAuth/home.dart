import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:whitelabel/api/api.dart';

import '../color.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Future getColorPallete(ImageProvider image) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(image);
    final colors = [
      "${paletteGenerator.dominantColor!.color.toHex().substring(3, 9)}",
      "${paletteGenerator.dominantColor!.titleTextColor.toHex().substring(3, 9)}",
      "${paletteGenerator.dominantColor!.bodyTextColor.toHex().substring(3, 9)}",
      "${paletteGenerator.lightMutedColor!.titleTextColor.toHex().substring(3, 9)}",
    ];

    return colors;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllCities();
    r = 0;
  }

  double r = 0;
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FCColors.bgWhite,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: false,
        title: Text(
          'Hi, Noelle!',
          style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w500,
              color: HexColor.fromHex("#990B131E")),
        ),
        actions: [
          TextButton(
              onPressed: () async {
                Navigator.pushNamed(context, "/profile");
                // await FirebaseAuth.instance.signOut();
              },
              child: Image.asset('assets/images/Ellipse 538.png')),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            color: FCColors.bgWhite,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.01),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Form(
                              key: _key,
                              child: TextFormField(
                                textCapitalization:
                                    TextCapitalization.sentences,
                                textInputAction: TextInputAction.go,
                                onSaved: (val) {},
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Outfit',
                                    color: HexColor.fromHex("#343E42"),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(Icons.search),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: FCColors.tonedRed,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: const Icon(
                                Icons.tune,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Categories',
                    style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                        color: HexColor.fromHex("#0B131E"),
                        fontSize: 24.0),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 130.0,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 20.0, 20.0, 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.0),
                                border: Border.all(
                                  color: HexColor.fromHex("#64748B"),
                                  width: 0.1,
                                ),
                                color: HexColor.fromHex("#F7FCFF")),
                            child: Column(
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  child: Image.asset(
                                    'assets/images/House.png',
                                    fit: BoxFit.fill,
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  'Permanent Visa',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w400,
                                      color: HexColor.fromHex("#A5A5A5"),
                                      fontSize: 13.0),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 20.0, 20.0, 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.0),
                                border: Border.all(
                                  color: HexColor.fromHex("#64748B"),
                                  width: 0.1,
                                ),
                                color: HexColor.fromHex("#F7FCFF")),
                            child: Column(
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  child: Image.asset(
                                    'assets/images/Vector.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  'Buisness Visa',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w400,
                                      color: HexColor.fromHex("#A5A5A5"),
                                      fontSize: 13.0),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 20.0, 20.0, 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.0),
                                border: Border.all(
                                  color: HexColor.fromHex("#64748B"),
                                  width: 0.1,
                                ),
                                color: HexColor.fromHex("#F7FCFF")),
                            child: Column(
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  child: Image.asset(
                                    'assets/images/Monetization on.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  'Investment Visa',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w400,
                                      color: HexColor.fromHex("#A5A5A5"),
                                      fontSize: 13.0),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 20.0, 20.0, 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.0),
                                border: Border.all(
                                  color: HexColor.fromHex("#64748B"),
                                  width: 0.1,
                                ),
                                color: HexColor.fromHex("#F7FCFF")),
                            child: Column(
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  child: Image.asset(
                                    'assets/images/Explore.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  'Study Visa',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w400,
                                      color: HexColor.fromHex("#A5A5A5"),
                                      fontSize: 13.0),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 20.0, 20.0, 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.0),
                                border: Border.all(
                                  color: HexColor.fromHex("#64748B"),
                                  width: 0.1,
                                ),
                                color: HexColor.fromHex("#F7FCFF")),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  'Tourist Visa',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w400,
                                      color: HexColor.fromHex("#A5A5A5"),
                                      fontSize: 13.0),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Our Achievers',
                    style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                        color: HexColor.fromHex("#0B131E"),
                        fontSize: 24.0),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                      height: 212.0,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 20.0,
                        ),
                        itemBuilder: (context, index) {
                          return TextButton(
                            onPressed: () {},
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(
                                  20, 20.0, 20.0, 20.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.0),
                                  border: Border.all(
                                    color: HexColor.fromHex("#64748B"),
                                    width: 0.1,
                                  ),
                                  color: HexColor.fromHex("#F7FCFF"),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://images.pexels.com/photos/280249/pexels-photo-280249.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                    ),
                                    fit: BoxFit.fill,
                                  )),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    'UX Designer',
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontFamily: 'Outfit',
                                        fontWeight: FontWeight.w600,
                                        color: FCColors.bgWhite,
                                        fontSize: 13.0),
                                  ),
                                  Text(
                                    '1 day go on',
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontFamily: 'Outfit',
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffdcd7e4),
                                        fontSize: 8.0),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: 6,
                      )),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Popular Countries',
                    style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                        color: HexColor.fromHex("#0B131E"),
                        fontSize: 24.0),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                      height: 212.0,
                      child: GridView.builder(
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xfff8f8f8)
                            ),
                          );
                        },
                      )
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      width: double.infinity,
                      height: 200.0,
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: HexColor.fromHex("D48C4A"),
                          borderRadius: BorderRadius.circular(18.0)),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Image.asset("assets/images/image 6.png",
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 200.0,
                                fit: BoxFit.contain),
                          ),
                          Expanded(
                            flex: 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20.0,
                                ),
                                const Text(
                                  "AD SUBTITLE",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const Text(
                                  "Register As Agent!",
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20.0),
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(
                                      30.0, 10.0, 30.0, 10.0),
                                  decoration: BoxDecoration(
                                    color: HexColor.fromHex("#46474B"),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: const Text(
                                    'AD CTA',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'About Company',
                      style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: HexColor.fromHex("#0B131E")),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          width: 360,
                          height: 157,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(16.5)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: 13.6,
                                  fontWeight: FontWeight.w500,
                                  color: FCColors.lightBlack),
                            ),
                            Row(
                              children: [
                                RatingBar.builder(
                                  itemSize: 30,
                                  initialRating: 0,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 2.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Color(0xffff8700),
                                  ),
                                  onRatingUpdate: (rating) {
                                    setState(() {
                                      r = rating;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '$r/5',
                                  style: TextStyle(
                                      color: Color(0xff273240),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      fontFamily: 'DM Sans'),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,a totam rem aperiam, eaque ipsa quae ab illobrom in inventore veritatis et quasi architecto beatae now.',
                          style: TextStyle(
                              color: FCColors.textGrey,
                              fontFamily: 'SF Pro Text',
                              fontSize: 13.6,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SizedBox(
                          height: 90,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 10.0,
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                width: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.0),
                                    border: Border.all(
                                      color: HexColor.fromHex("#64748B"),
                                      width: 0.1,
                                    ),
                                    color: HexColor.fromHex("#F7FCFF"),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://images.pexels.com/photos/280249/pexels-photo-280249.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                      ),
                                      fit: BoxFit.fill,
                                    )),
                              );
                            },
                            itemCount: 6,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Affiliations & Achievements',
                      style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: HexColor.fromHex("#0B131E")),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      height: 116,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10.0,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            width: 294,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11.0),
                              border: Border.all(
                                color: HexColor.fromHex("#64748B"),
                                width: 0.1,
                              ),
                              color: HexColor.fromHex("#F7FCFF"),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  right: 0,
                                  child: Container(
                                    width: 84,
                                    height: 19,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(12),
                                          bottomLeft: Radius.circular(10)),
                                      color: FCColors.tonedRed,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '2023',
                                        style: TextStyle(
                                            fontFamily: 'DM Sans',
                                            color: FCColors.bgWhite,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 7.87),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Container(
                                        width: 106,
                                        height: 106,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.47),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://hips.hearstapps.com/hmg-prod/images/cute-room-ideas-1677096334.png?crop=0.595xw:1.00xh;0.119xw,0&resize=1200:*'),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Study Visa',
                                          style: TextStyle(
                                              fontFamily: 'Outfit',
                                              color: FCColors.textBlack,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15.47),
                                        ),
                                        Text(
                                          'description',
                                          style: TextStyle(
                                              fontFamily: 'Outfit',
                                              color: FCColors.textGrey,
                                              fontWeight: FontWeight.w200,
                                              fontSize: 15.47),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: 6,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Our Branches',
                      style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: HexColor.fromHex("#0B131E")),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      height: 197.23,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10.0,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            width: 331,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11.0),
                                border: Border.all(
                                  color: HexColor.fromHex("#64748B"),
                                  width: 0.1,
                                ),
                                color: HexColor.fromHex("#F7FCFF"),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://images.unsplash.com/photo-1621831337128-35676ca30868?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z2xhc3MlMjBidWlsZGluZ3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
                                    fit: BoxFit.cover)),
                            child: Stack(
                              children: [
                                Positioned(
                                  right: 10,
                                  top: 20,
                                  child: Container(
                                    width: 84,
                                    height: 19,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: FCColors.tonedRed,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Contact us',
                                        style: TextStyle(
                                            fontFamily: 'DM Sans',
                                            color: FCColors.bgWhite,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 30,
                                    left: 20,
                                    child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundImage: AssetImage('assets/images/Ellipse 23.png'),
                                    ),
                                    SizedBox(width: 10,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'City',
                                          style: TextStyle(
                                              color: FCColors.bgWhite,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'DM Sans',
                                              fontSize: 15
                                          ),
                                        ),
                                        Text(
                                          'Address',
                                          style: TextStyle(
                                              color: FCColors.bgWhite,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'DM Sans',
                                              fontSize: 12
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ))
                              ],
                            ),
                          );
                        },
                        itemCount: 6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Blogs',
                      style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: HexColor.fromHex("#0B131E")),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      height: 95,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10.0,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            width: 345,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11.0),
                                border: Border.all(
                                  color: HexColor.fromHex("#64748B"),
                                  width: 0.1,
                                ),
                                color: HexColor.fromHex("#F7FCFF"),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 97,
                                  height: 97,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                      image: NetworkImage('https://media.istockphoto.com/id/1487894858/photo/candlestick-chart-and-data-of-financial-market.webp?b=1&s=170667a&w=0&k=20&c=iwQM0ozj7upM-_7CUEjZ2veIY3ljlB8m3PbijouIyVM='),
                                      fit: BoxFit.cover
                                    )
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 51,
                                            height: 19,
                                            color: Color(0xfff2f2f2),
                                            child: Center(
                                              child: Text(
                                                'Technology',
                                                style: TextStyle(
                                                  fontFamily: 'DM Sans',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 8,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 30,),
                                          Text(
                                            'Jan 4, 2022 · 3344 Views',
                                            style: TextStyle(
                                              fontFamily: 'DM Sans',
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10,
                                              color: FCColors.textGrey
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20,),
                                      Text(
                                        'Augmented Reality Trends for 2022',
                                        style: TextStyle(
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          overflow: TextOverflow.ellipsis
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: 6,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
