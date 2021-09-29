import 'package:album/enum/view_state.dart';
import 'package:album/model/album/album.dart';
import 'package:album/repository/albums_repository.dart';

import 'base_vm.dart';

class AlbumListVM extends BaseVM {
  late AlbumsRepository _repository;

  AlbumListVM(AlbumsRepository repository) {
    _repository = repository;
  }

  Artist? artist;

  Future fetchAllAlbums() async {
    setState(ViewState.busy);
    artist = await _repository.fetchAllAlbums();
    setState(ViewState.idle);
  }
}
