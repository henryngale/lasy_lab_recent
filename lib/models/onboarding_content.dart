class UnbordingContent {
  String image;
  String title;
  String description;

  UnbordingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Bienvenue sur\nlasylab !',
      image: 'assets/svg/playing.svg',
      description:
          "La nouvelle solution pour\nréviser tous tes cours tous les jours."),
  UnbordingContent(
      title: 'Apprendre',
      image: 'assets/svg/sit_reading.svg',
      description:
          "Progressez dans l'apprentissage grâce\naux activités et Quiz\ntout en vous amusant."),
  UnbordingContent(
      title: 'Réviser',
      image: 'assets/svg/challenge.svg',
      description: "Faites désormais partie de ceux \nqui ont tout compris."),
  UnbordingContent(
      title: 'Se divertir',
      image: 'assets/svg/playing.svg',
      description: "Tout le sérieux des études \n dans une ambiance ludique."),
];
