# Blog Explorer

## Introduction

Blog Explorer is a Flutter application that fetches and displays a list of blogs from a RESTful API. Users can mark blogs as favorites and view blog details. The app also supports offline mode using Hive for local storage.

## Features

- Fetch and display a list of blogs with titles and images.
- Navigate to a detailed view of a selected blog.
- Mark blogs as favorites.
- Offline support using Hive.

## Requirements

- Flutter SDK
- Android/iOS emulator or physical device

## Setup

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/blog_explorer.git
    ```

2. Navigate to the project directory:
    ```sh
    cd blog_explorer
    ```

3. Install dependencies:
    ```sh
    flutter pub get
    ```

4. Generate Hive adapters:
    ```sh
    flutter packages pub run build_runner build
    ```

5. Run the app:
    ```sh
    flutter run
    ```

## License

This project is licensed under the MIT License.
