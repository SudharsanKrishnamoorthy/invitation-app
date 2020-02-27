import 'package:invitation/core/models/couple.dart';
import 'package:invitation/core/models/event.dart';
import 'package:invitation/core/models/favourite.dart';
import 'package:invitation/core/models/wishes.dart';
import 'package:invitation/utils/constants.dart';
import 'package:invitation/core/enums/enumeration.dart';

var favourites = [
  Favourites(
      title: 'Actor',
      image: '$asseticons/actor.png',
      bride: 'VIJAY',
      groom: 'RAJNI'),
  Favourites(
      title: 'Singer',
      image: '$asseticons/singer.png',
      bride: 'SID SRI RAM',
      groom: 'SPB'),
  Favourites(
      title: 'Number',
      image: '$asseticons/number.png',
      bride: '8,9,15',
      groom: '1'),
  Favourites(
      title: 'Movie',
      image: '$asseticons/movie.png',
      bride: 'Sachin, Sethupathi',
      groom: 'Sachin ,Sethupathi'),
  Favourites(
      title: 'Destination',
      image: '$asseticons/destination.png',
      bride: 'Kerala, Singapore',
      groom: 'Singapore'),
  Favourites(
      title: 'Color',
      image: '$asseticons/color.png',
      bride: 'Lavander, Green',
      groom: 'Red, Black'),
  Favourites(
      title: 'Sport',
      image: '$asseticons/sport.png',
      bride: 'Tennis, Football',
      groom: 'Cricket'),
  Favourites(
      title: 'Hobbies',
      image: '$asseticons/hobby.png',
      bride: 'Drawing, Movies',
      groom: 'Movies'),
  Favourites(
      title: 'Car',
      image: '$asseticons/car.png',
      bride: 'Swift, Scorpio',
      groom: 'Swift, Scorpio'),
];

var wishes = [
  WishesModel(
    name: 'Prasanth',
    image: '$assetusers/packiaseelan.jpg',
    text: 'Happy married life',
    isSelected: false,
  ),
  WishesModel(
    name: 'Praseeda',
    image: '$assetusers/packiaseelan.jpg',
    text: 'Happy married life',
    isSelected: false,
  ),
  WishesModel(
    name: 'Swetha',
    image: '$assetusers/packiaseelan.jpg',
    text: 'Happy married life',
    isSelected: false,
  ),
  WishesModel(
    name: 'Poovika',
    image: '$assetusers/packiaseelan.jpg',
    text: 'Happy married life',
    isSelected: false,
  ),
  WishesModel(
    name: 'Manoj',
    image: '$assetusers/manoj.jpg',
    text: 'Happy married life',
    isSelected: false,
  ),
  WishesModel(
    name: 'Packiaseelan',
    image: '$assetusers/packiaseelan.jpg',
    text:
        'May your wedding day be all that you wish for!! I already know that all your planning will make for a special day filled with lots of wonderful memories. All the very best friend and looking forward to catching up with you both.',
    isSelected: false,
  ),
    WishesModel(
    name: 'Vijaya Ragavan',
    image: '$assetusers/packiaseelan.jpg',
    text:
        'Happy married life',
    isSelected: false,
  ),
    WishesModel(
    name: 'Balaji',
    image: '$assetusers/packiaseelan.jpg',
    text:
        'Happy married life',
    isSelected: false,
  ),
    WishesModel(
    name: 'Srinivasan',
    image: '$assetusers/packiaseelan.jpg',
    text:
        'Happy married life',
    isSelected: false,
  ),
];

var events = [
  EventModel(
    title: 'Reception',
    image: '$assetBG/pic3.jpg',
    dates: '23rd May 2020',
    date: '23',
    month: 'MAY',
    time: '7:00 PM to 10:00 PM',
    hallName: 'Jayamurugan Thirumana Mandapam',
    hallAddress: 'Pillayar Nagar, Ponnammapet,\nSalem - 636007',
    subTitle: 'About Reception',
    description:
        'A reception is held as a sort of welcome for those who attended the wedding. The couple receives their community, i.e. friends and family, for the first time as a newly married couple. Likewise their friends and family receive the newlyweds as a married couple.',
    isSelected: false,
    event: Events.reception,
  ),
  EventModel(
    title: 'Marriage',
    image: '$assetBG/pic4.jpg',
    dates: '24th May 2020',
    date: '24',
    month: 'MAY',
    time: '8 Am to 9:15 AM',
    hallName: 'Jayamurugan Thirumana Mandapam',
    hallAddress: 'Pillayar Nagar, Ponnammapet,\nSalem - 636007',
    subTitle: 'About Wedding',
    description:
        'A wedding is a ceremony where two or more people are united in marriage. Wedding traditions and customs vary greatly between cultures, ethnic groups, religions, countries, and social classes. Most wedding ceremonies involve an exchange of marriage vows by a couple, presentation of a gift and a public proclamation of marriage by an authority figure or celebrant.',
    isSelected: false,
    event: Events.marriage,
  ),
];

var weddedCouple = [
  CoupleModel(
    type: WeddedPair.groom,
    name: 'Sudharsan',
    image: '$details/groom.JPEG',
    designation: 'Software Developer',
    description: 'Today, I promise you this: I will laugh with you in times of joy, and comfort you in times of sorrow. I will share in your dreams and support you as you strive to achieve your goals. Together, let us build a home filled with learning, laughter and light, shared freely with all who may live there. Let us be partners, friends and lovers, today and all of the days that follow.'
  ),
  CoupleModel(
    type: WeddedPair.bride,
    name: 'Nandhini',
    image: '$details/bride.JPEG',
    designation: 'Software Developer',
    description: 'I will be the first person in this room to admit that. I was never the type of girl to dream about her wedding day. A big romantic wedding was just never something that I thought all that much about. I was not even sure if I would ever get married. But when you meet the right person you just know and I am so greatful that I met and that I get to be his wife. I could not ask for a better husband.'
  ),
];
