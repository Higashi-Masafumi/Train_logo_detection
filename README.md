# train_logo_detection_app（メトロファインダー）

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


### 注意点

- このリポジトリの物体検出機能はflutter_yoloのパッケージに依存しています
- しかし、一部の機能でパッケージを変更して使用しているので、パッケージをそのままダウンロードするだけでは、アプリは動作しません。

### アプリの機能

#### アプリ概要

東京の地下鉄のロゴを物体検出モデルで検出して、その路線情報を表示するモバイルアプリです。

#### アプリの機能

- 地下鉄のロゴを物体検出モデルで検出して、その路線名を表示する
- 検出された路線の詳細をクリックすると、まずその路線の運行情報と路線図と路線図内に現在地に近い駅があればハイライトする（また、各駅の乗り換え路線を表示する）
- 路線図の駅をクリックすると、その駅の位置を地図アプリで確認したり、乗り換え路線を具体的に確認したり、その駅の直近の列車の時刻表情報を確認することができる