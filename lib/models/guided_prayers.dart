import 'guided_prayer.dart';

class GuidedPrayers {
  static const List<GuidedPrayer> allPrayers = [
    GuidedPrayer(
      id: 'rosary',
      title: 'The Holy Rosary',
      description:
          'A traditional Catholic meditation on the mysteries of the life of Christ.',
      icon: '📿',
      averageMinutes: 20,
      sections: [
        PrayerSection(
          title: 'Sign of the Cross',
          text:
              'In the name of the Father, and of the Son, and of the Holy Spirit. Amen.',
          instructions: 'Make the Sign of the Cross.',
          audioUrl:
              'https://themathesontrust.org/papers/sacredaudio/sa-christianity/sa-ch-ourfather-english.mp3', // Placeholder
        ),
        PrayerSection(
          title: 'The Apostles\' Creed',
          text:
              'I believe in God, the Father almighty, Creator of heaven and earth, and in Jesus Christ, his only Son, our Lord, who was conceived by the Holy Spirit, born of the Virgin Mary, suffered under Pontius Pilate, was crucified, died and was buried; he descended into hell; on the third day he rose again from the dead; he ascended into heaven, and is seated at the right hand of God the Father almighty; from there he will come to judge the living and the dead. I believe in the Holy Spirit, the holy catholic Church, the communion of saints, the forgiveness of sins, the resurrection of the body, and life everlasting. Amen.',
          instructions: 'Recite while holding the crucifix.',
          audioUrl:
              'https://archive.org/download/three_ecumenical_creeds_jl_librivox/three_ecumenical_creeds_01_apostles_creed.mp3',
        ),
        PrayerSection(
          title: 'Our Father',
          text:
              'Our Father, who art in heaven, hallowed be thy name; thy kingdom come, thy will be done on earth as it is in heaven. Give us this day our daily bread, and forgive us our trespasses, as we forgive those who trespass against us; and lead us not into temptation, but deliver us from evil. Amen.',
          instructions: 'Pray for the intentions of the Holy Father.',
          audioUrl:
              'https://themathesontrust.org/papers/sacredaudio/sa-christianity/sa-ch-ourfather-english.mp3',
        ),
        PrayerSection(
          title: 'Hail Mary (x3)',
          text:
              'Hail Mary, full of grace, the Lord is with thee. Blessed art thou among women, and blessed is the fruit of thy womb, Jesus. Holy Mary, Mother of God, pray for us sinners, now and at the hour of our death. Amen.',
          instructions: 'Pray for an increase in faith, hope, and charity.',
          audioUrl:
              'https://archive.org/download/materchristi_2307_librivox/materchristi_06_motherstpaul_128kb.mp3',
        ),
        PrayerSection(
          title: 'Glory Be',
          text:
              'Glory be to the Father, and to the Son, and to the Holy Spirit. As it was in the beginning, is now, and ever shall be, world without end. Amen.',
        ),
      ],
    ),
    GuidedPrayer(
      id: 'stations',
      title: 'Stations of the Cross',
      description:
          'A 14-step devotion on Jesus\' final journey.',
      icon: '✝️',
      averageMinutes: 30,
      sections: [
        PrayerSection(
          title: 'I',
          text: 'Jesus is condemned to death.',
          instructions:
              'We adore You, O Christ, and we praise You. Because by Your holy cross, You have redeemed the world.\n\nReflection: Jesus stands before Pilate, innocent and silent. He accepts the sentence of death for our sake. Lord, grant us the grace to accept our own crosses with silence and trust.',
          imagePath: 'assets/images/stations/station_1.png',
        ),
        PrayerSection(
          title: 'II',
          text: 'Jesus carries His cross.',
          instructions:
              'Grant us, O Lord, a portion of Your courage.\n\nReflection: The heavy wood is placed on His shoulders. He does not turn away. Lord, help us to carry our daily burdens with patience and love.',
          imagePath: 'assets/images/stations/station_2.png',
        ),
        PrayerSection(
          title: 'III',
          text: 'Jesus falls the first time.',
          instructions:
              'Lord, help us when we fall on our journey.\n\nReflection: Even the Son of God falls under the weight. He gets up and continues. Lord, give us the strength to rise after every failure.',
          imagePath: 'assets/images/stations/station_3.png',
        ),
        PrayerSection(
          title: 'IV',
          text: 'Jesus meets His mother.',
          instructions:
              'Holy Mary, Mother of God, pray for us.\n\nReflection: A sword of sorrow pierces Mary\'s heart as she sees her Son suffer. Lord, may we always find comfort in the presence of Your Mother.',
          imagePath: 'assets/images/stations/station_4.png',
        ),
        PrayerSection(
          title: 'V',
          text: 'Simon of Cyrene helps Jesus to carry His cross.',
          instructions:
              'Make us willing to help others in their need.\n\nReflection: Simon was a stranger, yet he shared the load. Lord, open our hearts to help those who are struggling around us.',
          imagePath: 'assets/images/stations/station_5.png',
        ),
        PrayerSection(
          title: 'VI',
          text: 'Veronica wipes the face of Jesus.',
          instructions:
              'Lord, let Your face shine upon us.\n\nReflection: A simple act of compassion leaves an eternal impression. Lord, let Your image be imprinted on our souls through our acts of kindness.',
          imagePath: 'assets/images/stations/station_6.png',
        ),
        PrayerSection(
          title: 'VII',
          text: 'Jesus falls the second time.',
          instructions:
              'Grant us perseverance in the face of failure.\n\nReflection: The journey is long and the pain increases. Jesus falls again but does not quit. Lord, sustain us in our long-term trials.',
          imagePath: 'assets/images/stations/station_7.png',
        ),
        PrayerSection(
          title: 'VIII',
          text: 'Jesus meets the women of Jerusalem.',
          instructions:
              'Weep not for Me, but for yourselves and your children.\n\nReflection: Jesus forgets His own pain to comfort others. Lord, help us to look beyond our own suffering to the needs of others.',
          imagePath: 'assets/images/stations/station_8.png',
        ),
        PrayerSection(
          title: 'IX',
          text: 'Jesus falls the third time.',
          instructions:
              'Lord, give us strength in our final moments.\n\nReflection: Exhausted and near death, He falls one last time. He summons His final strength to reach Calvary. Lord, be our strength when we have none left.',
          imagePath: 'assets/images/stations/station_9.png',
        ),
        PrayerSection(
          title: 'X',
          text: 'Jesus is stripped of His garments.',
          instructions:
              'Grant us a spirit of detachment from the world.\n\nReflection: He is deprived of everything, even His clothing. Lord, strip us of our pride and worldly attachments.',
          imagePath: 'assets/images/stations/station_10.png',
        ),
        PrayerSection(
          title: 'XI',
          text: 'Jesus is nailed to the cross.',
          instructions:
              'Forgive them, Father, for they know not what they do.\n\nReflection: Hands that healed are now pierced. He forgives His executioners. Lord, teach us the depth of Your forgiveness.',
          imagePath: 'assets/images/stations/station_11.png',
        ),
        PrayerSection(
          title: 'XII',
          text: 'Jesus dies on the cross.',
          instructions:
              'It is finished. Into Your hands I commend My spirit.\n\nReflection: The ultimate sacrifice is complete. Death is defeated. Lord, may we die to ourselves so that we may live in You.',
          imagePath: 'assets/images/stations/station_12.png',
        ),
        PrayerSection(
          title: 'XIII',
          text: 'The body of Jesus is taken down from the cross.',
          instructions:
              'Our Lady of Sorrows, pray for us.\n\nReflection: The lifeless body of Jesus is placed in Mary\'s arms. Lord, help us to trust even in the silence of death.',
          imagePath: 'assets/images/stations/station_13.png',
        ),
        PrayerSection(
          title: 'XIV',
          text: 'Jesus is laid in the tomb.',
          instructions:
              'Waiting in hope for the Resurrection.\n\nReflection: A heavy stone closes the tomb. All seems lost, but hope remains. Lord, prepare our hearts for the joy of the Resurrection.',
          imagePath: 'assets/images/stations/station_14.png',
        ),
      ],
    ),
    GuidedPrayer(
      id: 'examen',
      title: 'Daily Examen',
      description:
          'A technique of prayerful reflection on the events of the day.',
      icon: '🧘',
      averageMinutes: 10,
      sections: [
        PrayerSection(
          title: '1. Become aware of God\'s presence',
          text:
              'Look back on the day with the eyes of faith. Where was God active today?',
        ),
        PrayerSection(
          title: '2. Review the day with gratitude',
          text:
              'Focus on the gifts and blessings of the day. What are you thankful for?',
        ),
        PrayerSection(
          title: '3. Pay attention to your emotions',
          text:
              'Reflect on the feelings you experienced today. What were they telling you?',
        ),
        PrayerSection(
          title: '4. Choose one feature of the day and pray from it',
          text:
              'Focus on one specific event or interaction. What is God saying to you through it?',
        ),
        PrayerSection(
          title: '5. Look forward to tomorrow',
          text: 'How can you live better tomorrow? Ask for God\'s grace.',
        ),
      ],
    ),
    GuidedPrayer(
      id: 'divine_mercy',
      title: 'Divine Mercy Chaplet',
      description: 'A prayer of trust in God\'s mercy.',
      icon: '🕊️',
      averageMinutes: 10,
      sections: [
        PrayerSection(
          title: 'Eternal Father',
          text:
              'Eternal Father, I offer you the Body and Blood, Soul and Divinity of Your Dearly Beloved Son, Our Lord, Jesus Christ, in atonement for our sins and those of the whole world.',
          audioUrl:
              'https://archive.org/download/trans-regret-snoopy-presents-the-bible-podcast-archives/S01E23-The-Stations-of-the-Cross-with-Christlover2000.mp3', // Fallback for now
        ),
        PrayerSection(
          title: 'For the sake of His sorrowful Passion',
          text: 'Have mercy on us and on the whole world.',
          instructions: 'Repeat 10 times on each decade.',
        ),
        PrayerSection(
          title: 'Holy God',
          text:
              'Holy God, Holy Mighty One, Holy Immortal One, have mercy on us and on the whole world.',
          instructions: 'Conclude by repeating 3 times.',
        ),
      ],
    ),
  ];
}
