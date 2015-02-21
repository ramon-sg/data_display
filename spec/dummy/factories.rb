FactoryGirl.define do
  factory :user do
    name 'kakashi'
    email 'kakashi@konoha.jp'
    password '000000'
    birthday Date.new(1988, 9, 15)
    admin false
  end
end

FactoryGirl.define do
  factory :article do
    title 'Third Shinobi World War'
    content 'The Third Shinobi World War (Daisanji Ninkai Taisen) is the third of the four shinobi wars that involved the majority of the shinobi villages. It takes place more than ten years prior to the beginning of the series and has been rarely shown in the series outside the Kakashi Gaiden. Because of a decline in national power, the reign of the Five Great Countries was crumbling. Along their borders, skirmishes with smaller nations broke out all the time. The prolonged war gradually spread its fires far and wide, until at last it developed into the Third Shinobi World War. This war turned into an unprecedented war of attrition, tormenting all nations with a shortage of war potential. Not even excluding a great power like Konoha, very young children, some of whom were barely out of the Academy were thrown unto the battlefield, eventually losing their short lives during the war'
  end
end