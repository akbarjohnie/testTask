# test_task_friflex

1.) На данный момент корректно работает второй скрин (нынешняя погода), если правильно ввести название города на английском.

Если попытаться перейти на второй скрин с пустым тексовым полем, появится снекбар, который укажет на то, что нужно ввести название города (переход на вторую страницу не будет осуществлён), однако введя хоть что-то (например "abs"), переход произойдёт, но будет красный экран с "Null check operation used on a null value", связано с тем, что на втором скрине в "additionalInfo" указан "!".

С некоторыми городами даже при правильном вводе выдаётся ошибка, как например с 'Dubai'. 

Избежать красного экрана с ошибкой можно прямо сейчас с помощью заключения виджета с отображением информации в "if-else", где в случае получения "null", вместо данных, отобразим скрин с ошибкой.

Либо позже используя StateManagement сделать всё более деликатно.

2.) У меня пока что не получается правильно использовать "few_days_weather_api_client.dart" и "few_days_weather_model.dart" (запрос к погодному апи и модель из генератора json --> dart), поэтому на третьем скрине пока что не отображается какая-либо информация полученная из запроса и в данный момент там находятся значения указанные вручную 

3.) В данный момент не реализован никакой State Management 
    И от части из-за этого передача "city" из первого скрина реализована далеко не лучшим образом.