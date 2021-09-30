import 'package:album/enum/view_state.dart';
import 'package:album/repository/albums_repository.dart';
import 'package:album/theme/color.dart';
import 'package:album/view-model/album_list_vm.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'base_view.dart';

// ignore: constant_identifier_names
const List song_type_1 = [
  "Artist",
];
// ignore: constant_identifier_names
const List song_type_2 = [
  "Album",
];

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int activeMenu1 = 0;
  int activeMenu2 = 2;
  @override
  Widget build(BuildContext context) {
    AlbumsRepository albumsRepository = Provider.of<AlbumsRepository>(context);
    final vm = AlbumListVM(albumsRepository);
    return BaseView<AlbumListVM>(
      vm: vm,
      onModelReady: (vm) => vm.fetchAllAlbums(),
      builder: (BuildContext context, AlbumListVM vm, Widget? child) {
        return Scaffold(
            backgroundColor: black,
            appBar: getAppBar(),
            body: vm.state == ViewState.busy
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : getBody(context, vm));
      },
    );
  }

  AppBar getAppBar() {
    return AppBar(
      backgroundColor: black,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "Explore",
              style: TextStyle(
                  fontSize: 20, color: white, fontWeight: FontWeight.bold),
            ),
            const Icon(Entypo.list)
          ],
        ),
      ),
    );
  }

  Widget getBody(BuildContext context, AlbumListVM vm) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Row(
                      children: List.generate(song_type_1.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            activeMenu1 = index;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              song_type_1[index],
                              style: TextStyle(
                                  fontSize: 15,
                                  color: activeMenu1 == index ? primary : grey,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            activeMenu1 == index
                                ? Container(
                                    width: 10,
                                    height: 3,
                                    decoration: BoxDecoration(
                                        color: primary,
                                        borderRadius: BorderRadius.circular(5)),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    );
                  })),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: List.generate(1, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(10)),
                                child: CachedNetworkImage(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      'https://cdns-images.dzcdn.net/images/artist/5ab2307c596f9814abcd223467c54fb2/500x500.jpg',
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                vm.artist!.artistName ?? '',
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: white,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  vm.artist!.primaryGenreName ?? '',
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: grey,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Row(
                      children: List.generate(song_type_2.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            activeMenu2 = index;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              song_type_2[index],
                              style: TextStyle(
                                  fontSize: 15,
                                  color: activeMenu2 == index ? primary : grey,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            activeMenu2 == index
                                ? Container(
                                    width: 10,
                                    height: 3,
                                    decoration: BoxDecoration(
                                        color: primary,
                                        borderRadius: BorderRadius.circular(5)),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    );
                  })),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(vm.artist!.lstAlbum!.length - 20,
                        (index) {
                      return Container(
                        width: 190,
                        padding: const EdgeInsets.only(right: 30),
                        child: GestureDetector(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 160,
                                height: 160,
                                decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(10)),
                                child: CachedNetworkImage(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                  imageUrl: vm.artist!.lstAlbum![index]
                                          .artworkUrl100 ??
                                      "",
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                vm.artist!.lstAlbum![index].collectionName ??
                                    '',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: white,
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                // ignore: unnecessary_string_interpolations
                                "Song ${vm.artist!.lstAlbum![index].releaseDate == null ? '' : DateFormat('yyyy/MM/dd').format(vm.artist!.lstAlbum![index].releaseDate!)}",
                                style: const TextStyle(
                                  fontSize: 9,
                                  color: white,
                                  fontWeight: FontWeight.w300,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$'
                                    "${vm.artist!.lstAlbum![index].collectionPrice ?? ''}",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: white,
                                      fontWeight: FontWeight.w600,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    maxLines: 1,
                                  ),
                                  SizedBox(
                                    width: 40,
                                    height: 30,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite_border_outlined,
                                        color: Colors.red,
                                        size: 17,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
