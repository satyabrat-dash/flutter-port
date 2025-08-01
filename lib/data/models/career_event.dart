import 'package:flutter/material.dart';

@immutable
class CareerEvent {
  const CareerEvent({
    required this.year,
    required this.title,
    required this.description,
    required this.icon,
    this.college,
    this.location,
  });
  final int year;
  final String title;
  final String description;
  final IconData icon;
  final String? college;
  final String? location;

  static List<CareerEvent> get sampleEvents => [
    const CareerEvent(
      year: 2024,
      title: 'Learning & Development',
      description:
          'Started learning java and python from the very first to advance. the focus was on assisting and creating better applications.',
      icon: Icons.code,
      college: 'Siksha O Anusandhan.',
      location: 'Bhubaneswar, India',
    ),
    const CareerEvent(
      year: 2025,
      title: 'Flutter',
      description:
          'Actively involved in learning something new about frameworks.',
      icon: Icons.code,
      location: 'Bhubaneswar, India',
    ),
    const CareerEvent(
      year: 2025,
      title: 'Artificial Intelligence & Machine Learning',
      description:
          'Developing and growing never stops.I started learing about AI and ML, and how to integrate them into applications.',
      icon: Icons.code,
      college: 'Siksha O Anusandhan.',
      location: 'Bhubaneswar, India',
    ),
    CareerEvent(
      year: DateTime.now().year,
      title: 'Continuous Growth & Learning',
      description:
          "The journey never stops. exploring cutting-edge design patterns, and building innovative digital experiences. Always learning, always growing, always pushing the boundaries of what's possible.",
      icon: Icons.auto_awesome,
    ),
  ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CareerEvent &&
          runtimeType == other.runtimeType &&
          year == other.year &&
          title == other.title &&
          description == other.description &&
          icon == other.icon &&
          college == other.college &&
          location == other.location;

  @override
  int get hashCode =>
      year.hashCode ^ title.hashCode ^ description.hashCode ^ icon.hashCode ^ college.hashCode ^ location.hashCode;

  @override
  String toString() => 'CareerEvent(year: $year, title: $title, college: $college)';
}
