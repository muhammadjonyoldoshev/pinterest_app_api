import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:printerest_app/models/user_s_collections_model.dart';
import 'package:printerest_app/models/user_s_liked_photos.dart';
import 'package:printerest_app/models/user_s_pohotos_model.dart';
import 'package:printerest_app/models/link_model.dart';
import 'package:printerest_app/models/photo_statictics_model.dart';
import 'package:printerest_app/models/seach_collections_result_model.dart';
import 'package:printerest_app/models/search_photos_result_model.dart';
import 'package:printerest_app/models/search_user_result_model.dart';
import 'package:printerest_app/models/single_photo_model.dart';
import 'package:printerest_app/models/user_s_statistics.dart';
import 'package:printerest_app/models/users_public_profile_model.dart';
import 'dart:developer' as dev;
import 'package:printerest_app/services/network_service.dart';

void main() {
  group('current users', () {
    test('get user profile', () async {
      //todo
    });

    test('update user profile', () async {
      //todo
    });
  });

  group('All Users', () {
    test('get users public profile', () async {
      String? response = await NetworkService.GET(
        api: NetworkService.API_GET_USER_PROFILE('Muhammadjon'),
        params: NetworkService.paramToGetUsersProfile('Muhammadjon'),
      );
      if (response != null) {
        UsersPublicProfileModel usersPublicProfileModel =
            UsersPublicProfileModel.fromJson(jsonDecode(response));
        print(usersPublicProfileModel);
      }
    });

    test('get users portfolio link', () async {
      String? response = await NetworkService.GET(
        api: NetworkService.API_TO_GET_USER_PORFOLIO_LINK('muhammadjon'),
        params: NetworkService.paramToGetUsersProfile('muhammadjon'),
      );
      print(response);
      if (response != null) {
        LinkModel link = LinkModel.fromJson(jsonDecode(response));
        print("shenanigans$link");
      }
    });

    test('get user\'s photos]', () async {
      String? response = await NetworkService.GET(
        api: NetworkService.API_GET_USER_S('muhammadjon', "photos"),
        params: NetworkService.paramToGetUserSPhotos(stats: true),
      );
      if (response != null) {
        List a = jsonDecode(response);
        List<UserSPhotosModel> userS =
            a.map((e) => UserSPhotosModel.fromJson(e)).toList();
        print(userS);
      }
    });

    test('list a user\'s liked photos]', () async {
      String? response = await NetworkService.GET(
        api: NetworkService.API_GET_USER_S('muhammadjon', 'likes'),
        params: NetworkService.paramToGetUserSLikedPhotos(),
      );
      if (response != null) {
        List a = jsonDecode(response);
        List<UserSLikedPhotos> userS =
            a.map((e) => UserSLikedPhotos.fromJson(e)).toList();
        print(userS);
      }
    });

    test('list a user\'s collections', () async {
      String? response = await NetworkService.GET(
        api: NetworkService.API_GET_USER_S('muhammadjon', 'collections'),
        params: NetworkService.paramToGetUserSCollections(),
      );
      if (response != null) {
        List a = jsonDecode(response);
        List<UserSCollectionsModel> userSCollections = a.map((e) => UserSCollectionsModel.fromJson(e)).toList();
        print(userSCollections);
      }
      expect(response, isNotNull);
    });


    test('list a user\'s liked photos', () async {
      String? response = await NetworkService.GET(
        api: NetworkService.API_GET_USER_S('muhammadjon', 'statistics'),
        params: NetworkService.paramToGetUserSStatistics(),
      );
      print("Karnataka$response");
      if (response != null) {
        Map json = jsonDecode(response);
        UserSStatistics userS = UserSStatistics.fromJson(json);
        print(userS);
      }
      expect(response, isNotNull);
    });
  });

  group("All Photos", () {
    test('get all photos', () async {
      String? response = await NetworkService.GET(
          api: NetworkService.API_GET_ALL_IMAGES, params: {"page": '1'});
      if (response != null) {
        List res = jsonDecode(response);
        List<SinglePhotoModel> list =
            res.map((json) => SinglePhotoModel.fromJson(json)).toList();
        print(list);
      }
    });

    test('get a photo', () async {
      String? response = await NetworkService.GET(
          api: NetworkService.API_GET_ALL_IMAGES,
        params: NetworkService.paramToGetImages(page: 1),
          );
      if (response != null) {
        List res = jsonDecode(response);
        List<SinglePhotoModel> list =
            res.map((json) => SinglePhotoModel.fromJson(json)).toList();
        print("Yamagata${list.length}");
        print(list);
      }
    });

    test('get a random photo', () async {
      String? response =
          await NetworkService.GET(api: NetworkService.API_GET_A_RANDOM_PHOTO);
      if (response != null) {
        SinglePhotoModel photo =
            SinglePhotoModel.fromJson(jsonDecode(response));
        print("Yamagata$photo");
      }
    });

    test('get a photo statistics', () async {
      String? response = await NetworkService.GET(
          api: NetworkService.API_GET_A_PHOTO('m9_Hk36qomk', "statistics"));
      if (response != null) {
        PhotoStatistics photo = PhotoStatistics.fromJson(jsonDecode(response));
        print("Yamagata$photo");
      }
    });

    test('download photo', () async {
      String? response = await NetworkService.GET(
          api: NetworkService.API_GET_A_PHOTO('m9_Hk36qomk', "download"));
      if (response != null) {
        LinkModel photo = LinkModel.fromJson(jsonDecode(response));
        print("Yamagata$photo");
      }
    });

    test('update photo', () async {
      //todo
    });

    test('like photo', () async {
      //todo
    });

    test('unlike photo', () async {
      //todo
    });
  });

  group('Search', () {
    test('search photos', () async {
      String? response = await NetworkService.GET(
        api: NetworkService.API_TO_SEARCH('/photos'),
        params: NetworkService.paramToSearchPhoto(query: 'office', perPage: 1),
      );
      if (response != null) {
        Map json = jsonDecode(response);
        SearchResultModel searchResultModel = SearchResultModel.fromJson(json);
        print(searchResultModel.results);
      }
    });

    test('search collections', () async {
      String? response = await NetworkService.GET(
        api: NetworkService.API_TO_SEARCH('/collections'),
        params: NetworkService.paramToSearchCollectionOrUsers(
            query: 'muhammadjon', perPage: 1),
      );
      if (response != null) {
        Map json = jsonDecode(response);
        SearchCollectionsResultModel searchResultModel =
            SearchCollectionsResultModel.fromJson(json);
        print(searchResultModel.results);
      }
    });
    test('search users', () async {
      String? response = await NetworkService.GET(
        api: NetworkService.API_TO_SEARCH('/users'),
        params: NetworkService.paramToSearchCollectionOrUsers(
            query: 'muhammadjon', perPage: 1),
      );
      if (response != null) {
        Map json = jsonDecode(response);
        SearchUserResultModel searchUserResultModel =
            SearchUserResultModel.fromJson(json);
        print(searchUserResultModel.results);
      }
    });
  });

  group('Sections', () {
    test('list collections', () async {

    });
  });
}
