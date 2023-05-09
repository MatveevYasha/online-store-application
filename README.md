## Пример e-commerce приложения выполненного по ТЗ и макету в Figma как тестовое задание

Ссылка на ТЗ: https://docs.google.com/document/d/1vLBzBt_vZt2VzVBbYJqA0GJJ8z5pVWOLjmZvCknflVk/edit
Ссылка на Figma: https://www.figma.com/file/KqZcU5m3GMxAHwgFkvCONz/ECOMMERCE?type=design&node-id=0%3A1&t=yzQTde7H2kh844Zm-1

## Видео с записью работы приложения:
![demo_video](https://user-images.githubusercontent.com/110323186/237059229-cc539159-2cf1-4fcb-b1bd-a32d23eec0cd.gif)

### Особенности приложения:
1. В приложении используется fake api, который представляет из себя файлы JSON. Мною получение данных выполнено с помощью пакета Dio и json_serializable. Репозитории и модели отделены от слоя UI, что помогает легко изменять данные, не касаясь слоя UI. Для моделей JSON применена кодогенерация.
2. Все картинки, загружаются через пакеты, которые могут их кэшировать, что позволяет снизить поток данных из сети при каждом старте приложения. Если в JSON картинка "битая" приложение подменяет ее заглушкой.
3. В качестве управления состояние применен flutter_bloc.
4. Цвета и текст(в том числе загружены нестандартные шрифты) находятся в отдельных файлах и их легко при необходимости заменить.
5. Используется material 3 тема.
6. При старте приложения появляется splash_screen, который держиться 2 секунды и потом заменяется на home_screen
7. Используются как горизонтальные, так и вертикальные скролы, как части экрана так и всей страницы.
8. Все экраны максимально распределены по виджетам, для удобства разработки и навигации в коде.
