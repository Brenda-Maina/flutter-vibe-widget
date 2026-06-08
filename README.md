# Vibe Board Widget

A Flutter web widget where you type a short message, pick an emoji tag, and post it to a live feed. Built and run entirely in GitHub Codespaces.


## What it does

- Type a message (up to 80 characters)
- Pick an emoji tag from the row
- Hit Post and it shows up at the top of the feed
- The post count updates as you add more

## How to run

1. Open this repo in GitHub Codespaces
2. Install Flutter:
```
git clone https://github.com/flutter/flutter.git -b stable --depth 1 ~/flutter
echo export PATH="$HOME/flutter/bin:$PATH" >> ~/.bashrc && source ~/.bashrc
```
3. Navigate into the project and build:
```
cd vibe_widget
flutter build web && cd build/web && python3 -m http.server 8080
```
4. Open the Ports tab, find port 8080, and click the globe icon

## Built with

- Flutter 3.x
- Dart
- GitHub Codespaces
