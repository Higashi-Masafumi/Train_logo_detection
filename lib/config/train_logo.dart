enum TrainLineLabel {
  asakusa('asakusa'),
  chiyoda('chiyoda'),
  fukutoshin('fukutoshin'),
  ginza('ginza'),
  hanzoumon('hanzoumon'),
  hibiya('hibiya'),
  marunouchi('marunouchi'),
  mita('mita'),
  nannboku('nannboku'),
  ooedo('ooedo'),
  shinjyuku('shinjyuku'),
  touzai('touzai'),
  yurakuchyo('yurakuchyo');

  final String value;
  const TrainLineLabel(this.value);

  @override
  String toString() => value;

  static TrainLineLabel fromString(String value) {
    switch (value) {
      case 'asakusa':
        return TrainLineLabel.asakusa;
      case 'chiyoda':
        return TrainLineLabel.chiyoda;
      case 'fukutoshin':
        return TrainLineLabel.fukutoshin;
      case 'ginza':
        return TrainLineLabel.ginza;
      case 'hanzoumon':
        return TrainLineLabel.hanzoumon;
      case 'hibiya':
        return TrainLineLabel.hibiya;
      case 'marunouchi':
        return TrainLineLabel.marunouchi;
      case 'mita':
        return TrainLineLabel.mita;
      case 'nannboku':
        return TrainLineLabel.nannboku;
      case 'ooedo':
        return TrainLineLabel.ooedo;
      case 'shinjyuku':
        return TrainLineLabel.shinjyuku;
      case 'touzai':
        return TrainLineLabel.touzai;
      case 'yurakuchyo':
        return TrainLineLabel.yurakuchyo;
      default:
        throw Exception('Unknown TrainLineLabel value: $value');
    }
  }
}

class TrainLineLabelMapper {
  // マッピングデータ
  static const Map<TrainLineLabel, String> _logoText = {
    TrainLineLabel.asakusa: 'A',
    TrainLineLabel.chiyoda: 'C',
    TrainLineLabel.fukutoshin: 'F',
    TrainLineLabel.ginza: 'G',
    TrainLineLabel.hanzoumon: 'Z',
    TrainLineLabel.hibiya: 'H',
    TrainLineLabel.marunouchi: 'M',
    TrainLineLabel.mita: 'I',
    TrainLineLabel.nannboku: 'N',
    TrainLineLabel.ooedo: 'E',
    TrainLineLabel.shinjyuku: 'S',
    TrainLineLabel.touzai: 'T',
    TrainLineLabel.yurakuchyo: 'Y',
  };

  static const Map<TrainLineLabel, String> _lineNameEnglish = {
    TrainLineLabel.asakusa: 'Asakusa Line',
    TrainLineLabel.chiyoda: 'Chiyoda Line',
    TrainLineLabel.fukutoshin: 'Fukutoshin Line',
    TrainLineLabel.ginza: 'Ginza Line',
    TrainLineLabel.hanzoumon: 'Hanzoumon Line',
    TrainLineLabel.hibiya: 'Hibiya Line',
    TrainLineLabel.marunouchi: 'Marunouchi Line',
    TrainLineLabel.mita: 'Mita Line',
    TrainLineLabel.nannboku: 'Nannboku Line',
    TrainLineLabel.ooedo: 'Ooedo Line',
    TrainLineLabel.shinjyuku: 'Shinjyuku Line',
    TrainLineLabel.touzai: 'Touzai Line',
    TrainLineLabel.yurakuchyo: 'Yurakuchyo Line',
  };

  static const Map<TrainLineLabel, String> _lineNameJapanese = {
    TrainLineLabel.asakusa: '浅草線',
    TrainLineLabel.chiyoda: '千代田線',
    TrainLineLabel.fukutoshin: '副都心線',
    TrainLineLabel.ginza: '銀座線',
    TrainLineLabel.hanzoumon: '半蔵門線',
    TrainLineLabel.hibiya: '日比谷線',
    TrainLineLabel.marunouchi: '丸ノ内線',
    TrainLineLabel.mita: '三田線',
    TrainLineLabel.nannboku: '南北線',
    TrainLineLabel.ooedo: '大江戸線',
    TrainLineLabel.shinjyuku: '新宿線',
    TrainLineLabel.touzai: '東西線',
    TrainLineLabel.yurakuchyo: '有楽町線',
  };

  static const Map<TrainLineLabel, int> _lineId = {
    TrainLineLabel.asakusa: 10,
    TrainLineLabel.chiyoda: 5,
    TrainLineLabel.fukutoshin: 7,
    TrainLineLabel.ginza: 4,
    TrainLineLabel.hanzoumon: 8,
    TrainLineLabel.hibiya: 2,
    TrainLineLabel.marunouchi: 1,
    TrainLineLabel.mita: 11,
    TrainLineLabel.nannboku: 9,
    TrainLineLabel.ooedo: 13,
    TrainLineLabel.shinjyuku: 12,
    TrainLineLabel.touzai: 3,
    TrainLineLabel.yurakuchyo: 6,
  };

  // color code
  

  static int getLineId(TrainLineLabel line) => _lineId[line]!;
  static TrainLineLabel fromLineId(int id) =>
      _lineId.entries.firstWhere((element) => element.value == id).key;

  // 双方向マッピング用のリバースマップを生成
  static final Map<String, TrainLineLabel> _reverseLogoText =
      _logoText.map((key, value) => MapEntry(value, key));
  static final Map<String, TrainLineLabel> _reverseLineNameEnglish =
      _lineNameEnglish.map((key, value) => MapEntry(value, key));
  static final Map<String, TrainLineLabel> _reverseLineNameJapanese =
      _lineNameJapanese.map((key, value) => MapEntry(value, key));

  // マッピングを取得するメソッド
  static String getLogoText(TrainLineLabel line) => _logoText[line]!;
  static String getLineNameEnglish(TrainLineLabel line) =>
      _lineNameEnglish[line]!;
  static String getLineNameJapanese(TrainLineLabel line) =>
      _lineNameJapanese[line]!;

  static TrainLineLabel? fromLogoText(String logo) => _reverseLogoText[logo];
  static TrainLineLabel? fromLineNameEnglish(String name) =>
      _reverseLineNameEnglish[name];
  static TrainLineLabel? fromLineNameJapanese(String name) =>
      _reverseLineNameJapanese[name];
}
