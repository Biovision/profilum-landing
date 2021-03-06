class CreateSchools < ActiveRecord::Migration[5.1]
  def up
    unless School.table_exists?
      create_table :schools do |t|
        t.timestamps
        t.boolean :visible, default: true, null: false
        t.integer :programs_count, default: 0, null: false
        t.string :name, null: false
        t.string :slug, null: false
      end

      seed_schools
    end
  end

  def down
    if School.table_exists?
      drop_table :schools
    end
  end

  def seed_schools
    School.create(slug: 'd8ce8633-51d7-4764-b1bb-d96ee4fd2647', name: 'Авиамоделирование')
    School.create(slug: '7608f61d-77b5-4d7f-901c-034035055fe2', name: 'Авиационная подготовка')
    School.create(slug: '798c97dc-8940-49fa-ac10-957c19860b21', name: 'Авто и жд - моделирование')
    School.create(slug: '8e769050-d7e1-44f9-98ae-14623879d7d9', name: 'Авто и мотоспорт')
    School.create(slug: '411ba168-7eba-49a2-aa03-41c46fe1c5e9', name: 'Актерское искусство')
    School.create(slug: 'c144a52b-c776-44bb-8d6a-b3806959a721', name: 'Английский язык')
    School.create(slug: 'f9a1ebf2-3bb7-4c81-9cd4-50d35e6da841', name: 'Анимация и мультипликация')
    School.create(slug: '17f0efe8-33a5-4433-b933-1ef37ae8f2c9', name: 'Археология')
    School.create(slug: 'bca717c4-5736-4dd5-b9d6-08d3547093dc', name: 'Архитектура')
    School.create(slug: '4cf4a060-020f-42d4-90b2-b8360da3a6b8', name: 'Астрономия')
    School.create(slug: 'cfedc46d-d4c9-4750-b2de-bc1ca0e91058', name: 'Бальные танцы')
    School.create(slug: '9af48c9b-d386-45ab-9386-29378b4940b0', name: 'Биология')
    School.create(slug: 'db9ae6f2-d7eb-4ad5-89db-41a24904233d', name: 'Биомеханика/Бионика/Аниматроника')
    School.create(slug: '83446c54-5fa4-4e15-9603-7a6e197e73d4', name: 'Боевые искусства (самбо, карате и пр.)')
    School.create(slug: 'd229a41f-9467-4e80-8aac-2f730c761886', name: 'Ботаника')
    School.create(slug: 'fbdaf1eb-8b33-4eeb-a6cc-c97c1755961a', name: 'Веб-дизайн и веб-программирование')
    School.create(slug: '8ed45f3f-2d46-4163-96a5-b750dfb20b09', name: 'Велоспорт')
    School.create(slug: '45f37d2c-7cf9-4936-9b14-e40adcebd97b', name: 'Видеомонтаж')
    School.create(slug: '5a67b40c-7527-4ecf-beb1-93892f17ce04', name: 'Военно-историческая реконструкция')
    School.create(slug: '2666d346-6f70-4f6c-9735-93388fd1c298', name: 'Военно-патриотический клуб')
    School.create(slug: '4aa9241e-344c-47ab-956a-3c6887433ac5', name: 'География')
    School.create(slug: 'a77ceafb-920e-42eb-af0c-bfd0ee4ab2fd', name: 'Геология')
    School.create(slug: '2b72e4ec-f8a4-437a-bf0e-e8311da46461', name: 'Гимнастика и акробатика')
    School.create(slug: '50e7d208-1491-4740-9191-1b117cc6c72d', name: 'Горнолыжный спорт (лыжи, сноуборд)')
    School.create(slug: '25d44aaf-52f7-4d34-96f9-a58c87590a82', name: 'Графический дизайн')
    School.create(slug: 'e5a8cb0c-43ef-4c46-befe-280765a35132', name: 'Гребной спорт')
    School.create(slug: '55e9a460-716b-4ae8-9622-8a63bf3f63af', name: 'Декорирование')
    School.create(slug: '772bb3cd-d8b7-4980-a55c-9872f366abea', name: 'Детский лагерь')
    School.create(slug: '41544c74-9468-46fc-b4a4-07fc7c855acd', name: 'Диджеинг')
    School.create(slug: '3df1ab3d-6d2a-4f30-a43d-6c938560fce3', name: 'Другие иностранные языки')
    School.create(slug: '04458b93-1e61-4f80-887e-3b492a9bff03', name: 'Духовые инструменты')
    School.create(slug: '7c5fb58e-a479-45db-8690-e6602c3a515b', name: 'Живопись')
    School.create(slug: '376f6669-187c-4815-9268-52b9ef347e55', name: 'Журналистика')
    School.create(slug: 'bf876b10-43a3-403f-a5f6-910951809b60', name: 'Игровые виды спорта с клюшкой (хоккей и пр.)')
    School.create(slug: '5de6b1e3-7e88-41b9-98d7-da246b01cafb', name: 'Игровые виды спорта с мячом (футбол, баскетбол и пр.)')
    School.create(slug: '0ebb309e-d68e-493c-93d9-317d4ccba28e', name: 'Игровые виды спорта с ракеткой (теннис и пр.)')
    School.create(slug: 'bfcc533f-0eb3-4a53-b3e8-d36800d6b71b', name: 'Игрушки')
    School.create(slug: '57beff02-0224-43dd-a3c6-330afc9a3cf2', name: 'Изучение ПДД и техники вождения')
    School.create(slug: 'cc505799-ac91-40a8-89f1-1dc50364c824', name: 'Иллюзицизм и фокусы')
    School.create(slug: '7465a679-8175-488c-999c-876ec5070655', name: 'Интеллектуальный спорт (шашки, шахматы и пр.)')
    School.create(slug: '75b080e5-0981-4b93-80d2-139cbee1b5e4', name: 'Информационные технологии')
    School.create(slug: '57e1c5df-53bf-46ef-899a-8294ee6a8dcf', name: 'Йога')
    School.create(slug: 'bb14b4a8-8d0e-4cb2-aada-74d5a89e55a3', name: 'Испанский язык')
    School.create(slug: '4ba8eebb-b940-4fec-8cc9-5976db09879b', name: 'Историческая реконструкция')
    School.create(slug: '3dbe01c9-b979-4b6d-ac9d-d73df33b226e', name: 'История России')
    School.create(slug: 'c5c2ba9e-8bc0-4256-9475-4f32c0506dd5', name: 'Итальянский язык')
    School.create(slug: '52f81c47-d33e-45a9-ac11-208ef383d5c1', name: 'Киноискусство')
    School.create(slug: '9890f982-7201-414f-a1b4-195a72c74867', name: 'Кинология')
    School.create(slug: '03705825-f820-467f-8130-d0f5cf40e5e0', name: 'Китайский язык')
    School.create(slug: 'ca84318f-fdf2-4c0c-b346-1ebfd314a4f6', name: 'Клуб спасателей')
    School.create(slug: '050e3cbd-dbaa-49ba-9eb9-cce2d3cdefc3', name: 'Книжное дело')
    School.create(slug: '0c19adf4-0a3d-4678-9f39-b152cff5cf67', name: 'Композиция')
    School.create(slug: '070cc20b-e0a0-458f-9a81-57c8e566e76f', name: 'Компьютерная анимация')
    School.create(slug: '882ec28c-15b4-4d1a-bb83-c27c969191ba', name: 'Компьютерная музыка')
    School.create(slug: '80b2d3cd-8a23-4593-89dd-22d405471802', name: 'Компьютерный дизайн')
    School.create(slug: '3b73505a-2438-4b91-804e-45fd52476746', name: 'Конный спорт')
    School.create(slug: 'f662a84e-69be-4af1-bd40-e9a0c780269d', name: 'Конькобежный спорт (ролики и коньки)')
    School.create(slug: '0f599e4a-e66f-43c6-a36f-d50558419506', name: 'Краеведение')
    School.create(slug: '58c994f6-5a60-4dae-bde8-2fc1623eb3b7', name: 'Кройка и шитье')
    School.create(slug: '88ccfa95-c441-4c36-9ce9-f57cf89e5660', name: 'Кулинария')
    School.create(slug: 'c8e03021-00c3-42ca-b8d4-685d04c779a0', name: 'Культура речи')
    School.create(slug: 'c77f7698-1aa7-47f2-988a-06562eb01c0c', name: 'Культуры народов мира')
    School.create(slug: 'c3254566-9e30-4e2a-b1b4-ff7f7fc06605', name: 'Ландшафтный дизайн')
    School.create(slug: 'aee77998-71eb-4cf7-9170-d305aaba7436', name: 'Легкая атлетика')
    School.create(slug: '5f05f389-8073-404e-b026-591d35cfaa0e', name: 'Лепка и керамика')
    School.create(slug: '5c5bce4c-6d64-4072-9da5-228b669dbfbf', name: 'Лечебная физическая культура')
    School.create(slug: '3a8324d3-ab5c-445f-9b53-93b7ccf1f3f0', name: 'Литературный клуб')
    School.create(slug: '998cd433-18e6-4d75-9ced-913a644ef52f', name: 'Литературоведение')
    School.create(slug: 'f32ed484-7742-4224-a2c1-b299b2d811cd', name: 'Маркетинг')
    School.create(slug: 'ab2d2ed4-2cb4-4826-8e37-0307e93ddfaa', name: 'Математика')
    School.create(slug: '455e8e0c-9f8a-4116-8fb5-9e1aaa79690a', name: 'Медицина')
    School.create(slug: 'eadcb076-ba49-4a78-884c-1fd82caa4a7e', name: 'Менеджмент')
    School.create(slug: 'dcc75480-3bf7-4bc2-94dc-c2cea3e16d94', name: 'Мировая история')
    School.create(slug: 'fe71ae9c-d184-45ea-926b-9d3a70ffa431', name: 'Моделирование одежды')
    School.create(slug: 'f7f01216-923a-46f2-94cb-977d6bf2598f', name: 'Морское дело')
    School.create(slug: 'e116f160-4147-4077-8a39-87c3352a07a3', name: 'Москвоведение')
    School.create(slug: '271570bd-46a7-4552-89fe-5a98dc8c6c64', name: 'Музейное дело')
    School.create(slug: '752fdd82-7fef-4ba9-8934-2db9ebae8c45', name: 'Музыковедение')
    School.create(slug: 'bea94dda-161f-456c-ae20-626862e66757', name: 'Народные инструменты')
    School.create(slug: '233aec98-42f8-430c-88eb-b155df97582e', name: 'Народные промыслы')
    School.create(slug: '203e13f9-aa1a-4cb1-abf4-89f3e65c3c0e', name: 'Народные танцы')
    School.create(slug: '9b82c95e-953f-4373-a0b9-154cbd68fe82', name: 'Научные клубы')
    School.create(slug: '1ba0ea28-400c-448a-8e94-06976a3bc53e', name: 'Немецкий язык')
    School.create(slug: '94fe01c9-e1b9-45f3-b905-6d7d01019926', name: 'Образный театр (кукол/теней/пантомима)')
    School.create(slug: '5b3c8170-3d28-4f08-98ba-72708dfeaa76', name: 'Операторское мастерство')
    School.create(slug: '3f966f8e-b906-4bf6-ad84-0e9d1290baa8', name: 'Основы культурологии')
    School.create(slug: '2f25c076-b612-4157-8e87-2c95cc1c4a6e', name: 'Основы моды')
    School.create(slug: 'ae8a0561-5961-4ffe-85ef-0544a7eb2bd4', name: 'Парикмахерское искусство')
    School.create(slug: 'ed53a333-c67d-4935-b806-5b137932c65d', name: 'Пение и вокал')
    School.create(slug: 'b78730fb-fbf0-48d1-a0cd-e3b5566f60c7', name: 'Плавание')
    School.create(slug: '6b3d8d82-8bfc-4943-86f2-ea49f3f34bd4', name: 'Подготовка к школе')
    School.create(slug: 'bfe4efab-6b45-47dc-82ab-c1e42985bedb', name: 'Поделки из природных материалов')
    School.create(slug: '146482bd-e2d1-4728-8dcf-eaa228d29acd', name: 'Поэтика')
    School.create(slug: '106fb74e-d127-4358-8738-9da0385df85f', name: 'Предпринимательство и бизнес')
    School.create(slug: '9f18a43c-1426-441f-be7f-bdbd88070be1', name: 'Природоведние и натурализм')
    School.create(slug: '0d50e713-fd05-43d8-9ce3-4ee11c0dec27', name: 'Программирование')
    School.create(slug: 'c379ece8-fb83-4cc1-b86a-ec6ce15df50c', name: 'Проектная работа')
    School.create(slug: 'c9a73916-e4e4-4bf1-9333-0532e9c51dac', name: 'Промышленный дизайн')
    School.create(slug: 'b39b7b58-2f71-47d9-89cb-8f92e58c77e2', name: 'Прототипирование и моделирование')
    School.create(slug: 'eedf0c5b-b911-4df1-a35a-a9d45f6c357b', name: 'Психология')
    School.create(slug: 'cea36b03-0375-451a-a64d-393d3df30f94', name: 'Радиоэлектроника')
    School.create(slug: '4cc7cda9-c2b4-4314-9be9-9b3ec28e2a88', name: 'Развитие логического мышления')
    School.create(slug: '71aabecf-38f8-4cbb-ab55-8543c0d4f8ad', name: 'Ракетное моделирование')
    School.create(slug: '7b758247-12d6-473f-8c30-ea3a5f76fdc5', name: 'Ритмика')
    School.create(slug: 'a49052ca-3321-4fc5-acac-8c234a311ae3', name: 'Робототехника')
    School.create(slug: 'f6e8a7b2-07c9-4e96-9f57-bd5eafae73e9', name: 'Рукоделие (вязание, шитье и пр.)')
    School.create(slug: 'e32c0f0f-dea5-4719-b19b-e8fda7a0020d', name: 'Русский язык')
    School.create(slug: '067db8ed-33fa-4dc6-97fa-b0b29f62c60a', name: 'Скорочтение')
    School.create(slug: '370d635b-f370-4152-aaf6-5c3a7c72ee3f', name: 'Скульптура')
    School.create(slug: 'a375ab94-21cc-40eb-89f4-7a7f4779b61f', name: 'Современные танцы')
    School.create(slug: 'c58b0353-1837-4da0-8fc9-2137605bb098', name: 'Социология')
    School.create(slug: '02f4483f-eff6-4af8-9e84-eee90b687b49', name: 'Стилистика и визаж')
    School.create(slug: '5f65eb0f-2b1d-4501-b834-ae3560700e8e', name: 'Столярное дело')
    School.create(slug: '1ea71590-4a18-4719-a6ec-f17746fbcf0b', name: 'Страноведение')
    School.create(slug: 'caf9b51e-381f-4b47-bcc0-862a9945b47c', name: 'Стрелковый спорт')
    School.create(slug: '492a8068-62c0-4a45-b24e-14b451290005', name: 'Струнные инструменты')
    School.create(slug: '47dd893f-3bee-46e6-9e8d-16cb65b40f74', name: 'Судомоделирование')
    School.create(slug: 'e1326b6f-cd4b-4753-b9ca-b17a4fc4f15d', name: 'Сценическая речь')
    School.create(slug: '39ab070c-3862-4053-88cc-ae8e2059fa6c', name: 'Телевидение')
    School.create(slug: 'c35f068e-8818-4533-8e7d-d7b3601420b0', name: 'Трехмерное моделирование и 3D-печать')
    School.create(slug: 'ed2a5fec-288e-42c3-9d7e-79e4d6135b8a', name: 'Туризм')
    School.create(slug: '6d68e23a-21c8-44c3-95c9-c8d4700c9215', name: 'Тяжелая атлетика')
    School.create(slug: '8efec7de-ff92-433d-b440-e12688e7a591', name: 'Ударные инструменты')
    School.create(slug: '1b58b079-93fa-42d6-a067-6c45dc29f250', name: 'Фехтование')
    School.create(slug: 'bd20964d-4304-442e-86a8-d0ddfab904d8', name: 'Фигурное катание')
    School.create(slug: '3c0af3be-330e-4109-afa9-2d174fbf648c', name: 'Физика')
    School.create(slug: '584e9e5f-bf21-4d6c-9642-d9a24cd3e167', name: 'Финансовая грамотность')
    School.create(slug: '30519ddc-ccd1-4427-9a7f-f30720c68d90', name: 'Флористика')
    School.create(slug: '98f36a9b-f12a-4f4c-9ef4-490b0eeda94f', name: 'Фольклор')
    School.create(slug: 'f89680da-60c4-4710-bf69-d17455149683', name: 'Фортепиано')
    School.create(slug: '89ca3268-a845-40df-b639-66e13d64d66d', name: 'Фотография')
    School.create(slug: '15124d2a-a3c3-45d5-8909-0e446c24a383', name: 'Французкий язык')
    School.create(slug: '2bee3860-5262-4984-b48c-f7ca2ae1af9e', name: 'Химия')
    School.create(slug: '39438e41-51c9-467c-a7a4-7b601557764c', name: 'Художественные материалы (оригами, мозаика и пр.)')
    School.create(slug: '0eb0e9dc-784b-4391-b003-5d774353d628', name: 'Цирковое творчество и искусство')
    School.create(slug: '7c704744-7762-4105-b70f-5d050ab8cae6', name: 'Школа выживания')
    School.create(slug: '85f995cc-f20d-465b-bbcf-15cb87c0f8eb', name: 'Экзотические животные, аквариумы')
    School.create(slug: '779a02e2-69ba-4c32-825a-c11ce18e93e4', name: 'Экология')
    School.create(slug: '530b6b1d-efb7-46f0-b2cd-b3f7fa950b82', name: 'Экономика')
    School.create(slug: '21f62e06-0d70-473a-8963-ec6ab6bf3f2e', name: 'Экстремальные виды спорта (альпинизм, скалолазание и пр.)')
    School.create(slug: '44d311b4-7d7f-49c8-9817-af674a92c60c', name: 'Электроника и электротехника')
    School.create(slug: 'e26976ca-9897-4861-b41e-73fb78ee7340', name: 'Энергоэффективность')
    School.create(slug: 'e347fde1-b2aa-4346-a6b2-17a6ffc73277', name: 'Этнография')
    School.create(slug: '4e3e1c35-d503-40ba-9314-6e4fb3c1cb8a', name: 'Ювелирное дело')
    School.create(slug: '56c3f00c-592c-4b15-b596-99d0344debf9', name: 'Юриспруденция')
    School.create(slug: '89724f44-2313-43cf-80bb-1177d26af722', name: 'Языкознание и филология')
    School.create(slug: '32e29986-c2b8-4b86-849d-82b0f67ec405', name: 'Японский язык')
  end
end
