import 'package:album/enum/view_state.dart';
import 'package:album/repository/albums_repository.dart';
import 'package:album/view-model/album_list_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AlbumsRepository albumsRepository = Provider.of<AlbumsRepository>(context);
    final vm = AlbumListVM(albumsRepository);
    return BaseView<AlbumListVM>(
      vm: vm,
      onModelReady: (vm) => vm.fetchAllAlbums(),
      builder: (BuildContext context, AlbumListVM vm, Widget? child) =>
          Scaffold(
        body: vm.state == ViewState.busy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Welcome',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Here are all your posts',                      
                    ),
                  ),                                    
                ],
              ),
      ),
    );
  }
}
