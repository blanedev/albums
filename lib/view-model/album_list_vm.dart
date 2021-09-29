import 'package:album/enum/view_state.dart';
import 'package:album/repository/albums_repository.dart';

import 'base_vm.dart';

class AlbumListVM extends BaseVM {
  late AlbumsRepository _repository;

  AlbumListVM(AlbumsRepository repository) {
    _repository = repository;
  }

  late dynamic albums;

  Future fetchAllAlbums() async {
    setState(ViewState.busy);
    albums = await _repository.fetchAllAlbums();    
    setState(ViewState.idle);
  }
}
