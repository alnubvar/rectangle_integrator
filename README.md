# RectangleIntegrator

rectangle_integrator - это gem для численного интегрирования по формуле левых, средних и правых прямоугольников.
Используется для приближённого вычисления определённых интегралов и погрешностей.

## Установка

Для установки `rectangle_integrator` выполните следующие шаги:

1) Убедитесь, что установлен Ruby
```bash
ruby -v
```
Если Ruby установлен, эта команда выведет в консоль номер версии

2) Установите `Gem`:

```bash
gem install rectangle_integrator
```
3) Если вы используете `Bundler` для управления зависимостями вашего проекта, то установить `rectangle_integrator` можно по-другому. 
Поместите в ваш `Gemfile` следующее:

```ruby
gem 'rectangle_integrator', '~> 0.1.0'
```
А затем используйте команду `bundle`:

```bash
bundle install
```
4) Второй и третий пункты приведут к одному и тому же результату - вы установите `rectangle_integrator`.
После установки вы можете ипользовать его в вашем проекте:

```ruby
require "rectangle_integrator"

#ваш код, использующий возможности rectangle_integrator
```

## Использование

Чтобы определить интеграл, который нужно вычислить, необходимо создать объект класса `RectangleIntegrator::IntegralSolver`.

Синтаксис: `RectangleIntegrator::IntegralSolver.new(some_function, left_boundary, right_boundary)`. 

`some_function` - анонимная функция/процедура, к которой возможно применить вызов `some_function.call()` и которая возвращает некоторое численное значение.

`left_boundary`, `right_boundary` - пределы интегрирования, причем `left_boundary` < `right_boundary`.

Пример:
```ruby
require "rectangle_integrator"

#Определили интеграл функции x^2 от 0 до 1
integral_to_solve1 = RectangleIntegrator::IntegralSolver.new(->(x) {x**2}, 0, 1)

#Определили интеграл функции sin(x) от 0 до PI
integral_to_solve2 = RectangleIntegrator::IntegralSolver.new(lambda {|x| Math.sin(x)}, 0, Math::PI)

#Определили интеграл функции log(x^2+2x+3) от 0 до 3
function_to_call = Proc.new{|x| Math.log(x**2+2*x+3)}
integral_to_solve3 = RectangleIntegrator::IntegralSolver.new(function_to_call, 0, 3)
```
Теперь для вычисления интеграла достаточно вызвать один из методов: `left_rectangle`, `right_rectangle`, `mid_rectangle`.

Синтаксис: Методы вызываются без параметров.

Пример:

```ruby
require "rectangle_integrator"

#Определили интеграл функции sin(x) от 0 до Pi
integral_to_solve2 = RectangleIntegrator::IntegralSolver.new(lambda {|x| Math.sin(x)}, 0, Math::PI)

puts integral_to_solve2.left_rectangle # результат 0.0
puts integral_to_solve2.right_rectangle # результат 3.8473413874435795e-16 - близко к 0
puts integral_to_solve2.mid_rectangle # результат 3.141592653589793, то есть PI
```
Возможно вывести в консоль результаты выполнения всех трех функций с вычисленными погрешностями. Для этого используем метод `print_results`.

Синтаксис: `print_results(integer)`. 

`integer` - это число разбиений изначального отрезка интегрирования на промежутки, в которых будут вичисляться производные подынтегральной функции. Этот процесс необходим для вычисления погрешности. Большее количество разбиений позволит точнее вычислить погрешность.

```ruby
require "rectangle_integrator"

#Определили интеграл функции sin(x) от 0 до Pi
integral_to_solve2 = RectangleIntegrator::IntegralSolver.new(lambda {|x| Math.sin(x)}, 0, Math::PI)

#Вызвали метод print_results, который выводит результаты вычислений и погрешности
integral_to_solve2.print_results(500)
```
Результат

```bash
"Интегрирование на интервале [0, 3.141592653589793] с 500 прямоугольником(ами)
--------------------------------------------------         
Левый прямоугольник: 0.0 | Погрешность ≤ 0.0098696044      
Правый прямоугольник: 0.0 | Погрешность ≤ 0.0098696044     
Средний прямоугольник: 3.1415926536 | Погрешность ≤ 5.1677e-06"
```


## Структура
Основной программный код находится в `lib/rectangle_integrator.rb`. В этой же папке в файле `error_estimator.rb` описан модуль `ErrorEstimator`, содержащий функции для вычисления погрешностей численных методов `right_rectangle`, `left_rectangle` и `mid_rectangle`.  

В ходе разработки возникла естественная потребность в тестировании функций. Все тесты расположены в `/test/test_rectangle_integrator.rb`.
Все желающие могут ознакомиться с тестами, скачав открытый код на свое локальное устройство. 

Запустить тесты можо при помощи команды:
```bash
rake test
```

## Лицензия

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
