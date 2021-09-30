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

  List<Album> favoriteAlbums = [];

  Future fetchAllAlbums() async {
    setState(ViewState.busy);
    artist = await _repository.fetchAllAlbums();
    setState(ViewState.idle);
  }

  int getNumberOfFavoriteAlbums() {
    return favoriteAlbums.length;
  }

  bool checkFavoriteAlbum(Album album) {
    var idx =
        favoriteAlbums.indexWhere((e) => e.collectionId == album.collectionId);
    if (idx >= 0) {
      return true;
    }
    return false;
  }

  void addFavoriteAlbum(Album album) {
    favoriteAlbums.add(album);
  }

  void removeFavoriteAlbum(Album album) {
    var idx =
        favoriteAlbums.indexWhere((e) => e.collectionId == album.collectionId);
    if (idx >= 0) {
      favoriteAlbums.removeAt(idx);
    }
  }
}
