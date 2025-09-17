import 'package:eventify/model/event_model.dart';

final List<EventModel> dummyEvents = [
  // Workshops & Conferences
  EventModel(
    id: '1',
    title: 'Flutter Workshop',
    description:
        'Learn Flutter basics with hands-on coding session. Perfect for beginners looking to build their first mobile app. Includes live coding, Q&A, and project demos.',
    date: '2025-09-20',
    time: '10:00 AM',
    location: 'Expo Center, Karachi',
    imageUrl: 'assets/images/other_event_images/flutter_workshop.jpg',
  ),
  EventModel(
    id: '2',
    title: 'AI Conference',
    description:
        'Explore the future of AI with industry experts. Topics include machine learning, generative AI, and real-world business use cases. Network with professionals and startups.',
    date: '2025-09-25',
    time: '2:00 PM',
    location: 'Tech Park, Lahore',
    imageUrl: 'assets/images/other_event_images/conference.jpg',
  ),

  // Concert Events
  EventModel(
    id: '3',
    title: 'Coke Studio Live',
    description:
        'Experience the magic of Coke Studio with live performances. Enjoy a night of soulful melodies, fusion music, and unforgettable collaborations.',
    date: '2025-10-01',
    time: '7:00 PM',
    location: 'Arts Council, Karachi',
    imageUrl: 'assets/images/concert_images/concert1.jpg',
  ),
  EventModel(
    id: '4',
    title: 'Rock Night',
    description:
        'A night of rock music with top local bands. Expect loud guitars, heavy drums, and electrifying performances that will keep you on your feet all night long.',
    date: '2025-10-05',
    time: '8:30 PM',
    location: 'Open Air Theatre, Lahore',
    imageUrl: 'assets/images/concert_images/concert2.jpg',
  ),
  EventModel(
    id: '5',
    title: 'Jazz Evening',
    description:
        'Smooth jazz and soulful melodies all night. A relaxing evening with saxophones, piano, and soothing rhythms by renowned jazz artists.',
    date: '2025-10-10',
    time: '6:00 PM',
    location: 'Beach View Club, Karachi',
    imageUrl: 'assets/images/concert_images/concert3.jpg',
  ),
  EventModel(
    id: '6',
    title: 'Pop Festival',
    description:
        'A colorful pop music festival featuring top singers. Dance, sing along, and enjoy vibrant stage performances with dazzling lights and sound.',
    date: '2025-10-15',
    time: '5:00 PM',
    location: 'National Stadium, Karachi',
    imageUrl: 'assets/images/concert_images/concert4.jpg',
  ),

  // Tech Events
  EventModel(
    id: '7',
    title: 'Cybersecurity Summit',
    description:
        'Discuss the latest in cybersecurity with global experts. Learn about digital threats, ethical hacking, and best practices to keep data safe.',
    date: '2025-10-20',
    time: '9:00 AM',
    location: 'IT Tower, Lahore',
    imageUrl: 'assets/images/tech_images/tech1.jpg',
  ),
  EventModel(
    id: '8',
    title: 'Cloud Computing Expo',
    description:
        'Discover innovations in cloud infrastructure and services. Meet cloud providers, attend workshops, and explore case studies from enterprises.',
    date: '2025-10-22',
    time: '11:00 AM',
    location: 'Expo Center, Islamabad',
    imageUrl: 'assets/images/tech_images/tech2.jpg',
  ),
  EventModel(
    id: '9',
    title: 'Web 3.0 Meetup',
    description:
        'Blockchain, NFTs, and the decentralized web. Learn how the future of internet is being reshaped by trustless technologies and smart contracts.',
    date: '2025-10-25',
    time: '4:00 PM',
    location: 'Tech Hub, Karachi',
    imageUrl: 'assets/images/tech_images/tech3.jpg',
  ),
  EventModel(
    id: '10',
    title: 'Mobile App DevCon',
    description:
        'Conference for mobile app developers and enthusiasts. Covering Flutter, React Native, iOS, Android, and cross-platform best practices.',
    date: '2025-10-28',
    time: '10:30 AM',
    location: 'Pearl Continental, Lahore',
    imageUrl: 'assets/images/tech_images/tech4.jpg',
  ),

  // Other Events
  EventModel(
    id: '11',
    title: 'Startup Pitch Day',
    description:
        'Startups pitch their ideas to investors and mentors. A chance for founders to showcase innovation and secure funding for their projects.',
    date: '2025-11-01',
    time: '9:30 AM',
    location: 'Incubation Center, Karachi',
    imageUrl: 'assets/images/other_event_images/startup_pitch.jpg',
  ),
  EventModel(
    id: '12',
    title: 'Book Fair',
    description:
        'A wide collection of books from international publishers. Discover rare editions, meet authors, and attend book signings and storytelling sessions.',
    date: '2025-11-03',
    time: '11:00 AM',
    location: 'Expo Center, Lahore',
    imageUrl: 'assets/images/other_event_images/book_fair.jpg',
  ),
  EventModel(
    id: '13',
    title: 'Sports Gala',
    description:
        'Annual sports competition among universities. Events include cricket, football, athletics, and fun games to encourage sportsmanship.',
    date: '2025-11-05',
    time: '8:00 AM',
    location: 'National Stadium, Karachi',
    imageUrl: 'assets/images/other_event_images/sports_gala.jpg',
  ),
  EventModel(
    id: '14',
    title: 'Photography Exhibition',
    description:
        'Exhibition of emerging photographers’ works. From landscapes to portraits, explore creativity through lenses and meet the artists in person.',
    date: '2025-11-08',
    time: '3:00 PM',
    location: 'Art Gallery, Islamabad',
    imageUrl: 'assets/images/other_event_images/photography_exhibition.jpg',
  ),
  EventModel(
    id: '15',
    title: 'Food Carnival',
    description:
        'Taste cuisines from around the world. Food stalls, cooking competitions, and live music make it a perfect day for food lovers.',
    date: '2025-11-10',
    time: '12:00 PM',
    location: 'Beach Park, Karachi',
    imageUrl: 'assets/images/other_event_images/food_carnival.jpg',
  ),
  EventModel(
    id: '16',
    title: 'Career Fair',
    description:
        'Meet recruiters and explore career opportunities. Participate in workshops, resume reviews, and one-on-one sessions with hiring managers.',
    date: '2025-11-12',
    time: '9:00 AM',
    location: 'University of Lahore',
    imageUrl: 'assets/images/other_event_images/career_fair.jpg',
  ),
  EventModel(
    id: '17',
    title: 'Drama Festival',
    description:
        'Stage dramas and performances by theatre groups. Experience comedy, tragedy, and cultural plays performed by talented artists.',
    date: '2025-11-15',
    time: '7:00 PM',
    location: 'Arts Council, Karachi',
    imageUrl: 'assets/images/other_event_images/drama_festival.jpg',
  ),
  EventModel(
    id: '18',
    title: 'Charity Run',
    description:
        '5K run to support education for underprivileged children. Participants will receive medals, t-shirts, and certificates of appreciation.',
    date: '2025-11-18',
    time: '6:00 AM',
    location: 'Racecourse Ground, Lahore',
    imageUrl: 'assets/images/other_event_images/charity.jpg',
  ),
  EventModel(
    id: '19',
    title: 'Cultural Fest',
    description:
        'Celebrate cultures with music, dance, and food. Colorful stalls and traditional performances highlight the diversity of Pakistan.',
    date: '2025-11-20',
    time: '2:00 PM',
    location: 'City Park, Islamabad',
    imageUrl: 'assets/images/other_event_images/cultural_fest.jpg',
  ),
  EventModel(
    id: '20',
    title: 'Health & Wellness Expo',
    description:
        'Focus on fitness, nutrition, and mental well-being. Attend free fitness classes, health screenings, and meet nutritionists and trainers.',
    date: '2025-11-22',
    time: '10:00 AM',
    location: 'Expo Center, Karachi',
    imageUrl: 'assets/images/other_event_images/health_expo.jpg',
  ),
];
