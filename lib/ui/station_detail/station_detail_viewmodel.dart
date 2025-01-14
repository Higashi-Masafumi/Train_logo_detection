import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:train_logo_detection_app/domain/models/train_route/train_route_info.dart';

/// RiverpodのStateNotifierProvider (familyで Station と TrainLine を受け取る想定)
final stationDetailViewModelProvider = StateNotifierProvider.family<
    StationDetailViewModel,
    AsyncValue<void>,
    (Station, TrainLine)>((ref, params) {
  return StationDetailViewModel(params.$1, params.$2);
});

class StationDetailViewModel extends StateNotifier<AsyncValue<void>> {
  final Station station;
  final TrainLine line;

  StationDetailViewModel(this.station, this.line)
      : super(const AsyncValue.data(null));

  /// Google公式ドキュメントに従い、
  /// 1) comgooglemaps://? でGoogle Mapsアプリ (インストール済みの場合)
  /// 2) geo:スキーム (端末のデフォルト地図アプリ)
  /// 3) Web版 Google Maps (https://www.google.com/maps/search/?api=1&query=...)
  /// の順でフォールバックしていく例。
  Future<void> openMap() async {
    state = const AsyncValue.loading();
    try {
      final lat = station.latitude;
      final lng = station.longitude;
      final latLngStr = '$lat,$lng';

      // 駅名がnullの場合は空文字にする
      final stationName = station.stationTitle['ja'] ?? '';

      // --------------------------
      // Google公式: https://www.google.com/maps/search/?api=1&query=...
      // "クエリ検索" で "lat,lng 駅名" を指定すると、座標を基点に駅名の検索も行われる
      // --------------------------
      final webMapsUri = Uri.https(
        'www.google.com',
        '/maps/search/',
        {
          'api': '1',
          // "35.68,139.76 東京駅" といったクエリ文字列
          'query': latLngStr,
        },
      );

      // --------------------------
      // Google Mapsアプリ (comgooglemaps://)
      //   ドキュメント上の例: comgooglemaps://?q=Pizza
      //   参考: https://developers.google.com/maps/documentation/urls/ios-url-schema
      // --------------------------
      // q=パラメータに "35.68,139.76 (東京駅)" のような文字列を渡して検索
      // &zoom=18 などでズームレベル指定可能
      final googleMapsAppUri = Uri.parse(
        'comgooglemaps://?q=${Uri.encodeComponent(latLngStr)}',
      );

      // --------------------------
      // geoスキーム
      //  geo:lat,lng?q=駅名
      //  AndroidであればGoogle Maps、iOSならApple Mapsなど
      // --------------------------
      final geoUri = Uri.parse(
        'geo:$latLngStr?q=${Uri.encodeComponent(stationName)}',
      );

      // デバッグ用に出力
      debugPrint('googleMapsAppUri: $googleMapsAppUri');
      debugPrint('geoUri:           $geoUri');
      debugPrint('webMapsUri:       $webMapsUri');

      // 優先度1: Google Mapsアプリ (comgooglemaps://)
      if (await canLaunchUrl(googleMapsAppUri)) {
        await launchUrl(googleMapsAppUri, mode: LaunchMode.externalApplication);
        state = const AsyncValue.data(null);
        debugPrint('Google Mapsアプリを開きました');
        return;
      }

      // 優先度2: geo:スキーム (他の地図アプリ含む)
      if (await canLaunchUrl(geoUri)) {
        await launchUrl(geoUri, mode: LaunchMode.externalApplication);
        state = const AsyncValue.data(null);
        debugPrint('geo:スキームを開きました');
        return;
      }

      // 優先度3: Web版 Google Maps
      if (await canLaunchUrl(webMapsUri)) {
        await launchUrl(webMapsUri, mode: LaunchMode.externalApplication);
        state = const AsyncValue.data(null);
        debugPrint('Web版 Google Mapsを開きました');
        return;
      }

      // どれも失敗した場合
      state = AsyncValue.error('地図を開けませんでした', StackTrace.current);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
