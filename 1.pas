uses CRT;
//Заданная функция
function f(x:real): real; 
begin
  f:=1 * power(x,3) + (-2) * power(x,2) +(-5)*x +(17);                  
end;
//Функция интеграла
function f1(x:real): real;
begin
  f1:=(x*(3*power(x,3)-8*sqr(x)-30*x+204))/12;         
end;
//Процедура ввода данных
procedure vvod(var a,b:real; var n:integer);
begin
  repeat
writeln('Введите левую границу интервала от -5 до 0');
readln(a);
until (a>=-5)and(a<=0);
repeat
writeln('Введите правую границу интервала от 0 до 5');
readln(b);
until (b>=0)and(b>a)and(b<=5);
repeat
writeln('Введите число разбиений');
readln(n);
until (n>0);
end;
//Процедура площади
procedure sp(var a,b:real; var n:integer; var h,s,y:real);
var i:integer;
begin
  h:=(b - a) / n;
  s:=(f(a) + f(b)) / 2;
  for i:= 1 to n - 1 do s:=s + f(a + i * h);
  s:= s * h;
  y:= f1(b) - f1(a);
end;
//Процедура определенного интегралла
procedure integral(var a,b,dx,x,y:real;n:integer);
begin
dx:= (b - a) / n;
y:= 0;
x:= a;
while x < b do
begin
  y:= y + f(x);
  x:= x + dx;
  end;
  y:= y * dx;
  writeln('Определенный интеграл = ', y: 10: 3);
end;
//Процедура case-меню
procedure casemenu(var a: integer);
begin
  CLRSCR;
  writeln('Выберите действие: ');
  writeln('1 - Ввод данных ');
  writeln('2 - Вывод площади ');
  writeln('3 - Вывод определенного интегралла ');
  writeln('4 - Вывод абсолютной погрешности ');
  writeln('5 - Относительная погрешность ');
  writeln('6 - Выход');
  read(a);
  CLRSCR;
end;
//Начало программы
var a,b,h,s,y,x:real;
  n,i,z: integer;
begin
  casemenu(z); 
  textcolor(blue);
  while true do
  begin
    case z of
      1: begin vvod(a,b,n); sp(a,b,n,h,s,y); casemenu(z); end;
      2: begin writeln('Площадь = ', s:0:5); READKEY; casemenu(z); end;
      3: begin writeln('Определенный интеграл = ', y: 10: 3); READKEY; casemenu(z); end;
      4: begin writeln('Абсолютная погрешность = ', abs(y - s):0:5); READKEY; casemenu(z); end;
      5: begin writeln('Относительная погрешность = ', abs(y - s) / y); READKEY; casemenu(z); end;
      6: begin writeln('Нажмите Enter чтобы выйти из приложения...'); READKEY; exit; end;
    end;
  end;
end.
