import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quantum_innovation_flutter_assignment/contants.dart';
import 'package:quantum_innovation_flutter_assignment/model/NewsDataModel.dart';
import 'package:quantum_innovation_flutter_assignment/screens/signIn_signUp_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showSearchField = false;
  List<NewsDataModel> newsList = [];
  TextEditingController searchController = TextEditingController();
  String formatDate(AsyncSnapshot<NewsDataModel?> snapshot, int index) {
    var date =
        DateTime.parse(snapshot.data!.articles![index].publishedAt.toString());
    String formattedDate = "${date.day}-${date.month}-${date.year}";
    return formattedDate;
  }

  Future<NewsDataModel?> getNewsData() async {
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=apple&from=2023-01-31&to=2023-01-31&sortBy=popularity&apiKey=$apiKey"));
    var getData = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return NewsDataModel.fromJson(getData);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          titleSpacing: 0,
          actions: [
            showSearchField
                ? Container()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          FirebaseAuth.instance.signOut().then((value) => {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SignInSignUpScreen()))
                              });
                        },
                        child: Icon(
                          Icons.logout,
                          color: Color(0xff4d83af),
                        )),
                  )
          ],
          leading: GestureDetector(
            onTap: () {
              setState(() {
                showSearchField = true;
              });
            },
            child: const Icon(
              Icons.search,
              size: 40,
              color: Color(0xff4d83af),
              shadows: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 7,
                  spreadRadius: 3,
                  offset: Offset(-2, 2),
                )
              ],
            ),
          ),
          title: showSearchField
              ? searchField()
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      showSearchField = true;
                    });
                  },
                  child: const Text(
                    "Search in feed",
                    style: TextStyle(color: Color(0xff4d83af), fontSize: 25),
                  ),
                ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 8),
          child: Column(
            children: [
              Expanded(
                  child: FutureBuilder<NewsDataModel?>(
                future: getNewsData(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data?.articles?.length,
                    itemBuilder: (context, int index) {
                      String title =
                          snapshot.data!.articles![index].title.toString();
                      if (searchController.text.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 5, top: 5),
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    offset: Offset(-1, 1),
                                    blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                formatDate(snapshot, index),
                                                style: const TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                snapshot.data!.articles![index]
                                                    .source!.name
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              snapshot
                                                  .data!.articles![index].title
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Color(
                                                    0xff1968b3,
                                                  ),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              snapshot.data!.articles![index]
                                                  .description
                                                  .toString(),
                                              maxLines: 5,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: Color(
                                                  0xff1968b3,
                                                ),
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    child: Center(
                                      child: SizedBox(
                                        height: 70,
                                        width: 70,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.network(
                                            snapshot.data!.articles![index]
                                                .urlToImage
                                                .toString(),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      } else if (title
                          .toLowerCase()
                          .contains(searchController.text.toLowerCase())) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 5, top: 5),
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    offset: Offset(-1, 1),
                                    blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                formatDate(snapshot, index),
                                                style: const TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                snapshot.data!.articles![index]
                                                    .source!.name
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              snapshot
                                                  .data!.articles![index].title
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Color(
                                                    0xff1968b3,
                                                  ),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              snapshot.data!.articles![index]
                                                  .description
                                                  .toString(),
                                              maxLines: 5,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: Color(
                                                  0xff1968b3,
                                                ),
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    child: Center(
                                      child: SizedBox(
                                        height: 70,
                                        width: 70,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.network(
                                            snapshot.data!.articles![index]
                                                .urlToImage
                                                .toString(),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  );
                },
              ))
            ],
          ),
        ));
  }

  Widget searchField() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
            onChanged: (value) {
              setState(() {});
            },
            onSubmitted: (value) {
              setState(() {
                showSearchField = true;
              });
            },
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      showSearchField = false;
                    });
                  },
                  child: const Icon(Icons.send)),
              hintText: "Search News",
              border: const OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        )
      ],
    );
  }
}
