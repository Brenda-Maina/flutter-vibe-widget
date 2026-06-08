# Vibe Board Widget

A Flutter web widget where you type a short message, pick an emoji tag, and post it to a live feed. Built and run entirely in GitHub Codespaces.

---

## What it does

* Type a message (up to 80 characters)
* Pick an emoji tag from the row
* Hit Post and it shows up at the top of the feed
* The post count updates as you add more

---

## How to run

1. Open this repo in GitHub Codespaces

2. Install Flutter:

```bash
git clone https://github.com/flutter/flutter.git -b stable --depth 1 ~/flutter
echo 'export PATH="$HOME/flutter/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

3. Navigate into the project and build:

```bash
cd vibe_widget
flutter build web
cd build/web
python3 -m http.server 8080
```

4. Open the Ports tab, find port 8080, and click the globe icon.

---

## Widget: TextField

The core input widget used in this app. Found in `main.dart` starting at line 122.

---

## Attribute 1 — maxLength (line 124)

```dart
maxLength: 80,
```

**Default value:** `null` (no limit)

**What it changes on screen:** Caps the input at 80 characters and automatically renders a character counter below the field showing **"0 / 80"**. When the user hits 80, the field stops accepting input.

**Why a developer would adjust it:** To enforce a character limit on posts, usernames, or messages. Setting it to `null` removes the counter and allows unlimited input.

---

## Attribute 2 — hintText (line 127)

```dart
hintText: "What is your vibe right now?",
```

**Default value:** `null` (nothing shown)

**What it changes on screen:** Shows placeholder text inside the field when it is empty. Disappears the moment the user starts typing.

**Why a developer would adjust it:** To guide the user on what to type. Without it, the field is a blank box with no instruction. Every input field in a real app should have a `hintText` so the user always knows what is expected.

---

## Attribute 3 — onSubmitted (line 133)

```dart
onSubmitted: (_) => _submitPost(),
```

**Default value:** `null` (pressing Enter does nothing)

**What it changes on screen:** Pressing Enter on the keyboard triggers the same post action as tapping the **Post** button. The message appears at the top of the feed instantly.

**Why a developer would adjust it:** To support keyboard users on web and desktop. Without this line, pressing Enter does nothing and the user has to click the button every time, which feels broken.

---

## Screenshot

Vibe Board Screenshot is found at - (screenshot.png)

---

## Built with

* Flutter 3.x
* Dart
* GitHub Codespaces
