class MySchedule {
  final List<Map<String, dynamic>> monday = [
    {
      'start': '3:00 PM',
      'end': '5:00 PM',
      'subject': 'Network Technology 1',
      'room': 'ROOM - 705',
    },
    {
      'start': '5:00 PM',
      'end': '7:00 PM',
      'subject': 'Platform Tech',
      'room': 'ROOM - 705',
    },
    {
      'start': '7:00 PM',
      'end': '8:30 PM',
      'subject': 'Euthenics 2',
      'room': 'ROOM - 201',
    }
  ];

  final List<Map<String, dynamic>> tuesday = [
    {
      'start': '4:00 PM',
      'end': '7:00 PM',
      'subject': 'Network Technology 1',
      'room': 'ROOM - 413',
    },
    {
      'start': '7:00 PM',
      'end': '8:30 PM',
      'subject': 'Platform Tech',
      'room': 'ROOM - 212',
    }
  ];

  final List<Map<String, dynamic>> wednesday = [
    {
      'start': '4:30 PM',
      'end': '5:30 PM',
      'subject': 'Technopreneurship',
      'room': 'ROOM - 506',
    },
    {
      'start': '5:30 PM',
      'end': '7:00 PM',
      'subject': 'Systems Tech',
      'room': 'ROOM - 506',
    },
    {
      'start': '7:00 PM',
      'end': '8:30 PM',
      'subject': 'Software Quality Assurance',
      'room': 'ROOM - 506',
    },
  ];

  final List<Map<String, dynamic>> thursday = [
    {
      'start': '10:00 AM',
      'end': '1:00 PM',
      'subject': 'CS Thesis 2',
      'room': 'ROOM - 509',
    },
    {
      'start': '3:00 PM',
      'end': '5:00 PM',
      'subject': 'CS Thesis 2',
      'room': 'ROOM - 705',
    },
    {
      'start': '5:00 PM',
      'end': '7:00 PM',
      'subject': 'Info Assurance',
      'room': 'ROOM - 705',
    },
  ];

  final List<Map<String, dynamic>> friday = [
    {
      'start': '4:00 PM',
      'end': '7:00 PM',
      'subject': 'Info Assurance',
      'room': 'ROOM - 413',
    },
    {
      'start': '7:00 PM',
      'end': '8:30 PM',
      'subject': 'Platform Tech',
      'room': 'ROOM - 212',
    },
  ];

  final List<Map<String, dynamic>> saturday = [
    {
      'start': '4:00 PM',
      'end': '5:30 PM',
      'subject': 'Systems Tech',
      'room': 'ROOM - 506',
    },
    {
      'start': '5:30 PM',
      'end': '7:00 PM',
      'subject': 'Systems Tech',
      'room': 'ROOM - 506',
    },
    {
      'start': '7:00 PM',
      'end': '8:30 PM',
      'subject': 'Software Quality Assurance',
      'room': 'ROOM - 506',
    },
  ];

  final List<Map<String, dynamic>> sunday = [
    {
      'start': '12:00 AM',
      'end': '12:00 AM',
      'subject': 'Mag pahinga kanaman masyado kana masipag haha',
      'room': 'BAHAY',
    },
  ];

  List<Map<String, dynamic>> getAllSchedules() {
    List<Map<String, dynamic>> allSchedules = [];

    allSchedules.addAll(monday);
    allSchedules.addAll(tuesday);
    allSchedules.addAll(wednesday);
    allSchedules.addAll(thursday);
    allSchedules.addAll(friday);
    allSchedules.addAll(saturday);
    allSchedules.addAll(sunday);

    return allSchedules;
  }
}
