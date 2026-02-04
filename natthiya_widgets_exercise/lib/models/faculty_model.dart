class FacultyModel {
  final String name;
  final String thaiName;
  final String imageUrl;
  final String description;
  final String url;

  const FacultyModel({
    required this.name,
    required this.thaiName,
    required this.imageUrl,
    required this.description,
    required this.url,
  });

  static List<FacultyModel> getFaculties() {
    return [
      const FacultyModel(
        name: 'Engineering',
        thaiName: 'วิศวกรรมศาสตร์',
        imageUrl: 'assets/faculties/engineering.jpg',
        description: 'The Faculty of Engineering at Khon Kaen University is one of the leading engineering schools in Thailand, offering a wide range of undergraduate and graduate programs.',
        url: 'https://www.en.kku.ac.th/web/',
      ),
      const FacultyModel(
        name: 'Medicine',
        thaiName: 'แพทยศาสตร์',
        imageUrl: 'assets/faculties/medicine.jpg',
        description: 'The Faculty of Medicine provides high-quality medical education and research, and is home to Srinagarind Hospital, the largest university hospital in the region.',
        url: 'https://md.kku.ac.th/',
      ),
      const FacultyModel(
        name: 'Architecture',
        thaiName: 'สถาปัตยกรรมศาสตร์',
        imageUrl: 'assets/faculties/architecture.jpg',
        description: 'The Faculty of Architecture focuses on design, planning, and creative problem-solving, preparing students for careers in architecture and related fields.',
        url: 'https://arch.kku.ac.th/',
      ),
    ];
  }
}

