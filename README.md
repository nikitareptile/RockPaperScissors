# Игра "Камень, ножницы, бумага"
Первый проект, целью которого было написание простого игрового приложения, с минимальной загрузкой интерфейса, но самобытностью.

Приложение написано на чистом SwiftUI без применения каких-либо сторонних библиотек.
Так как проект первый и логика игры довольно проста, я не выбирал какую-либо из существующих архитектур, а создавал так, как чувствовал.

Одноэкранная модель реализации подошла лучше всего, так как обильное количество действий отвлечёт пользователя от основной сути – сражения с ИИ.

![Main screen](https://i.ibb.co/F86Kp21/1-screen-main.png) ![Colored indicator](https://i.ibb.co/4ZMnZf0/2-screen-main.png)

Сохранение **highscore** реализовано через UserDefaults, поэтому после перезапуска приложения тот прогресс, которого достиг пользователь, не пропадает.

![](https://i.ibb.co/S7Cp3XG/3-screen-main.png) ![](https://i.ibb.co/Gvnybdj/4-screen-main.png)

После хода игрока, который происходит после нажатия на камень, ножницы или бумагу, автоматически выбирается случайный ответ ИИ, а затем проверка на результат схватки.