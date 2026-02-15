enum BibleVersion {
  kjv, // King James Version
  dr, // Douay-Rheims
  rsvce // Revised Standard Version Catholic Edition
}

class BibleService {
  static String getVerse(String reference, BibleVersion version) {
    // In a real app, this would fetch from a database or API.
    // For this implementation, we provide a curated set of Lenten scriptures.
    final data = _scriptureData[reference];
    if (data == null) return "Scripture text not available for this version.";
    return data[version] ??
        data[BibleVersion.rsvce] ??
        "Translation not available.";
  }

  static const Map<String, Map<BibleVersion, String>> _scriptureData = {
    'Joel 2:12-13': {
      BibleVersion.kjv:
          "Therefore also now, saith the LORD, turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning: And rend your heart, and not your garments...",
      BibleVersion.dr:
          "Now therefore saith the Lord: Be converted to me with all your heart, in fasting, and in weeping, and in mourning. And rend your hearts, and not your garments...",
      BibleVersion.rsvce:
          "Yet even now, says the Lord, return to me with all your heart, with fasting, with weeping, and with mourning; and rend your hearts and not your garments...",
    },
    'Matthew 6:16-18': {
      BibleVersion.kjv:
          "Moreover when ye fast, be not, as the hypocrites, of a sad countenance...",
      BibleVersion.dr:
          "And when you fast, be not as the hypocrites, sad. For they disfigure their faces, that they may appear unto men to fast...",
      BibleVersion.rsvce:
          "And when you fast, do not look dismal, like the hypocrites, for they disfigure their faces that their fasting may be seen by men...",
    },
    'Isaiah 58:6-7': {
      BibleVersion.kjv:
          "Is not this the fast that I have chosen? to loose the bands of wickedness, to undo the heavy burdens, and to let the oppressed go free, and that ye break every yoke? Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him; and that thou hide not thyself from thine own flesh?",
      BibleVersion.dr:
          "Is not this rather the fast that I have chosen? loose the bands of wickedness, undo the bundles that oppress, let them that are broken go free, and break asunder every burden. Deal thy bread to the hungry, and bring the needy and the harbourless into thy house: when thou shalt see one naked, cover him, and despise not thy own flesh.",
      BibleVersion.rsvce:
          "Is not this the fast that I choose: to loose the bonds of wickedness, to undo the thongs of the yoke, to let the oppressed go free, and to break every yoke? Is it not to share your bread with the hungry, and bring the homeless poor into your house; when you see the naked, to cover him, and not to hide yourself from your own flesh?",
    },
    'Psalm 51:1-2': {
      BibleVersion.kjv:
          "Have mercy upon me, O God, according to thy lovingkindness: according unto the multitude of thy tender mercies blot out my transgressions. Wash me throughly from mine iniquity, and cleanse me from my sin.",
      BibleVersion.dr:
          "Have mercy on me, O God, according to thy great mercy. And according to the multitude of thy tender mercies blot out my iniquity. Wash me yet more from my iniquity, and cleanse me from my sin.",
      BibleVersion.rsvce:
          "Have mercy on me, O God, according to thy steadfast love; according to thy abundant mercy blot out my transgressions. Wash me thoroughly from my iniquity, and cleanse me from my sin!",
    },
    'Matthew 4:4': {
      BibleVersion.kjv:
          "But he answered and said, It is written, Man shall not live by bread alone, but by every word that proceedeth out of the mouth of God.",
      BibleVersion.dr:
          "Who answered and said: It is written, Not in bread alone doth man live, but in every word that proceedeth from the mouth of God.",
      BibleVersion.rsvce:
          "But he answered, 'It is written, \"Man shall not live by bread alone, but by every word that proceeds from the mouth of God.\"'",
    },
    'Luke 15:18': {
      BibleVersion.kjv:
          "I will arise and go to my father, and will say unto him, Father, I have sinned against heaven, and before thee.",
      BibleVersion.dr:
          "I will arise and go to my father, and say to him: Father, I have sinned against heaven, and before thee.",
      BibleVersion.rsvce:
          "I will arise and go to my father, and I will say to him, \"Father, I have sinned against heaven and before you.\"",
    },
    '2 Corinthians 6:2': {
      BibleVersion.kjv:
          "For he saith, I have heard thee in a time accepted, and in the day of salvation have I succoured thee: behold, now is the accepted time; behold, now is the day of salvation.",
      BibleVersion.dr:
          "For he saith: In an accepted time have I heard thee; and in the day of salvation have I helped thee. Behold, now is the acceptable time; behold, now is the day of salvation.",
      BibleVersion.rsvce:
          "For he says, 'At the acceptable time I have listened to you, and help you on the day of salvation.' Behold, now is the acceptable time; behold, now is the day of salvation.",
    },
    'Galatians 6:9-10': {
      BibleVersion.kjv:
          "And let us not be weary in well doing: for in due season we shall reap, if we faint not. As we have therefore opportunity, let us do good unto all men, especially unto them who are of the household of faith.",
      BibleVersion.dr:
          "And in doing good, let us not fail. For in due time we shall reap, not failing. Therefore, whilst we have time, let us work good to all men, but especially to those who are of the household of the faith.",
      BibleVersion.rsvce:
          "And let us not grow weary in well-doing, for in due season we shall reap, if we do not lose heart. So then, as we have opportunity, let us do good to all men, and especially to those who are of the household of faith.",
    },
    'John 3:16-17': {
      BibleVersion.kjv:
          "For God so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life. For God sent not his Son into the world to condemn the world; but that the world through him might be saved.",
      BibleVersion.dr:
          "For God so loved the world, as to give his only begotten Son; that whosoever believeth in him, may not perish, but may have life everlasting. For God sent not his Son into the world, to judge the world, but that the world may be saved by him.",
      BibleVersion.rsvce:
          "For God so loved the world that he gave his only Son, that whoever believes in him should not perish but have eternal life. For God sent the Son into the world, not to condemn the world, but that the world might be saved through him.",
    },
    'Psalm 34:18': {
      BibleVersion.kjv:
          "The LORD is nigh unto them that are of a broken heart; and saveth such as be of a contrite spirit.",
      BibleVersion.dr:
          "The Lord is nigh unto them that are of a contrite heart: and he will save the humble of spirit.",
      BibleVersion.rsvce:
          "The Lord is near to the brokenhearted, and saves the crushed in spirit.",
    },
    'Micah 6:8': {
      BibleVersion.kjv:
          "He hath shewed thee, O man, what is good; and what doth the LORD require of thee, but to do justly, and to love mercy, and to walk humbly with thy God?",
      BibleVersion.dr:
          "I will shew thee, O man, what is good, and what the Lord requireth of thee: Verily, to do judgment, and to love mercy, and to walk solicitous with thy God.",
      BibleVersion.rsvce:
          "He has showed you, O man, what is good; and what does the Lord require of you but to do justice, and to love kindness, and to walk humbly with your God?",
    },
    'Isaiah 1:18': {
      BibleVersion.kjv:
          "Come now, and let us reason together, saith the LORD: though your sins be as scarlet, they shall be as white as snow; though they be red like crimson, they shall be as wool.",
      BibleVersion.dr:
          "And then come, and accuse me, saith the Lord: if your sins be as scarlet, they shall be made as white as snow: and if they be red as crimson, they shall be white as wool.",
      BibleVersion.rsvce:
          "“Come now, let us reason together, says the Lord: though your sins are like scarlet, they shall be as white as snow; though they are red like crimson, they shall become like wool.",
    },
    'James 4:8': {
      BibleVersion.kjv:
          "Draw nigh to God, and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded.",
      BibleVersion.dr:
          "Draw nigh to God, and he will draw nigh to you. Cleanse your hands, ye sinners: and purify your hearts, ye double minded.",
      BibleVersion.rsvce:
          "Draw near to God and he will draw near to you. Cleanse your hands, you sinners, and purify your hearts, you men of double mind.",
    },
    '1 John 1:9': {
      BibleVersion.kjv:
          "If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.",
      BibleVersion.dr:
          "If we confess our sins, he is faithful and just, to forgive us our sins, and to cleanse us from all iniquity.",
      BibleVersion.rsvce:
          "If we confess our sins, he is faithful and just, and will forgive our sins and cleanse us from all unrighteousness.",
    },
    'Romans 12:1-2': {
      BibleVersion.kjv:
          "I beseech you therefore, brethren, by the mercies of God, that ye present your bodies a living sacrifice, holy, acceptable unto God, which is your reasonable service...",
      BibleVersion.dr:
          "I beseech you therefore, brethren, by the mercy of God, that you present your bodies a living sacrifice, holy, pleasing unto God, your reasonable service...",
      BibleVersion.rsvce:
          "I appeal to you therefore, brethren, by the mercies of God, to present your bodies as a living sacrifice, holy and acceptable to God, which is your spiritual worship...",
    },
    'Matthew 11:28-30': {
      BibleVersion.kjv:
          "Come unto me, all ye that labour and are heavy laden, and I will give you rest. Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls. For my yoke is easy, and my burden is light.",
      BibleVersion.dr:
          "Come to me, all you that labour, and are burdened, and I will refresh you. Take up my yoke upon you, and learn of me, because I am meek, and humble of heart: and you shall find rest to your souls. For my yoke is sweet and my burden light.",
      BibleVersion.rsvce:
          "Come to me, all who labor and are heavy laden, and I will give you rest. Take my yoke upon you, and learn from me; for I am gentle and lowly in heart, and you will find rest for your souls. For my yoke is easy, and my burden is light.”",
    },
    'Psalm 103:10-12': {
      BibleVersion.kjv:
          "He hath not dealt with us after our sins; nor rewarded us according to our iniquities. For as the heaven is high above the earth, so great is his mercy toward them that fear him. As far as the east is from the west, so far hath he removed our transgressions from us.",
      BibleVersion.dr:
          "He hath not dealt with us according to our sins: nor rewarded us according to our iniquities. For according to the height of the heaven above the earth: he hath strengthened his mercy towards them that fear him. As far as the east is from the west, so far hath he removed our iniquities from us.",
      BibleVersion.rsvce:
          "He does not deal with us according to our sins, nor requite us according to our iniquities. For as the heavens are high above the earth, so great is his steadfast love toward those who fear him; as far as the east is from the west, so far does he remove our transgressions from us.",
    },
    'Philippians 4:13': {
      BibleVersion.kjv:
          "I can do all things through Christ which strengtheneth me.",
      BibleVersion.dr: "I can do all things in him who strengtheneth me.",
      BibleVersion.rsvce: "I can do all things in him who strengthens me.",
    },
    '1 Peter 5:6-7': {
      BibleVersion.kjv:
          "Humble yourselves therefore under the mighty hand of God, that he may exalt you in due time: Casting all your care upon him; for he careth for you.",
      BibleVersion.dr:
          "Be you humbled therefore under the mighty hand of God, that he may exalt you in the time of visitation: Casting all your care upon him, for he hath care of you.",
      BibleVersion.rsvce:
          "Humble yourselves therefore under the mighty hand of God, that in due time he may exalt you. Cast all your anxieties on him, for he cares for you.",
    },
    // More Lenten scriptures can be added here
  };
}
