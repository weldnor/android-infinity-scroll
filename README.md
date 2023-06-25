# infinity_scroll


1. Реализовать мобильное приложение для просмотра ленты фотографий с функцией "бесконечной загрузки" и возможностью ставить "лайки" на каждой карточке.

2. Основные функциональные требования

2.1. Лента фотографий
- При первом запуске приложения должна отобразиться лента фотографий, загруженных с выбранного сервиса (например, Flicr).
- При скроллинге ленты до ее конца должны автоматически загружаться новые фотографии (паддинг).
- В ленте на каждой карточке должна быть фотография и кнопка "лайк".
- На каждую фотографию можно перейти в отдельный экран

2.2. Карточка с фотографией
- При нажатии на кнопку "лайк" состояние карточки должно измениться (например, изменение цвета кнопки или отображение счетчика лайков).
- Состояние карточек с фотографиями (в том числе состояние кнопки "лайк") должно сохраняться при скроллинге ленты.

2.3. Просмотр фотографии в полноэкранном режиме
- По клику на карточку с фотографией эта фотография должна открываться в полноэкранном режиме.
- В режиме полноэкранного просмотра должна быть доступна кнопка "лайк". При нажатии на эту кнопку состояние кнопки и карточки фотографии должно измениться.
- При возврате на экран ленты состояние кнопки "лайк" должно мгновенно отобразиться на соответствующей карточке.

2.4. Архитектура приложения
- Желательно использовать архитектуру built_redux, однако можно использовать и BLoC. Работы без архитектуры не будут проверяться.

3. Критерии сдачи
   Проект считается успешно выполненным и готовым к проверке, если:
- Реализованы все функциональные требования, описанные в пунктах 2.1-2.4.
- Разработка приложения выполнена с использованием архитектуры built_redux или BLoC.
- Код проекта чистый, структурированный и написан согласно стандартам и рекомендациям выбранного языка и архитектуры.
- Все элементы пользовательского интерфейса интуитивно понятны и удобны для использования.
- Необходимо прислать ссылку на гит хаб. Там собранное апк + видео обзор приложения по всем сценариям выше
