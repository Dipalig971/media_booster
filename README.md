# Music Player

### 1. Set Up Your Flutter Environment
If you haven't already, set up Flutter on your machine:

- Download and install Flutter from [flutter.dev](https://flutter.dev/docs/get-started/install).
- Ensure you have an editor like Visual Studio Code or Android Studio set up with Flutter and Dart plugins.

### 2. Create a New Flutter Project
Open your terminal or command prompt and run:

```bash
flutter create audio_app
cd audio_app
```
### 3. Add Necessary Dependencies
You will need a package to handle audio playback. One of the most popular packages for this purpose is `assets_audio_player`. Add it to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  provider: ^6.1.2
  assets_audio_player: ^3.1.1
```

Run `flutter pub get` to install the new dependencies.

### 4. Implementing the User Interface

Open the `lib/main.dart` file and set up a basic UI. For simplicity, we will create a single screen with play, pause, and stop buttons

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AudioProvider(),
      child: MaterialApp(
        title: 'Audio App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AudioPlayerScreen(),
      ),
    );
  }
}

class AudioPlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Audio App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => audioProvider.play(),
              child: Text('Play'),
            ),
            ElevatedButton(
              onPressed: () => audioProvider.pause(),
              child: Text('Pause'),
            ),
            ElevatedButton(
              onPressed: () => audioProvider.stop(),
              child: Text('Stop'),
            ),
          ],
        ),
      ),
    );
  }
}

class AudioProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void play() async {
    try {
      await _audioPlayer.setUrl('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3');
      _audioPlayer.play();
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  void pause() {
    _audioPlayer.pause();
  }

  void stop() {
    _audioPlayer.stop();
  }
}
```

### Example for Adding a Playlist

You can enhance the `AudioProvider` to manage a playlist:

```dart
class AudioProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<String> _playlist = [
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
  ];
  int _currentIndex = 0;

  void play() async {
    try {
      await _audioPlayer.setUrl(_playlist[_currentIndex]);
      _audioPlayer.play();
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  void pause() {
    _audioPlayer.pause();
  }

  void stop() {
    _audioPlayer.stop();
  }

  void next() {
    if (_currentIndex < _playlist.length - 1) {
      _currentIndex++;
      play();
    }
  }

  void previous() {
    if (_currentIndex > 0) {
      _currentIndex--;
      play();
    }
  }
}
```

Update the `AudioPlayerScreen` to include buttons for next and previous:

```dart
ElevatedButton(
  onPressed: () => audioProvider.previous(),
  child: Text('Previous'),
),
ElevatedButton(
  onPressed: () => audioProvider.next(),
  child: Text('Next'),
),
```


   <p align='center'>
  <img src='https://github.com/Dipalig971/media_booster/assets/143181151/f9182e7e-6ae5-412a-ac41-15f3c1dfb175' width=240>
  <img src='https://github.com/Dipalig971/media_booster/assets/143181151/36df2cfe-6bc7-4fd5-8759-0cfdb358a2b3' width=240>
      <img src='https://github.com/Dipalig971/media_booster/assets/143181151/cf6b84b4-83ee-4314-bd43-e2f355f0c7f7' width=240>
  <img src='https://github.com/Dipalig971/media_booster/assets/143181151/bbd8ca8e-37d1-4d25-810d-fd2c5ce52234' width=240>
</p>
 <h2>📽️Video</h2>
  <p>
    <table align="center">
  <tr>
    <video src ="https://github.com/Dipalig971/media_booster/assets/143181151/d8505c94-926e-4149-b931-7275aac85db1"></video> </h1>
  </tr>
    </table>   
  </p>
