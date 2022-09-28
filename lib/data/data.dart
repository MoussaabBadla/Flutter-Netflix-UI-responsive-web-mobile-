import 'package:netflix/data/models.dart';

import 'assist.dart';

const Serie voilet = Serie(
  name: 'Violet Evergarden', 
  imageUrl:  Assets.violetEvergarden, 
  titleImageUrl: 'images/Violetevergarden.webp',
  vidurl: 'https://firebasestorage.googleapis.com/v0/b/test-c042f.appspot.com/o/videoplayback.mp4?alt=media&token=53507b3a-afbe-41bf-8055-cdd722e38cdd',
   des: 'In the aftermath of a great war, Violet Evergarden, a young female ex-soldier, gets a job at a writers agency and goes on assignments to create letters that can connect people. After four long years of conflict, The Great War has finally come to an end.'
);

const Serie thewitcher = Serie(
    categories: ['Fantasy', 'Drama', 'Television', 'Series'],
    name: 'The Witcher',
    imageUrl: Assets.witcher,
    titleImageUrl: Assets.witchertitle,
    vidurl:
        'https://firebasestorage.googleapis.com/v0/b/test-c042f.appspot.com/o/The%20Witcher%20Season%202%20_%20Official%20Trailer%20_%20Netflix.mp4?alt=media&token=b89a4b61-ef8f-470b-94af-72527aa57ee8',
    des:
        'The Witcher follows the story of Geralt of Rivia, a solitary monster hunter, who struggles to find his place in a world where people often prove more wicked than monsters and beasts.');

const List<Serie> lastview = [
  Serie(
    name: 'Avatar The Last Airbender',
    imageUrl: Assets.atla,
    titleImageUrl: Assets.atlaTitle,
  ),
  Serie(
    name: 'The Crown',
    imageUrl: Assets.crown,
    titleImageUrl: Assets.crownTitle,
  ),
  Serie(
    name: 'The Umbrella Academy',
    imageUrl: Assets.umbrellaAcademy,
    titleImageUrl: Assets.umbrellaAcademyTitle,
  ),
  Serie(
    name: 'Carole and Tuesday',
    imageUrl: Assets.caroleAndTuesday,
    titleImageUrl: Assets.caroleAndTuesdayTitle,
  ),
  Serie(
    name: 'Black Mirror',
    imageUrl: Assets.blackMirror,
    titleImageUrl: Assets.blackMirrorTitle,
  ),
  Serie(
    name: 'Avatar The Last Airbender',
    imageUrl: Assets.atla,
    titleImageUrl: Assets.atlaTitle,
  ),
  Serie(
    name: 'The Crown',
    imageUrl: Assets.crown,
    titleImageUrl: Assets.crownTitle,
  ),
  Serie(
    name: 'The Umbrella Academy',
    imageUrl: Assets.umbrellaAcademy,
    titleImageUrl: Assets.umbrellaAcademyTitle,
  ),
  Serie(
    name: 'Carole and Tuesday',
    imageUrl: Assets.caroleAndTuesday,
    titleImageUrl: Assets.caroleAndTuesdayTitle,
  ),
  Serie(
    name: 'Black Mirror',
    imageUrl: Assets.blackMirror,
    titleImageUrl: Assets.blackMirrorTitle,
  ),
  Serie(
    name: 'Sintel',
    imageUrl: Assets.sintel,
    titleImageUrl: Assets.sintelTitle,
  ),
];

const List<Serie> mylist = [
  Serie(name: 'Peaky blinders', imageUrl: Assets.peakyblicders),
  Serie(name: 'Violet Evergarden', imageUrl: Assets.violetEvergarden),
  Serie(name: 'Breaking Bad', imageUrl: Assets.breakingBad),
  Serie(name: 'How to Sell Drugs Online (Fast)', imageUrl: Assets.htsdof),
  Serie(name: 'Kakegurui', imageUrl: Assets.kakegurui),
  Serie(name: 'Carole and Tuesday', imageUrl: Assets.caroleAndTuesday),
  Serie(name: 'Black Mirror', imageUrl: Assets.blackMirror),
  Serie(name: 'Violet Evergarden', imageUrl: Assets.violetEvergarden),
  Serie(name: 'How to Sell Drugs Online (Fast)', imageUrl: Assets.htsdof),
  Serie(name: 'Man bee', imageUrl: Assets.manbee),
  Serie(name: 'Carole and Tuesday', imageUrl: Assets.caroleAndTuesday),
  Serie(name: 'Black Mirror', imageUrl: Assets.blackMirror),
];

const List<Serie> originals = [
  Serie(name: 'Stranger Things', imageUrl: Assets.strangerThings),
  Serie(name: 'The Umbrella Academy', imageUrl: Assets.umbrellaAcademy),
  Serie(name: '13 Reasons Why', imageUrl: Assets.thirteenReasonsWhy),
  Serie(name: 'The End of the F***ing World', imageUrl: Assets.teotfw),
  Serie(name: 'Stranger Things', imageUrl: Assets.strangerThings),
  Serie(
    name: 'Sintel',
    imageUrl: Assets.sintel,
  ),
  Serie(name: 'The Umbrella Academy', imageUrl: Assets.umbrellaAcademy),
  Serie(name: '13 Reasons Why', imageUrl: Assets.thirteenReasonsWhy),
  Serie(name: 'The End of the F***ing World', imageUrl: Assets.teotfw),
];

const List<Serie> trending = [
  Serie(name: 'Breaking Bad', imageUrl: Assets.breakingBad),
  Serie(name: 'Explained', imageUrl: Assets.explained),
  Serie(name: 'Avatar The Last Airbender', imageUrl: Assets.atla),
  Serie(name: 'Tiger King', imageUrl: Assets.tigerKing),
  Serie(name: 'The Crown', imageUrl: Assets.crown),
  Serie(name: 'Dogs', imageUrl: Assets.dogs),
  Serie(name: 'Explained', imageUrl: Assets.explained),
  Serie(name: 'Avatar The Last Airbender', imageUrl: Assets.atla),
  Serie(name: 'Tiger King', imageUrl: Assets.tigerKing),
  Serie(name: 'The Crown', imageUrl: Assets.crown),
  Serie(name: 'Dogs', imageUrl: Assets.dogs),
];
