import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:train_logo_detection_app/domain/models/train_route/train_route_info.dart';
import 'package:train_logo_detection_app/domain/models/train_timetable/train_timetable.dart';
import 'package:train_logo_detection_app/providers/repositories.dart';

/// RiverpodのStateNotifierProvider (familyで Station と TrainLine を受け取る想定)
final stationDetailViewModelProvider = StateNotifierProvider.family<
    StationDetailViewModel,
    AsyncValue<void>,
    (Station, TrainLine)>((ref, params) {
  return StationDetailViewModel(ref, params.$1, params.$2);
});

class StationDetailViewModel extends StateNotifier<AsyncValue<void>> {
  final Station station;
  final TrainLine line;
  final Ref ref;

  StationDetailViewModel(this.ref, this.station, this.line)
      : super(const AsyncValue.data(null));

  Future<void> openMap({required MapApp mapApp}) async {
    state = const AsyncValue.loading();
    try {
      final lat = station.latitude;
      final lng = station.longitude;
      final latLngStr = '$lat,$lng';
      final stationName = station.stationTitle['ja'] ?? '';

      Uri? uri;
      switch (mapApp) {
        case MapApp.google:
          uri = Uri.parse(
            'comgooglemaps://?q=${Uri.encodeComponent(latLngStr)}',
          );
          break;
        case MapApp.apple:
          uri = Uri.parse(
            'maps://?q=${Uri.encodeComponent(stationName)}&ll=$latLngStr',
          );
          break;
        case MapApp.web:
          uri = Uri.https(
            'www.google.com',
            '/maps/search/',
            {
              'api': '1',
              'query': latLngStr,
            },
          );
          break;
      }

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        state = const AsyncValue.data(null);
        debugPrint('${mapApp.name}で地図を開きました');
      } else {
        state = AsyncValue.error(
          switch (mapApp) {
            MapApp.google => 'Google Mapsアプリがインストールされていません',
            MapApp.apple => 'Apple Mapsを開けませんでした',
            MapApp.web => 'ブラウザで地図を開けませんでした',
          },
          StackTrace.current,
        );
      }
    } catch (e, stack) {
      state = AsyncValue.error('地図アプリを開けませんでした', stack);
    }
  }

  // 時刻表情報
  Map<Station, StationTimetable> _stationTimetable = {};

  Map<Station, StationTimetable> get stationTimetable => _stationTimetable;

  Future<Map<Station, StationTimetable>> fetchStationTimetable() async {
    final useCase = ref.read(getStationTimetableUseCaseProvider);
    final timetables = await useCase.execute(station);
    _stationTimetable = timetables;
    return timetables;
  }
}

enum MapApp {
  google('Google Maps'),
  apple('Apple Maps'),
  web('ブラウザで開く(Google Maps)');

  final String label;
  const MapApp(this.label);
}
