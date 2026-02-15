class ExaminationQuestion {
  final String question;
  final String? reflection;

  const ExaminationQuestion({
    required this.question,
    this.reflection,
  });
}

class ExaminationCategory {
  final String title;
  final String icon;
  final List<ExaminationQuestion> questions;

  const ExaminationCategory({
    required this.title,
    required this.icon,
    required this.questions,
  });
}

class ExaminationOfConscience {
  static List<ExaminationCategory> getAllCategories() {
    return _categories;
  }

  static const List<ExaminationCategory> _categories = [
    // First Commandment
    ExaminationCategory(
      title: 'First Commandment: Love of God',
      icon: '✝️',
      questions: [
        ExaminationQuestion(
          question: 'Have I doubted or denied my faith in God?',
          reflection: 'Faith is the foundation of our relationship with God.',
        ),
        ExaminationQuestion(
          question: 'Have I put other things (money, success, pleasure) before God?',
          reflection: 'God must be first in our hearts.',
        ),
        ExaminationQuestion(
          question: 'Have I neglected my daily prayers?',
          reflection: 'Prayer is our conversation with God.',
        ),
        ExaminationQuestion(
          question: 'Have I missed Mass on Sunday or Holy Days without serious reason?',
          reflection: 'The Eucharist is the source and summit of our faith.',
        ),
        ExaminationQuestion(
          question: 'Have I practiced superstition, consulted fortune tellers, or used horoscopes seriously?',
          reflection: 'We must trust in God alone, not false sources of guidance.',
        ),
      ],
    ),

    // Second Commandment
    ExaminationCategory(
      title: 'Second Commandment: Reverence for God\'s Name',
      icon: '🙏',
      questions: [
        ExaminationQuestion(
          question: 'Have I used God\'s name in vain or irreverently?',
          reflection: 'God\'s name is holy and deserves our reverence.',
        ),
        ExaminationQuestion(
          question: 'Have I cursed or used profane language?',
          reflection: 'Our words should reflect God\'s love.',
        ),
        ExaminationQuestion(
          question: 'Have I broken vows or promises made to God?',
          reflection: 'Our word should be our bond, especially with God.',
        ),
      ],
    ),

    // Third Commandment
    ExaminationCategory(
      title: 'Third Commandment: Keep Holy the Lord\'s Day',
      icon: '⛪',
      questions: [
        ExaminationQuestion(
          question: 'Have I deliberately missed Mass on Sunday or a Holy Day?',
          reflection: 'Sunday Mass is a sacred obligation.',
        ),
        ExaminationQuestion(
          question: 'Have I performed unnecessary servile work on Sunday?',
          reflection: 'Sunday is a day of rest and worship.',
        ),
        ExaminationQuestion(
          question: 'Have I made Sunday a day of prayer and family?',
          reflection: 'The Lord\'s Day should be set apart for God and loved ones.',
        ),
      ],
    ),

    // Fourth Commandment
    ExaminationCategory(
      title: 'Fourth Commandment: Honor Your Parents',
      icon: '👨‍👩‍👧‍👦',
      questions: [
        ExaminationQuestion(
          question: 'Have I disobeyed or disrespected my parents or guardians?',
          reflection: 'We owe our parents honor and obedience.',
        ),
        ExaminationQuestion(
          question: 'Have I neglected my duties toward my family?',
          reflection: 'Family is a sacred gift from God.',
        ),
        ExaminationQuestion(
          question: 'Have I been patient and kind with elderly or difficult family members?',
          reflection: 'Charity begins at home.',
        ),
        ExaminationQuestion(
          question: 'Have I set a good example for my children or those under my care?',
          reflection: 'We are called to be witnesses of faith.',
        ),
      ],
    ),

    // Fifth Commandment
    ExaminationCategory(
      title: 'Fifth Commandment: Respect for Life',
      icon: '❤️',
      questions: [
        ExaminationQuestion(
          question: 'Have I physically harmed anyone?',
          reflection: 'All life is sacred and deserves protection.',
        ),
        ExaminationQuestion(
          question: 'Have I harbored hatred, anger, or resentment?',
          reflection: 'Anger in the heart is the seed of violence.',
        ),
        ExaminationQuestion(
          question: 'Have I been reckless or endangered others\' safety?',
          reflection: 'We must care for the safety of all.',
        ),
        ExaminationQuestion(
          question: 'Have I abused alcohol, drugs, or food?',
          reflection: 'Our bodies are temples of the Holy Spirit.',
        ),
        ExaminationQuestion(
          question: 'Have I given scandal by my bad example?',
          reflection: 'Our actions can lead others toward or away from God.',
        ),
      ],
    ),

    // Sixth and Ninth Commandments
    ExaminationCategory(
      title: 'Sixth & Ninth Commandments: Purity',
      icon: '💫',
      questions: [
        ExaminationQuestion(
          question: 'Have I committed adultery or been unfaithful to my spouse?',
          reflection: 'Marriage is a sacred covenant.',
        ),
        ExaminationQuestion(
          question: 'Have I engaged in impure thoughts, words, or actions?',
          reflection: 'Purity of heart allows us to see God.',
        ),
        ExaminationQuestion(
          question: 'Have I viewed pornography or other impure material?',
          reflection: 'What we consume affects our souls.',
        ),
        ExaminationQuestion(
          question: 'Have I dressed or acted immodestly?',
          reflection: 'Modesty protects the dignity of the human person.',
        ),
        ExaminationQuestion(
          question: 'Have I respected the dignity of others in my relationships?',
          reflection: 'Every person is made in God\'s image.',
        ),
      ],
    ),

    // Seventh and Tenth Commandments
    ExaminationCategory(
      title: 'Seventh & Tenth Commandments: Justice & Honesty',
      icon: '⚖️',
      questions: [
        ExaminationQuestion(
          question: 'Have I stolen anything or cheated anyone?',
          reflection: 'We must respect others\' property.',
        ),
        ExaminationQuestion(
          question: 'Have I been envious or jealous of others?',
          reflection: 'Envy poisons the soul.',
        ),
        ExaminationQuestion(
          question: 'Have I been greedy or materialistic?',
          reflection: 'We cannot serve both God and money.',
        ),
        ExaminationQuestion(
          question: 'Have I been generous with those in need?',
          reflection: 'What we have is a gift to be shared.',
        ),
        ExaminationQuestion(
          question: 'Have I damaged others\' property or failed to return what I borrowed?',
          reflection: 'Justice requires making amends.',
        ),
      ],
    ),

    // Eighth Commandment
    ExaminationCategory(
      title: 'Eighth Commandment: Truth',
      icon: '🗣️',
      questions: [
        ExaminationQuestion(
          question: 'Have I lied or been deceitful?',
          reflection: 'Truth is the foundation of trust.',
        ),
        ExaminationQuestion(
          question: 'Have I gossiped or spread rumors?',
          reflection: 'Our words can build up or tear down.',
        ),
        ExaminationQuestion(
          question: 'Have I revealed secrets I should have kept?',
          reflection: 'Confidences must be honored.',
        ),
        ExaminationQuestion(
          question: 'Have I judged others rashly or unfairly?',
          reflection: 'Only God knows the heart.',
        ),
        ExaminationQuestion(
          question: 'Have I failed to defend someone\'s good name?',
          reflection: 'We must protect others\' reputations.',
        ),
      ],
    ),

    // Spiritual Life
    ExaminationCategory(
      title: 'Spiritual Life',
      icon: '🕊️',
      questions: [
        ExaminationQuestion(
          question: 'Have I been proud or vain?',
          reflection: 'Pride is the root of all sin.',
        ),
        ExaminationQuestion(
          question: 'Have I been lazy in my spiritual life?',
          reflection: 'Spiritual growth requires effort.',
        ),
        ExaminationQuestion(
          question: 'Have I received Communion in a state of mortal sin?',
          reflection: 'We must be properly disposed to receive the Eucharist.',
        ),
        ExaminationQuestion(
          question: 'Have I made a good confession when needed?',
          reflection: 'Confession is a gift of God\'s mercy.',
        ),
        ExaminationQuestion(
          question: 'Have I read Scripture or spiritual books?',
          reflection: 'God speaks to us through His Word.',
        ),
      ],
    ),

    // Charity & Relationships
    ExaminationCategory(
      title: 'Charity & Relationships',
      icon: '🤝',
      questions: [
        ExaminationQuestion(
          question: 'Have I been selfish or self-centered?',
          reflection: 'Love requires putting others first.',
        ),
        ExaminationQuestion(
          question: 'Have I refused to forgive someone?',
          reflection: 'As we forgive, so we are forgiven.',
        ),
        ExaminationQuestion(
          question: 'Have I been patient and kind with difficult people?',
          reflection: 'Love is patient and kind.',
        ),
        ExaminationQuestion(
          question: 'Have I helped those in need when I could?',
          reflection: 'Whatever we do for the least, we do for Christ.',
        ),
        ExaminationQuestion(
          question: 'Have I been grateful for God\'s blessings?',
          reflection: 'Gratitude opens our hearts to grace.',
        ),
      ],
    ),
  ];
}
