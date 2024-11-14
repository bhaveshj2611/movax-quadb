# MOVAX - Modern TV Shows Explorer

## Overview

MOVAX is a sophisticated Flutter application that provides users with a seamless experience to explore and discover TV shows. Built with modern architecture and best practices, it leverages the TVMaze API to deliver comprehensive information about television shows.

## Screenshots
  <img width="196" alt="{6C0FC2AC-387B-4DAA-866A-A5FA58BE1A5E}" src="https://github.com/user-attachments/assets/96ce8a55-fc9e-410a-b4a2-2d1e2bc77aab">
  <img width="193" alt="{88699458-6686-4938-ACA4-CBD5F37586B6}" src="https://github.com/user-attachments/assets/0af3bc6b-859e-4b3e-ba68-e7e9d8d06e32">
  <img width="194" alt="{DBCDACC0-EA4A-44A4-B1BF-50429B942180}" src="https://github.com/user-attachments/assets/be81011d-36dd-4c0d-80b8-30e0d20c6868">
  <img width="199" alt="{DB593B23-360C-432E-ACF9-3A7E39CBC90B}" src="https://github.com/user-attachments/assets/874274eb-a76e-40c1-8d8e-96fef4be7dc8">

## 🎯 Key Features
- Utilized MVC Architecture
- Integration with TVMaze API for up-to-date show information
- Implemented 500ms debounce for efficient API calls
- Featured shows showcase using CarouselSlider
- Smooth scrolling lists for show recommendations
- Comprehensive details including ratings, schedules, and metadata
- Graceful handling of missing images

### Architecture
```
lib/
├── controller/
│ └── movie_controller.dart
├── model/
│ └── movie_model.dart
├── utils/
│ ├── api_service.dart
│ ├── api_error_handler.dart
│ └── app_color.dart
├── view/
│ ├── home_view.dart
│ ├── search_view.dart
│ ├── detail_view.dart
│ ├── navbar.dart
│ └── splash_view.dart
└── routes/
├── custom_route.dart
└── route_name.dart
```

### Dependencies
- **provider**: ^6.1.2 (State Management)
- **http**: ^1.2.2 (API Integration)
- **carousel_slider**: ^5.0.0 (UI Components)
- **url_launcher**: ^6.3.1 (External Links)



  
