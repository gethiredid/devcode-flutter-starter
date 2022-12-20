# Devcode Starter using Flutter Level 1

## Hasil Akhir yang Diharapkan

Peserta dapat menampilkan Halaman Hello yang berisi Logo Devcode dan Teks `I'm ready for the next challenge!`.

## Setup Environment

1. Download source code lewat link yang telah disediakan dari halaman assesment
2. Extract source code yang sudah terdownload pada perangkat anda
3. Buka source code yang sudah diextract menggunakan Code Editor, contoh Visual Studio Code
4. Pastikan minimal flutter version yang terinstall adalah versi `3.0.3`
5. Untuk cara pengecekan versi bisa run `flutter doctor` pada terminal
6. Jika versi flutter yang terinstall masih dibawah `3.0.3` -> bisa run `flutter upgrade` pada terminal
7. Buka terminal dan masuk ke root project folder, lalu run `flutter pub get` pada terminal

## Instruksi Pengerjaan

1. Selesaikan challenge yang terdapat pada file `lib/routes/pages.dart`, `lib/modules/hello/hello_view.dart`
2. Build solusi dari challenge yang sudah dibuat menjadi APK, untuk langkah-langkahnya dapat dilihat [disini](#langkah-langkah-build-apk)
3. Submit APK hasil build ke Halaman Submission Devcode

## Teknologi yang Digunakan

1. [Flutter](https://flutter.dev/)
2. [GetX](https://pub.dev/packages/get)
3. [dartz](https://pub.dev/packages/dartz)

## Langkah-langkah Build apk

1. Buka file `lib/main.dart` lalu uncomment code pada method `main` sesuai arahan
2. Buka terminal lalu run `flutter build apk --debug`
3. Automation test untuk Flutter hanya bisa menggunakan debug version .apk
