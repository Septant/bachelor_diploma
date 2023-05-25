
<h1 align="center"> Выпускная квалификационная работа 2023 </h1>

## Содержание репозитория:
* [Модель](./adaptive_observer_for_sin_signal_original.slx).

* [Стартер метода адаптивного оценщика](./variables2n1.m).

* [Генератор величин L, C, A, $\delta$](./LCAD.m).

* [Генератор спектра собственных значений](./eigs.m).

* [Стартер метода построения регрессионной модели с ДРСР](./starter3.m).

* [Скрипт отрисовки графиков](./plot_pres4.m).

* [Вызов скрипта отрисовки](./graphs.m).

* [Обработчик полученных данных с калькулятором $RMSE_{mean}$](./stats.m).

* [Фильтр по времени переходного процесса](./selectionsToCheck.m).

* [Вычислитель времени переходного процесса](./transTime.m).

* [Вычислитель времени переходного процесса для разных значений radius](./transTimeR.m).

## Как работать?
0. Склонировать репозиторий
1. Запустить матлаб, запустить [стартер метода-оппонента(DREM).](./starter3.m).
2. Запустить Simulink, загрузить [Модель](./adaptive_observer_for_sin_signal_original.slx).
3. В Simulink, в разделе Modeling, панель Design выбрать "Model Workspace".
4. Убедиться в том, что в Data Source -> в File name указан путь до  [стартер метода адаптивного оценщика](./variables2n1.m). Если нет - нажать Browse и указать путь.
5. В случае изменения в [стартере метода адаптивного оценщика](./variables2n1.m) нажать "Reinitialize from Source" для подгрузки изменений в модель.
6. Запустить модель.
7. Полученные измерения частот сохранять в блоке "To File". Имя сохраняемой переменной <<approx_data>>.

Модель и сопутствующие скрипты построены на версии Matlab R2021b.

* График bigOmega отображает значения исходного\смоделированного сигналов и оценки частот соответственно.
* Блок Original Signal отвечает за модуляцию подаваемого сигнала, Proposed estimator строит оценки частот и осциллятора z по методу прямой оценки частот с применением адаптивного наблюдателя. 
* Для проведения множественных симуляций раскомментировать дублирующие блоки, в их внутренних блоках вписать изменённые величины. Для симуляций с несколькими значениями \mu можно реинициализировать в стартере массивом 1xn и обратиться к нужным значения в блоках mu модели по соответствующему индексу.
  
