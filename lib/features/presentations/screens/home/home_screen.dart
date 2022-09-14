import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 23,
                    height: 3.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 12,
                    height: 3.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        title: const Text('GoodFood'),
        actions: [
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () {},
            child: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 80,
            width: 1.sw,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    offset: const Offset(1.5, 1.5),
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      // controller: searchProvider.searchControl,
                      onTap: () {
                        // FocusScope.of(context).requestFocus(
                        //   searchProvider.focusNode,
                        // );
                      },
                      // onChanged: searchProvider.searchOperation,
                      // onEditingComplete: () {
                      //   searchProvider.isSearch = false;
                      //   FocusScope.of(context).unfocus();
                      // },
                      style: TextStyle(
                        fontSize: 14.0.sp,
                        color: Colors.black,
                      ),
                      keyboardType: TextInputType.text,
                      // focusNode: searchProvider.focusNode,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        hintText: "Cari berdasarkan nama jamaah",
                        hintStyle: const TextStyle(
                          color: Color(0xffc4c4c4),
                          fontSize: 14,
                          fontFamily: 'Comfortaa',
                        ),
                      ),
                      maxLines: 1,
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                  // IconButton(
                  //   icon: searchProvider.iconSearch,
                  //   onPressed: () {
                  //     if (searchProvider.isSearch) {
                  //       searchProvider.searchResult.clear();
                  //       searchProvider.searchControl.clear();
                  //       searchProvider.isSearch = false;
                  //       FocusScope.of(context).unfocus();
                  //     } else {
                  //       searchProvider.isSearch = true;
                  //       FocusScope.of(context).requestFocus(
                  //         searchProvider.focusNode,
                  //       );
                  //     }
                  //   },
                  // ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Navigator.of(context).pushNamed('food-detail');
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 90,
                          width: 88,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              placeholder:
                                  'assets/images/placeholder_content.png',
                              image:
                                  'https://www.themealdb.com/images/media/meals/58oia61564916529.jpg',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Nama Makanan',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Price',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 15.sp,
                                  color: Colors.grey[700],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Wrap(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(.3),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Text('Side'),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(.3),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Text('Turkish'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
