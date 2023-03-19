program Sudoku;
uses crt, sysutils;
const n = 9;
const ruta = 'C:\Ficheros\';
type matriz = array[1..n,1..n] of Integer;
var
 opc, opcc, salir, atras: integer;
 a, b, c,d, w,h,v,s: matriz;   //
 dif, ayud, error, tipo: Integer;
 user : string;




////////////////////// PROCEDIMIENTOS PARA GUARDAR Y CARGAR DE FICHEROS ///////
{VARIABLES QUE SE GUARDAN
DIF AYUD ERROR TIPO USER
MATRICES}

function Comprueba(nombre: String): boolean;
var
    f: text;
    c : string;
begin

    c := ruta + nombre + '.txt';
    assign(f,c);
    {$I-}
    reset(f);
    {$I+}
    if (IOResult = 0) then
    begin
        close(f);
        Comprueba:=true;
    end
    else
        Comprueba:=false;
end;

procedure guardar_matriz(A : matriz; var f : text);
var
  i,j: integer;
begin
  writeln(f,'');
  For i := 1 to n do
   begin
    For j := 1 to n do
      begin
       write(f,A[i,j]);
      end;
    writeln(f,'');
   end;
end;


procedure cargar_matriz(var A : matriz; var f : text);
var
  i,j: integer;
  l : string;
  w : char;
  c : integer;
begin
  readln(f,l);
  For i := 1 to n do
   begin
    For j := 1 to n do
      begin
       read(f,w);
       Val(w,A[i,j],c);
      end;
    readln(f,l);
   end;
end;


procedure guardar_datos;
var
 f: text;
 r: string;
  begin
    r := ruta + user + '.txt';
    assign(f,r);
    rewrite(f);
    writeln(f,user);
    writeln(f,dif);
    writeln(f,ayud);
    writeln(f,error);
    writeln(f,tipo);
    guardar_matriz(a,f);
    guardar_matriz(b,f);
    guardar_matriz(c,f);
    guardar_matriz(d,f);
    guardar_matriz(w,f);
    guardar_matriz(h,f);
    guardar_matriz(v,f);
    //mostrar_todos_datos;
    writeln('Se guardaron Todos los datos exitosamente!');
    readkey;
    close(f);
  end;

procedure cargar_datos;
var
 f: text;
 r: string;
  begin
    r := ruta + user + '.txt';
    assign(f,r);
    reset(f);
    readln(f,user);
    readln(f,dif);
    readln(f,ayud);
    readln(f,error);
    readln(f,tipo);
    cargar_matriz(a,f);
    cargar_matriz(b,f);
    cargar_matriz(c,f);
    cargar_matriz(d,f);
    cargar_matriz(w,f);
    cargar_matriz(h,f);
    cargar_matriz(v,f);
    //mostrar_todos_datos;
    writeln('Se cargaron Todos los datos exitosamente!');
    readkey;
    close(f);
  end;

procedure guardar_partida;
var o : integer;
begin
  If (Comprueba(user)) then
    begin
     writeln('Ya existe una partida guardada para este usario.');
     writeln('Desea Sobre-escribir dicha partida ?');
     writeln('Si');
     writeln('No');
     readln(o);
     if (o = 1) then
      begin
        guardar_datos;
      end;
    end
    else
      begin
       writeln('No existe partida para dicho usuario');
       writeln('Desea crear una nueva partida ?');
       writeln('Si');
       writeln('No');
       readln(o);
       if (o = 1) then
         begin
           guardar_datos;
         end;
      end;
end;

////////////////////////////CARGAR//////////////////////////////////////////////

procedure cargar_partida;
var o : integer;
begin
  If (Comprueba(user)) then
    begin
     writeln('Ya existe una partida guardada para este usario.');
     writeln('Desea Cargar dicha partida ?');
     writeln('1. Si');
     writeln('2. No');
     readln(o);
     if (o = 1) then
      begin
        cargar_datos;
      end;
    end
    else
      begin
       writeln('No existe partida para dicho usuario');
      end;
end;



//////////////////////////// FUNCIONES Y PROCEDIMIENTOS LOGICOS ///////////////


///////////////////////////////// NOMBRE DEL USUARIO //////////////////////////

function mayuscu(s:string): string;   ///// ESTA FUNCION NOS CONVIERTE EN MAYUSCULA TODAS LAS LETRAS
var i: integer;                      ///// DEL NOMBRE DEL USUARIO.
begin
     for i:=1 to length(s) do
       s[i] := Upcase(s[i]);
       mayuscu := s;
end;

procedure name(var user:string);               /// PROCEDIMIENTO PARA PEDIR EL NOMBRE DEL USUARIO
 var
 salirmenu, salirmenu_2 : integer;
 a, b, sal, sall: char;
 letra_user, numero_user, nombremayus : string;

begin
  letra_user := '';
  numero_user := '';
  salirmenu := 0;
  salirmenu_2 := 0;
  writeln('***************************************************************');
  writeln('* Bienvenido, para empezar deberas crear tu nombre de usuario *');
  writeln('*                                                             *');
  writeln('***************************************************************');
  writeln;
  writeln('                Presione ENTER para continuar');
  readln;
  clrscr;
   writeln('****************************************************************');
   writeln('*   Tu nombre de usuario debe contener 10 letras y 4 numeros.  *');
   writeln('*          Puedes aplicar los espacios que desees.             *');
   writeln('*                                                              *');
   writeln('****************************************************************');
   writeln;
   writeln('                Presione ENTER para continuar');
   readln;
   clrscr;
   writeln('***********************************************************************');
   writeln('*      Comencemos con las letras, debes introducirlas 1 a la vez.     *');
   writeln('* Si ingresas mas de una letra, solo sera tomada en cuenta la primera *');
   writeln('*                                                                     *');
   writeln('***********************************************************************');
   writeln;
   writeln('                   Presione ENTER para continuar   ');
   readln;
  repeat
     repeat
         begin
           clrscr;
           textcolor(14);writeln('Tu nombre de usuario es '); textcolor(11); write(letra_user); textcolor(white);
           writeln;
           textcolor(9);writeln('Longitud total = '); textcolor(white);writeln(salirmenu);
           writeln;writeln;
           writeln('Introduce una letra');
           readln(a);
             case a of
                  ' ': begin
                         letra_user := letra_user + a;
                       end;
   'A'..'Z', 'a'..'z': begin
                         salirmenu := salirmenu + 1;
                         letra_user := letra_user + a;
                       end;
             '0'..'9': begin
                       writeln('No escribas numeros todavia');
                       readln;
                       end;
   '+', '-', '*', '/': begin
                       writeln('No estan permitidos los operadores');
                       readln;
                       end
                else
                 begin
                   writeln('No estas cumpliendo con las instrucciones');
                   readln;
                 end;
             end;
       end;

     until (salirmenu = 10);

       nombremayus := mayuscu(letra_user);
          repeat
               clrscr;
                   writeln('*******************************************');
   textcolor(14);  writeln('           Tu nombre de usuario es '); textcolor(2);
                   write('                 ',nombremayus); textcolor(white);
                   writeln;
                   writeln;
   textcolor(14);  writeln('  Deseas repetir las letras de tu nombre? ');
                   writeln();
   textcolor(6);   writeln('               1) SI)     2) NO)'); textcolor(white);
                   writeln;
                   writeln('********************************************');
                   writeln;
               readln(sal);
          until(sal = '2') or (sal = '1');
         if sal = '1' then
           begin
             salirmenu := 0;
             letra_user := ' ';

           end;
   until(sal = '2');
   clrscr;
   writeln('********************************************************************');
   writeln('*  Ahora deberas introducir los numeros para tu nombre de usuario  *');
   writeln('*         Puedes aplicar los espacios que desees.                  *');
   writeln('*                                                                  *');
   writeln('********************************************************************');
   writeln;
   writeln('                Presione ENTER para continuar');
   readln;
   clrscr;

   repeat
     repeat
      clrscr;
       textcolor(14);writeln('Los numeros de tu usuario son '); textcolor(11); writeln(numero_user); textcolor(white);
       writeln;
           textcolor(9);writeln('Longitud total = '); textcolor(white);writeln(salirmenu_2);
           writeln;writeln;
       writeln('Introduce el primer numero para tu usuario');
       readln(b);
          case b of
                        ' ': begin
                             numero_user := numero_user + b;
                             end;
          'A'..'Z','a'..'z': begin
                             writeln('No introduzcas letras');
                             readln;
                             end;
                   '0'..'9':begin
                             numero_user := numero_user + b;
                             salirmenu_2 := salirmenu_2+ 1;
                            end
             else
                begin
                  writeln('No estas siguiendo las instrucciones');
                  readln;
                end;
          end;
      until (salirmenu_2= 4);

                   repeat
                   clrscr;
                   writeln('*******************************************');
   textcolor(14);  writeln('         Los numeros para tu usuario es '); textcolor(2);
                   write('                    ',numero_user); textcolor(white);
                   writeln;
                   writeln;
   textcolor(14);  writeln('  Deseas repetir las numeros de tu nombre? ');
                   writeln();
   textcolor(6);   writeln('               1) SI)     2) NO)'); textcolor(white);
                   writeln;
                   writeln('********************************************');
                   writeln;
                   readln(sall);
                   until(sall = '2') or (sall = '1');
                       if sall = '1' then
                         begin
                           salirmenu_2 := 0;
                           numero_user := ' ';
                         end;

       until (sall = '2');
       user := nombremayus + numero_user;

      clrscr;
              writeln('********************************************************');
              writeln('               El nombre final de usuario es ');
textcolor(14); writeln('                     ',user); textcolor(white);
              writeln;
              writeln('********************************************************');
              readln;
end;


//////////////////////////////////////////////////////////////////////////////

/////////////////////////////// LLENADO DEL SUDOKU /////////////////////////

Procedure llenar_sudoku(y1,y2,y3,y4,y5,y6,y7,y8,y9 : integer);
var
  i,j:integer;
  begin
    for i := 1 to 9 do
      for j := 1 to 9 do
        begin
          case i of
            1: begin
               a[i,j] := (y1 mod 10);
               y1 := y1 div 10;
               end;
            2: begin
               a[i,j] := (y2 mod 10);
               y2 := y2 div 10;
               end;
            3: begin
               a[i,j] := (y3 mod 10);
               y3 := y3 div 10;
               end;
            4: begin
               a[i,j] := (y4 mod 10);
               y4 := y4 div 10;
               end;
            5: begin
               a[i,j] := (y5 mod 10);
               y5 := y5 div 10;
               end;
            6: begin
               a[i,j] := (y6 mod 10);
               y6 := y6 div 10;
               end;
            7: begin
               a[i,j] := (y7 mod 10);
               y7 := y7 div 10;
               end;
            8: begin
               a[i,j] := (y8 mod 10);
               y8 := y8 div 10;
               end;
            9: begin
               a[i,j] := (y9 mod 10);
               y9 := y9 div 10;
               end;
           end;
        end;
  end;

Procedure voltear_numeros(var y1,y2,y3,y4,y5,y6,y7,y8,y9 : integer);  // VOLTEAR LOS NUMEROS
var
 cont,y,aux : integer;

 begin

  for cont := 1 to 9 do
    begin
     case cont of
      1: y := y1;
      2: y := y2;
      3: y := y3;
      4: y := y4;
      5: y := y5;
      6: y := y6;
      7: y := y7;
      8: y := y8;
      9: y := y9;
     end;
     aux := 0;
     while (y > 0) do
      begin
       aux := aux + (y mod 10);
       if not(y < 10) then
        aux := aux * 10;
       y := y div 10;
      end;
     case cont of
      1: y1 := aux;
      2: y2 := aux;
      3: y3 := aux;
      4: y4 := aux;
      5: y5 := aux;
      6: y6 := aux;
      7: y7 := aux;
      8: y8 := aux;
      9: y9 := aux;
     end;
    end;
 end;

Procedure Generar_Sudoku();     // PARA GENERAR EL SUDOKU ALEATORIO
var
x: integer;
y1,y2,y3,y4,y5,y6,y7,y8,y9 : integer;
  begin
   randomize;
   x := random(4);
   case x of
     0: begin
        y1 := 534678912;
        y2 := 672195348;
        y3 := 198342567;
        y4 := 859761423;
        y5 := 426853791;
        y6 := 713924856;
        y7 := 961537284;
        y8 := 287419635;
        y9 := 345286179;
        end;
     1: begin
        y1 :=413825679 ;
        y2 :=567149832 ;
        y3 :=289736145 ;
        y4 :=195462783 ;
        y5 :=726983514 ;
        y6 :=348517296 ;
        y7 :=851694327 ;
        y8 :=972358461 ;
        y9 :=634271958 ;
        end;
     2: begin
        y1:= 136492587;
        y2:= 594768132;
        y3:= 728315964;
        y4:= 861574293;
        y5:= 275931648;
        y6:= 349286715;
        y7:= 657143829;
        y8:= 482659371;
        y9:= 913827456;
        end;
     3: begin
        y1:= 164739528;
        y2:= 857462319;
        y3:= 923815674;
        y4:= 682543197;
        y5:= 341987256;
        y6:= 795621483;
        y7:= 479256831;
        y8:= 518394762;
        y9:= 236178945;
        end;

   end;
   voltear_numeros(y1,y2,y3,y4,y5,y6,y7,y8,y9);
   llenar_sudoku(y1,y2,y3,y4,y5,y6,y7,y8,y9);
  end;


 ////////////////////////////// FUNCION PARA COMPROBAR LA VALIDEZ DE LOS NUMEROS ////////////////////////

 Function Es_valido(A :matriz; x,i,j : integer):integer;
 var
  aux : integer;
  auxc : integer;
  m : integer;
  begin
    Es_valido := 1;
    for aux := 1 to 9 do    // Revision de Columna
      begin
         if not(aux = j) then
           begin
             if ((A[i,aux]) = x) then
               Es_valido := 0;
           end;
      end;

    for aux := 1 to 9 do    // Revision de Fila
      begin
         if not(aux = i) then
           begin
             if ((A[aux,j]) = x) then
               Es_valido := 0;
           end;
      end;

    if ((i <= 3) and (j <= 3)) then
      m := 1
    else if ((j <= 3) and ((i <= 6) and (i >= 4))) then
      m := 2
    else if ((j <= 3) and (i >= 7)) then
      m := 3
    else if ((i <= 3) and ((j <= 6) and (j >= 4))) then
      m := 4
    else if (((i <= 6) and (i >= 4)) and ((j <= 6) and (j >= 4))) then
      m := 5
    else if ((i >= 7) and ((j <= 6) and (j >= 4))) then
      m := 6
    else if ((i <= 3) and (j >= 7)) then
      m := 7
    else if (((i <= 6) and (i >= 4)) and (j >= 7)) then
      m := 8
    else if ((i >= 7) and (j >= 7)) then
      m := 9;

    case m of
    1:begin
       for aux := 1 to 3 do
          for auxc := 1 to 3 do
            begin
             if not((aux = i) and (auxc = j)) then
              if (A[aux,auxc] = x) then
                Es_valido := 0;
            end;
      end;
    2:begin
       for aux := 4 to 6 do
          for auxc := 1 to 3 do
            begin
             if not((aux = i) and (auxc = j)) then
              if (A[aux,auxc] = x) then
                Es_valido := 0;
            end;
      end;
    3:begin
       for aux := 7 to 9 do
          for auxc := 1 to 3 do
            begin
             if not((aux = i) and (auxc = j)) then
              if (A[aux,auxc] = x) then
                Es_valido := 0;
            end;
      end;
    4:begin
       for aux := 1 to 3 do
          for auxc := 4 to 6 do
            begin
             if not((aux = i) and (auxc = j)) then
              if (A[aux,auxc] = x) then
                Es_valido := 0;
            end;
      end;
    5:begin
       for aux := 4 to 6 do
          for auxc := 4 to 6 do
            begin
             if not((aux = i) and (auxc = j)) then
              if (A[aux,auxc] = x) then
                Es_valido := 0;
            end;
      end;
    6:begin
       for aux := 7 to 9 do
          for auxc := 4 to 6 do
            begin
             if not((aux = i) and (auxc = j)) then
              if (A[aux,auxc] = x) then
                Es_valido := 0;
            end;
      end;
    7:begin
       for aux := 1 to 3 do
          for auxc := 7 to 9 do
            begin
             if not((aux = i) and (auxc = j)) then
              if (A[aux,auxc] = x) then
                Es_valido := 0;
            end;
      end;
    8:begin
       for aux := 4 to 6 do
          for auxc := 7 to 9 do
            begin
             if not((aux = i) and (auxc = j)) then
              if (A[aux,auxc] = x) then
                Es_valido := 0;
            end;
      end;
    9:begin
       for aux := 7 to 9 do
          for auxc := 7 to 9 do
            begin
             if not((aux = i) and (auxc = j)) then
              if (A[aux,auxc] = x) then
                Es_valido := 0;
            end;
      end;
    end;

  end;



///////////////////////////////////////////////////////////////////////////////

////////////////////MOSTRAR VISUALMENTE EL SUDOKU MANUAL///////////////////////


  Procedure Mostrar(Arreglo : matriz);
var x,y : Integer;
Begin
  x := 1;
  y := 1;
  Writeln;
  While (y <= n) and (x <= n) do
   Begin
    Write('             ');
    Write('[');
    While (x <= n) do
     Begin
     if (Arreglo[y,x] = 0) then
      write(' |')
     else
      Write(Arreglo[y,x],'|');
      x := x + 1;
     end;
     Write(']');
     Writeln;
     y := y + 1;
     x := 1;
   end;
   Writeln;
   readln;
end;

////////////////////////////////////////////////////////////////////////////////

///////////////////// MOSTRAR VISUALMENTE EL SUDOKU ALEATORIO///////////////////      ///REPETIR ESTE PROC ENCONTRAR E Y UBICARLO EN EL OTROLLENADO

Procedure Mostrar_ale(Arreglo : matriz; B :matriz; e: integer);   // PARA MOSTRAR VISUALMENTE EL SUDOKU
var x,y,p : Integer;
Begin
  x := 1;
  y := 1;
  Writeln;
  While (y <= n) and (x <= n) do
   Begin
    Write('             ');
    Write('[');

    While (x <= n) do
     Begin
       if (Arreglo[y,x] = 0) then
        write(' |')
       else
        begin
         if (e = 1) then
           begin
            p := A[y,x];
            if (Es_valido(A,p,y,x) <> 1) then
             textcolor(12);
            if (Arreglo[y,x] = B[y,x]) then
             textcolor(13);
                Write(Arreglo[y,x]);
                textcolor(white);
                Write('|');

           end
         else
          begin
           if (Arreglo[y,x] = B[y,x]) then
            textcolor(13);
           Write(Arreglo[y,x]);
           textcolor(white);
           Write('|');
          end;
        end;
         x := x + 1;
     end;
     Write(']');
     Writeln;
     y := y + 1;
     x := 1;
   end;
   Writeln;

end;



Procedure Mostro(Arreglo : matriz; d :matriz; error: integer);   // PARA MOSTRAR VISUALMENTE EL SUDOKU
var x,y,p : Integer;
Begin
  x := 1;
  y := 1;
  Writeln;
  While (y <= n) and (x <= n) do
   Begin
    Write('             ');
    Write('[');

    While (x <= n) do
     Begin
       if (Arreglo[y,x] = 0) then
        write(' |')
       else
        begin
         if (error = 1) then
           begin
            p := A[y,x];
            if (Es_valido(A,p,y,x) <> 1) then
             textcolor(12);
            if (Arreglo[y,x] = d[y,x]) then
             textcolor(13);
                Write(Arreglo[y,x]);
                textcolor(white);
                Write('|');

           end
         else
          begin
           if (Arreglo[y,x] = d[y,x]) then
            textcolor(13);
           Write(Arreglo[y,x]);
           textcolor(white);
           Write('|');
          end;
        end;
         x := x + 1;
     end;
     Write(']');
     Writeln;
     y := y + 1;
     x := 1;
   end;
   Writeln;

end;
/////////////////////////////////////////////////////////////////////////////
////////////////////////// VACIAR CASILLAS DEL SUDOKU ///////////////////////

  Procedure vacio(var Arreglo : matriz);
var x,y : Integer;
Begin
  for x := 1 to 9 do
    for y := 1 to 9 do
      begin
        Arreglo[x,y] := 0;
      end;
end;

/////////////////////////////////////////////////////////////////////////////////
///////////////////////// DIFICULTADES DEL SUDOKU ALEATORIO ////////////////////////

Procedure aleli(var Arreglo : matriz;z : integer);      // DIFICULTADES DEL SUDOKU
var x,y,cont : Integer;
Begin
  randomize;
  case z of
    1: cont := 15;           // FÁCIL
    2: cont := 25;          // NORMAL
    3: cont := 32;         // PREDETERMINADO
    4: cont := 40;        // DIFÍCIL
    5: cont := 50;       // EXPERTO
  end;
  while (cont > 0) do
    begin
    x := random(9) + 1;
    y := random(9) + 1;
    if (Arreglo[x,y] <> 0) then
     begin
      cont:= cont - 1;
      Arreglo[x,y] := 0;
     end;
    end;

end;

////////////////////////////////////////////////////////////////////////////////
///////////////////// PROCEDIMIENTOS PARA MOSTRAR LAS CONFIGURACIONES DEL JUEGO /////////////////////////
procedure mostrar_dificultad(x : integer);

begin
  case (x) of
    1:begin
        textcolor(green); write('  Dificultad: Facil');textcolor(white);  write('                                         *');
      end;
    2:begin
        textcolor(cyan); write('  Dificultad: Normal');textcolor(white);  write('                                        *');
      end;
    3:begin
        textcolor(14); write('  Dificultad: Predeterminado');textcolor(white); write('                                *');
      end;
    4:begin
        textcolor(red); write('  Dificultad: Dificil');textcolor(white); write('                                       *');
      end;
    5:begin
        textcolor(9); write('  Dificultad: Experto');textcolor(white); write('                                       *');
      end;
  end;
end;

procedure mostrar_ayuda(x : integer);

begin
  case (x) of
    1:begin
        textcolor(green); write('  Ayuda: Asistido');textcolor(white); write('                                           *');
      end;
    2:begin
        textcolor(cyan); write('  Ayuda: Independiente');textcolor(white);  write('                                      *');
      end;

  end;
end;

procedure mostrar_errores(x : integer);

begin
  case (x) of
    1:begin
        textcolor(green); write('  Errores: Instantaneo');textcolor(white); write('                                      *');
      end;
    2:begin
        textcolor(cyan); write('  Errores: No Instantaneos');textcolor(white); write('                                  *');
      end;

  end;
end;
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

Procedure Llenado_man2 (var A,d,h:matriz);
var
aux,auxc : integer;
p,o:integer;
  begin
   repeat
         repeat
          clrscr;
          Mostrar(A);
          Writeln;
          Writeln;
          repeat
            writeln('Por favor ingrese el valor de la primera coordenada');
            readln(aux);
            if not((aux > 0) and (aux < 10)) then
              begin
               writeln('El valor para introducir no es valido, por favor presione para volver a intentar');
               readkey;
              end;
          until ((aux >= 1) and (aux <= 9));

          repeat
            writeln('Por favor ingrese el valor de la segunda coordenada');
            readln(auxc);
            if not((auxc > 0) and (auxc < 10)) then
              begin
               writeln('El valor para introducir no es valido, por favor presione para volver a intentar');
               readkey;
              end;
          until ((aux >= 1) and (aux <= 9));


          Writeln('Por favor ingrese el valor para la posicion [',aux,',',auxc,']');
          readln(p);
          {if (e = 1) then
            if ((Es_valido(A,p,aux,auxc) = 1)) then
              a := 1
            else
              a := 0;
          else
            a := 1;}
          if ((Es_valido(A,p,aux,auxc) = 1) and ((p > 0) and (p < 10))) then
             begin
              textcolor(5);
              A[aux,auxc] := p;
              textcolor(white);
              writeln('Valor introducido con Exito. Pulse para el siguiente');
              writeln;
              writeln;
              readkey;
             end
          else
            begin
            writeln('El valor para introducir no es valido, por favor presione para volver a intentar');
            readkey;
            end;
          until ((Es_valido(A,p,aux,auxc) = 1) and ((p > 0) and (p < 10)));
          writeln('Desea ingresar otro valor ?');
          writeln('1. Si');
          writeln('0. No');
          readln(o);
     until (o = 0);
      d := a;
      h := a;

  end;


////////////////////////MODIFICAR VALORES DEL SUDOKU /////////////////////////

procedure modificar_m(var a,h:matriz; d:matriz);
var aux, auxc, p :integer;
 begin
    repeat
            writeln;
            writeln('Por favor ingrese el valor de la primera coordenada');
            readln(aux);
            if not((aux > 0) and (aux < 10)) then
              begin
               writeln('El valor para introducir no es valido, por favor presione para volver a intentar');
               readkey;
              end;
      until ((aux >= 1) and (aux <= 9));

       repeat
            writeln('Por favor ingrese el valor de la segunda coordenada');
            readln(auxc);
            if not((auxc > 0) and (auxc < 10)) then
              begin
               writeln('El valor para introducir no es valido, por favor presione para volver a intentar');
               readkey;
              end;
       until ((auxc >= 1) and (auxc <= 9));

      if d[aux,auxc] <> A[aux,auxc] then
       begin
        if ((A[aux,auxc] > 0) and (A[aux,auxc] < 10)) then
            begin
               repeat
                 Writeln('Por favor ingrese el valor para la posicion [',aux,',',auxc,']');
                 readln(p);
                 writeln;
               if ((p < 1) or (p > 9)) then
               begin
                writeln('El valor introducido es incorrecto');
                readln;
               end;
               until ((p > 0) and (p < 10));
           end;
         end
       else
         begin
           writeln('No puedes modificar esta casilla.');
           readln;
         end;

         if ((p > 0) and (p < 10)) then
         begin
       A[aux,auxc] := p; h[aux,auxc] := p; v[aux,aux] := p;
         end;
 end;



 ///////////////////////////////////////////////////////////////////////////////

////////////////////////// ELIMINAR NUMERO FIJO ////////////////////////////////

procedure eliminar_numero(var A,h,v: matriz; d:matriz);
var aux,auxc:integer;
begin
  repeat
            writeln;
            writeln('Por favor ingrese el valor de la primera coordenada');
            readln(aux);
            if not((aux > 0) and (aux < 10)) then
              begin
               writeln('El valor para introducir no es valido, por favor presione para volver a intentar');
               readkey;
              end;
      until ((aux >= 1) and (aux <= 9));

       repeat
            writeln('Por favor ingrese el valor de la segunda coordenada');
            readln(auxc);
            if not((auxc > 0) and (auxc < 10)) then
              begin
               writeln('El valor para introducir no es valido, por favor presione para volver a intentar');
               readkey;
              end;
       until ((auxc >= 1) and (auxc <= 9));

   if ((d[aux,auxc] = 0) and (v[aux,auxc] > 0)) then
     begin
       if (A[aux,auxc] > 0) then
         begin
           A[aux,auxc] := 0;
           h[aux,auxc] := 0;
           v[aux,auxc] := 0;
         end
       else
         begin
           writeln('La casilla ya se encuentra vacia');
           readln;
         end;
    end
      else
       begin
        writeln('No puedes eliminar el valor de esta casilla');
        readln;
       end;
end;



////////////////////////////////////////////////////////////////////////////////

////////////////////////////////// PISTAS //////////////////////////////////////
procedure pistacho(c,w:matriz);
var
aux,auxc,q,respu: integer;
 begin
    repeat
      repeat
            writeln;
            writeln('Por favor ingrese el valor de la primera coordenada');
            readln(aux);
            if not((aux > 0) and (aux < 10)) then
              begin
               writeln('El valor para introducir no es valido, por favor presione para volver a intentar');
               readkey;
              end;
      until ((aux >= 1) and (aux <= 9));

       repeat
            writeln('Por favor ingrese el valor de la segunda coordenada');
            readln(auxc);
            if not((auxc > 0) and (auxc < 10)) then
              begin
               writeln('El valor para introducir no es valido, por favor presione para volver a intentar');
               readkey;
              end;
       until ((auxc >= 1) and (auxc <= 9));




          if c[aux,auxc] = w[aux,auxc] then
            begin
            writeln;
              q := w[aux,auxc];
                case q of
                  0: writeln('ES CERO');
                  1: begin
                     writeln('El numero es mayor que 0 y menor que 5. ');
                     end;
                  2: begin
                     writeln('El numero es par');
                     end;
                  3: writeln('El numero es mayor que 1 y menor que 6');
                  4: writeln('El numero es mayor que 0 y menor que 6');
                  5: writeln('El numero es correcto es multiplo de 5');
                  6: writeln('El numero correcto es multiplo de 2');
                  7: writeln('El numero correcto es un numero primo');
                  8: writeln('El numero correcto es multiplo de 2');
                  9: writeln('El numero correcto es multiplo de 3');
                end;
            end
        else
          writeln('por ahi no');

     repeat
       writeln('Escoge alguna opcion');
       writeln;
       writeln('1. Para abandonar las pistas');
       writeln('2. Para para seguir con las pistas');
       writeln;
       readln(respu);
      until ((respu > 0) and (respu < 3));
   until (respu = 1);
 end;

////////////////////////////////////////////////////////////////////////////////

///////////////////////////// CANDIDATOS ///////////////////////////////////////

 procedure candy(var A:matriz);
 var aux,auxc,p: integer;

  begin
         repeat
            writeln;
            writeln('Por favor ingrese el valor de la primera coordenada');
            readln(aux);
            if not((aux > 0) and (aux < 10)) then
              begin
               writeln('El valor para introducir no es valido, por favor presione para volver a intentar');
               readkey;
              end;
         until ((aux >= 1) and (aux <= 9));

          repeat
            writeln('Por favor ingrese el valor de la segunda coordenada');
            readln(auxc);
            if not((auxc > 0) and (auxc < 10)) then
              begin
               writeln('El valor para introducir no es valido, por favor presione para volver a intentar');
               readkey;
              end;
          until ((auxc >= 1) and (auxc <= 9));



           if (A[aux,auxc] = 0) then
            begin
               repeat
                 Writeln('Por favor ingrese el valor para la posicion [',aux,',',auxc,']');
                 readln(p);
                 writeln;
               if ((p < 1) or (p > 9)) then
               begin
                writeln('El valor introducido es incorrecto');
                readln;
               end;
               until ((p > 0) and (p < 10));
           end;

       A[aux,auxc] := p;




      end;






///////////////////////////////////////////////////////////////////////////////////


Procedure Introducir_valor_ale(var A,h,v:matriz);
var
aux,auxc,p: integer;
 begin
         repeat
            writeln;
            writeln('Por favor ingrese el valor de la primera coordenada');
            readln(aux);
            if not((aux > 0) and (aux < 10)) then
              begin
               writeln('El valor para introducir no es valido, por favor presione para volver a intentar');
               readkey;
              end;
          until ((aux >= 1) and (aux <= 9));

          repeat
            writeln('Por favor ingrese el valor de la segunda coordenada');
            readln(auxc);
            if not((auxc > 0) and (auxc < 10)) then
              begin
               writeln('El valor para introducir no es valido, por favor presione para volver a intentar');
               readkey;
              end;
          until ((aux >= 1) and (aux <= 9));

          if (A[aux,auxc] = 0) then
            begin
                 Writeln('Por favor ingrese el valor para la posicion [',aux,',',auxc,']');
                 readln(p);

                 if ((p > 0) and (p < 10)) then
                    begin
                      A[aux,auxc] := p; h[aux,auxc] := p; v[aux,auxc] := p;
                      writeln('Valor introducido con Exito. Pulse para el siguiente');
                      writeln;
                      writeln;
                      readkey;
                    end
                    else
                      begin
                        writeln('El valor para introducir no es valido, por favor presione para volver a intentar');
                        readkey;
                      end;
            end
            else
              begin
               writeln('La posicion que desea ingresar ya se encuentra ocupada. Utilice modificar.');
               readkey;
               p := A[aux,auxc]; h[aux,auxc] := p; v[aux,auxc] := p;
              end;

 end;


Procedure Introducir_valor(var A,h,v:matriz);
var
aux,auxc,p: integer;
 begin
         repeat
            writeln;
            writeln('Por favor ingrese el valor de la primera coordenada');
            readln(aux);
            if not((aux > 0) and (aux < 10)) then
              begin
               writeln('El valor para introducir no es valido, por favor presione para volver a intentar');
               readkey;
              end;
          until ((aux >= 1) and (aux <= 9));

          repeat
            writeln('Por favor ingrese el valor de la segunda coordenada');
            readln(auxc);
            if not((auxc > 0) and (auxc < 10)) then
              begin
               writeln('El valor para introducir no es valido, por favor presione para volver a intentar');
               readkey;
              end;
          until ((aux >= 1) and (aux <= 9));

          if (A[aux,auxc] = 0) then
            begin
                 Writeln('Por favor ingrese el valor para la posicion [',aux,',',auxc,']');
                 readln(p);

                 if ((p > 0) and (p < 10)) then
                    begin
                      A[aux,auxc] := p; h[aux,auxc] := p; v[aux,auxc] := p;
                      writeln('Valor introducido con Exito. Pulse para el siguiente');
                      writeln;
                      writeln;
                      readkey;
                    end
                    else
                      begin
                        writeln('El valor para introducir no es valido, por favor presione para volver a intentar');
                        readkey;
                      end;
            end
            else
              begin
               writeln('La posicion que desea ingresar ya se encuentra ocupada. Utilice modificar.');
               readkey;
               p := A[aux,auxc]; h[aux,auxc] := p; v[aux,auxc] := p;
              end;

 end;


Function Menu_opciones(var A:matriz ; y:integer):integer;
var
resp : integer;
 begin
    textcolor(White);
    Writeln('Por favor seleccione una opcion');
    textcolor(14);
    Write('  [1]Introducir un valor');
    textcolor(13);
    Write('  [2]Modificar un valor');
    textcolor(12);
    Write('  [3]Eliminar un valor');
    textcolor(4);
    Write('  [4]Ingresar un candidato');
    textcolor(white);

      if (y = 1) then
        begin
          textcolor(11);
          Write('  [5]Pedir Ayuda');
          textcolor(10);
          Write('  [6]Salir');
          writeln('[7 ]Ver solucion');
          writeln;
        end
     else
       begin
          textcolor(10);
          Write('  [5]Salir');
          textcolor(white);
          writeln('  [6] Ver solucion');
          textcolor(white);
       end;
    Readln(resp);
      if (y = 1) then
         begin
          case resp of
             1: begin
                Introducir_valor_ale(A,h,v);
                Menu_opciones := 1;
                end;
             2: begin
                modificar_m(a,h,d);
                Menu_opciones := 1;
                end;
             3: begin
                eliminar_numero(A,h,v,d);
                Menu_opciones := 1;
                end;
             4: begin
                candy(A);
                Menu_opciones := 1;
                end;
             5: begin
                pistacho(c,w);
                Menu_opciones := 1;
                end;
             6: Menu_opciones := 0;
             7: begin
                Mostrar(s);
                Menu_opciones := 0;
                end;
          end;
         end;

     if ayud = 2 then
      begin
         case resp of
          1: begin
             Introducir_valor_ale(A,h,v);
             Menu_opciones := 1;
             end;
          2: begin
             modificar_m(a,h,d);
             Menu_opciones := 1;
             end;
          3: begin
             eliminar_numero(A,h,v,d); 
             Menu_opciones := 1;
             end;
          4: begin
             candy(A);
             Menu_opciones := 1;
             end;
          5: Menu_opciones := 0;
          6: begin
                Mostrar(s);
                Menu_opciones := 0;
                end;

         end;
      end;
 end;

Function Menu_opcion(var A:matriz ; ayud:integer):integer;
var
resp : integer;
 begin
    textcolor(White);
    Writeln('Por favor seleccione una opcion');
    textcolor(14);
    Write('  [1]Introducir un valor');
    textcolor(13);
    Write('  [2]Modificar un valor');
    textcolor(12);
    Write('  [3]Eliminar un valor');
    textcolor(4);
    Write('  [4]Ingresar un candidato');
    textcolor(white);

      if (ayud = 1) then
        begin
          textcolor(11);
          Write('  [5]Pedir Ayuda');
          textcolor(10);
          Write('  [6]Salir y/o guardar partida.');
          writeln('[7] Ver solucion');

        end
     else
       begin
          textcolor(10);
          Write('  [5]Salir y/o guardar partida.');
          writeln('[6] Ver solucion]');
          writeln;
          textcolor(white);
       end;
    Readln(resp);
      if (ayud = 1) then
         begin
          case resp of
             1: begin
                Introducir_valor(a,h,v);
                Menu_opcion := 1;
                end;
             2: begin
                modificar_m(a,h,d);
                Menu_opcion := 1;
                end;
             3: begin
                eliminar_numero(A,h,v,d);
                Menu_opcion := 1;
                end;
             4: begin
                candy(A);
                Menu_opcion := 1;
                end;
             5: begin
                pistacho(c,w);
                Menu_opcion := 1;
                end;
             6: Menu_opcion := 0;
             7: begin
                Mostrar(s);
                Menu_opcion := 1;
                end;
          end;
         end;

     if ayud = 2 then
      begin
         case resp of
          1: begin
             Introducir_valor(a,h,v);
             Menu_opcion := 1;
             end;
          2: begin
             modificar_m(a,h,d);
             Menu_opcion := 1;
             end;
          3: begin
             eliminar_numero(A,h,v,d); 
             Menu_opcion := 1;
             end;
          4: begin
             candy(A);
             Menu_opcion := 1;
             end;
          5: Menu_opcion := 0;
          6: begin
                Mostrar(s);
                Menu_opcion := 1;
                end;
         end;
      end;
 end;

Procedure Llenado_ale(var A:matriz ; B:matriz; e:integer ; y:integer);
var
o:integer;
  begin
   repeat
          clrscr;
          Mostrar_ale(A,B,e);
          Writeln;
          Writeln;
          o := Menu_opciones(A,y);
     until (o = 0);
  end;

 Procedure llenado_manu(var A: matriz; y:integer);
 var
 o: integer;
 begin
   Llenado_man2(A,d,h);
   clrscr;
  repeat
    clrscr;
    Mostro(a,d,error);


    writeln; writeln;
     {mostrar(arreglo);}
    o := Menu_opcion(A,y);
  until (o = 0);
 end;

 ///////////////////////////////////////////////////////// MENUS Y SUBMENUS ///////////////////

procedure menu1(var opc: integer);  ///////////////// MENU PRINCIPAL DEL PROGRAMA   ///////////////////////
begin
   repeat
    clrscr;
          writeln('**************************************************************');
          writeln('*                                                            *');
          writeln('*  Bienvenidos al Sudoku: edici',chr(162),'n Dev-Pascal!                *');
          writeln('*  Escoga una de las siguientes opciones para continuar.     *');
          writeln('*  (1) Guia.                                                 *');
          writeln('*  (2) Reglas                                                *');
          writeln('*  (3) Creditos.                                             *');
          writeln('*  (4) Empezar a jugar.                                      *');
          writeln('*  (5) Salir del programa                                    *');
          writeln('*                                                            *');
          writeln('**************************************************************');
          writeln;
          writeln;
          writeln('       @@@@@@@@   @@@   @@@   @@@@@@@@@            @@@@@@@        @@@       @@@  @@@   @@@    ');
          writeln('       @@@@@@@@   @@@   @@@   @@@@@@@@@@        @@@@@@@@@@@@@     @@@      @@@   @@@   @@@    ');
          writeln('       @@@        @@@   @@@   @@@      @@@     @@@         @@@    @@@     @@@    @@@   @@@    ');
          writeln('       @@@        @@@   @@@   @@@       @@@   @@@           @@@   @@@    @@@     @@@   @@@    ');
          writeln('       @@@@@@@    @@@   @@@   @@@       @@@   @@@           @@@   @@@  @@@       @@@   @@@    ');
          writeln('       @@@@@@@    @@@   @@@   @@@       @@@   @@@           @@@   @@@@@@         @@@   @@@    ');
          writeln('           @@@    @@@   @@@   @@@       @@@   @@@           @@@   @@@@@@         @@@   @@@    ');
          writeln('           @@@    @@@   @@@   @@@      @@@     @@@         @@@    @@@  @@@       @@@   @@@    ');
          writeln('      @@@@@@@@    @@@@@@@@@   @@@@@@@@@@        @@@@@@@@@@@@@     @@@   @@@      @@@@@@@@@    ');
          writeln('      @@@@@@@@    @@@@@@@@@   @@@@@@@@             @@@@@@@        @@@    @@@     @@@@@@@@@    ');
              readln(opc);

       if ((opc < 0) or (opc > 5))then
        begin
        writeln; textcolor(4); writeln('Accion invalida, escoge un numero entre el 1 y el 5.');  textcolor(15);
         readln;
        end;
   until ((opc > 0) and (opc < 6));

  end;

procedure menu2(dif,ayud,error: integer;var opcc: integer);      ///////////////////// SEGUNDO MENU
 begin
      repeat
    clrscr;
          writeln('**************************************************************');
          writeln('*                                                            *');
          writeln('*  Antes de empezar a jugar, deberas configurar el juego     *');
          writeln('*  Escoga una de las siguientes opciones para continuar.     *');
          writeln('*                                                            *');
          writeln('*  (1) Dificultad                                            *');
          write('*');
          mostrar_dificultad(dif);

          writeln;
          writeln('*                                                            *');
          writeln('*  (2) Modo de juego                                         *');
          write('*');
          mostrar_ayuda(ayud);

          writeln;
          writeln('*                                                            *');
          writeln('*  (3) Errores                                               *');
          write('*');
          mostrar_errores(error);

          writeln;
          writeln('*                                                            *');
          writeln('*  (4) Empezar juego                                         *');
          writeln('*                                                            *');
          writeln('*  (5) Devolver.                                             *');
          writeln('*                                                            *');
          writeln('**************************************************************');
          readln(opcc);
               if (opcc < 0) or (opcc > 5) then
                 begin
                    writeln(); writeln('Escribe un numero entre el 1 y el 5'); readln;
                 end;
    until ((opcc > 0) and (opcc < 6));
 end;



procedure tipotablero(var tipo: integer);         //////////////// TIPO DE TABLERO
 var opcion: integer;
 begin
   repeat
       clrscr;
          writeln('********************************');
          writeln('* Que tipo de tablero deseas?  *');
          writeln('*                              *');
          writeln('* (1) Llenado Manual           *');
          writeln('*                              *');
          writeln('* (2) Aleatorio                *');
          writeln('*                              *');
          writeln('********************************');
          readln(opcion);
  until ((opcion = 1) or (opcion = 2));
    case opcion of
   1: begin
     tipo := 1;
      end;
   2: begin
     tipo := 2;
      end;
   end;
  end;




procedure letras;
begin
writeln;
writeln('                               Bienvenidos a nuestro juego de                                 ');
writeln('                                                                                              ');
writeln('                                                                                              ');
writeln('                                                                                              ');
writeln('       @@@@@@@@   @@@   @@@   @@@@@@@@@            @@@@@@@        @@@       @@@  @@@   @@@    ');
writeln('       @@@@@@@@   @@@   @@@   @@@@@@@@@@        @@@@@@@@@@@@@     @@@      @@@   @@@   @@@    ');
writeln('       @@@        @@@   @@@   @@@      @@@     @@@         @@@    @@@     @@@    @@@   @@@    ');
writeln('       @@@        @@@   @@@   @@@       @@@   @@@           @@@   @@@    @@@     @@@   @@@    ');
writeln('       @@@@@@@    @@@   @@@   @@@       @@@   @@@           @@@   @@@  @@@       @@@   @@@    ');
writeln('       @@@@@@@    @@@   @@@   @@@       @@@   @@@           @@@   @@@@@@         @@@   @@@    ');
writeln('           @@@    @@@   @@@   @@@       @@@   @@@           @@@   @@@@@@         @@@   @@@    ');
writeln('           @@@    @@@   @@@   @@@      @@@     @@@         @@@    @@@  @@@       @@@   @@@    ');
writeln('      @@@@@@@@    @@@@@@@@@   @@@@@@@@@@        @@@@@@@@@@@@@     @@@   @@@      @@@@@@@@@    ');
writeln('      @@@@@@@@    @@@@@@@@@   @@@@@@@@             @@@@@@@        @@@    @@@     @@@@@@@@@    ');
writeln('                                                                                              ');
writeln('                                                                                              ');
writeln('                                                                                              ');
writeln('                                Presione ENTER para continuar                                 ');
readln;
 clrscr;

end;


procedure guia;
var
opcion, opcion_2: integer;
begin
 opcion := 0;
 clrscr;
 writeln('*********************************************');
 writeln('*    Presione ENTER para empezar la guia    *');
 writeln('*                                           *');
 writeln('*********************************************');
 readln;

    repeat
      clrscr;
      writeln('********************************************************');
      writeln('*       ESCOGE ALGUNA DE LAS SIGUIENTES OPCIONES       *');
      writeln('*                                                      *');
      writeln('*                                                      *');
      writeln('* 1.) Tablas del sudoku  2.) Configuraciones 3.) Salir *');
      writeln('*                                                      *');
      writeln('********************************************************');
      readln(opcion);

      case opcion of
       1:begin
         writeln('*****************************************************************************************');
         writeln('Existen dos tipos de relleno para las tablas del sodoku');
         writeln;
         writeln('Llenado Manual: ');
         writeln('El usuario debera introducir los numeros predeterminados manualmente');
         writeln('Es decir, el usuario introducira los valores que no se pueden modificar en el sudoku. ');
         writeln;
         writeln;
         writeln('Llenado Automatico');
         writeln('Los valores predeterminados del sudoku se van a generar de forma aleatoria, el usuario');
         writeln('Puede escoger la dificultad del juego.');
         writeln('*****************************************************************************************');
         writeln;
         writeln('                            Presiona ENTER para continuar');
         readln;
       end;

      2: begin

         clrscr;
         writeln('*****************************************************************************************');
         writeln('            Elige alguna opcion para saber mas acerca de la configuracion');
         writeln;
         writeln(' 1) Detector de Errores.     2) Dificultades     3.) Pistas     4.)  Candidatos   5.) Salir ');
         writeln;
         writeln('*****************************************************************************************');
         readln(opcion_2);
           case opcion_2 of
             1: begin
                 writeln('Si el jugador enciende la opcion del detector de errores');
                 writeln('Al introducir un valor en el sudoku, este tendra un color');
                 writeln('Si es rojo, significa que el numero es incorrecto, si es blanco');
                 writeln('Significa que el valor es correcto');
                end;
             2: begin
                  writeln('El juego cuenta con 5 dificultades.');
                  writeln;
                  writeln('Modo Aleatorio:');
                  writeln;
                  writeln('Facil: Se elimiran 15 casillas de forma aleatoria');
                  writeln('Normal: Se elimiran 25 casillas de forma aleatoria');
                  writeln('Predeterminado: Se elimiran 32 casillas de forma aleatoria');
                  writeln('Dificil: Se elimiran 40 casillas de forma aleatoria');
                  writeln('Experto: Se elimiran 50 casillas de forma aleatoria');
                  writeln;
                  writeln('Modo Manual: El usuario tendra un numero limitado de valores');
                  writeln('Que podra ingresar en el llenado manual.');
                  writeln;
                  writeln('Facil: El usuario solo podra ingresar 65 numeros');
                  writeln('Normal: El usuario solo podra ingresar 55 numeros');
                  writeln('Predeterminado: El usuario solo podra ingresar 48 numeros');
                  writeln('Dificil: El usuario solo podra ingresar 40 numeros');
                  writeln('Experto: El usuario solo podra ingresar 15 numeros');
                  readln;
                end;
             3: begin
                 writeln('Si el usuario activa esta configuracion, debera introducir');
                 writeln('Las coordenadas de la casilla en la cual quiere obtener una pista');
                 readln;
                end;
             4: begin
                 writeln('Si el usuario activa esta opcion, podra introducir numeros candidatos');
                 writeln('Esto quiere decir que son valores sin peso en el sudoku, sirve como guia para el usuario');
                 readln;
                end;
            end;

        end;
        end;
    until opcion = 3;

end;

procedure reglas();
begin
clrscr;
  writeln('A continuacion te presentamos las reglas para jugar Sudoku:');
  writeln;
  writeln('Regla #1: Se usan los números del 1 al 9. Sudoku se juega en una cuadricula de 9 x 9 espacios.');           textcolor(131);
  writeln('********');
  writeln;
  textcolor(white);
  writeln('Regla#2: No se puede repetir ningun numero.');
  textcolor(131);
  writeln('********');
  writeln;
  textcolor(white);
  writeln('Regla #3: Utilice el proceso de eliminación. Esta no es realmente una regla, pero es util para resolver el juego');
  textcolor(131);
  writeln('********');
  textcolor(white);
  writeln;
  writeln('Para tips interesantes vaya a la seccion de Tips.');
  writeln;
  writeln;
  writeln('Presione ENTER para continuar');
  readln;
end;


 procedure creditos();   ////////////////// DESARROLLADORES DEL PROGRAMA
 begin
 clrscr;
   writeln('*************************************************');
   writeln('*                                               *');
   writeln('*  Este sudoku fue desarrollado por el Grupo 4  *');
   writeln('*  Sus integrantes son:                         *');
   writeln('*  Contreras, Cesar                             *');
   writeln('*  Gil, Andres                                  *');
   writeln('*                                               *');
   writeln('*************************************************');
   writeln('Presione ENTER para continuar');
   readln;
end;

procedure dificultad(var dif: integer);  ///////////////////////// DIFICULTADES DISPONIBLES PARA EL JUGADOR
var dfc: integer;
 begin
  repeat

   clrscr;
   writeln('*************************************');
   writeln('*                                   *');
   writeln('*  Escoga la dificultad del juego   *');
   writeln('*                                   *');
   writeln('*  (1) Facil                        *');
   writeln('*                                   *');
   writeln('*  (2) Normal                       *');
   writeln('*                                   *');
   writeln('*  (3) Dificil                      *');
   writeln('*                                   *');
   writeln('*  (4) Experto                      *');
   writeln('*                                   *');
   writeln('*  (5) Seguir en predeterminado     *');
   writeln('*                                   *');
   writeln('*************************************');
   readln(dfc);
  case dfc of
     1: begin
          textcolor(13); writeln('Jugaras en modo Facil'); textcolor(15); dif := 1;
        end;
     2: begin
          writeln; textcolor(9); writeln('Jugaras en modo Normal'); textcolor(15);  dif := 2;
        end;
     3: begin
          textcolor(6); writeln('Jugaras en modo Dificil'); textcolor(15); dif := 4;
        end;
     4: begin
          textcolor(10); writeln('Jugaras en modo Experto'); textcolor(15); dif := 5;
        end;
     5: begin
          writeln; writeln('Jugaras en dificultad predeterminada'); writeln; writeln('La dificultad predeterminada es un intermedio entre el Normal y el Dificil.');
          dif := 3;
        end;
      else
       writeln; writeln('Introduce un numero valido');
    end;
 readln;
  until ((dfc > 0) and (dfc < 6));
 end;


procedure errores(var error: integer);  //////////////////// DETECTOR DE ERRORES
var
rsp: integer;
begin
repeat
 clrscr;
  writeln('***********************************************');
  writeln('*  Desea el detector de errores instantaneos?  *');
  writeln('*                                             *');
  writeln('*              Escoga un numero               *');
  writeln('*                                             *');
  writeln('*      (1) Con errores instantaneos.          *');
  writeln('*                                             *');
  writeln('*      (2) Sin errores instantaneos.          *');
  writeln('*                                             *');
  writeln('*      (3) Como funciona el detector?         *');
  writeln('*                                             *');
  writeln('***********************************************');
  readln(rsp);
    writeln();

  case rsp of
   1: begin
      textcolor(1); writeln('Jugara con errores instantaneos.'); textcolor(white); error := 1;
      end;
   2: begin
      textcolor(6); writeln('Jugara sin errores instantaneos.');  textcolor(white);  error := 2;
      end;
   3: begin
      textcolor(11); writeln('El detector te indica cada vez que colocas un numero, si este es correcto o incorrecto.');  textcolor(15);
      end;
  else
     writeln; writeln('Introduce un numero valido');
  end;
    readln;
 until ((rsp = 1) or (rsp = 2));
end;




procedure pistas(var ayud: integer); ////////////////////// PISTAS PARA EL JUGADOR
var
 modo: integer;
begin

repeat
 clrscr;
 writeln('***********************************************');
 writeln('*    Desea el modo asistido o independiente   *');
 writeln('*                                             *');
 writeln('*              (1) Asistido                   *');
 writeln('*                                             *');
 writeln('*            (2) Independiente                *');
 writeln('*                                             *');
 writeln('*          (3) Cual es la diferencia?         *');
 writeln('*                                             *');
 writeln('***********************************************');
  readln(modo);
 writeln; writeln;
   case modo of
  1: begin
     textcolor(1); writeln('Podras pedir ayuda'); textcolor(15); ayud := 1;
     end;
  2: begin
     textcolor(6); writeln('No podras pedir ayuda'); textcolor(15); ayud := 2;
     end;
  3: begin
     textcolor(11); writeln('En el modo asistido podras pedir ayuda y en el modo independiente no.'); textcolor(15);
     end;
  end;
   writeln;
   readln;
 until ((modo = 1) or (modo = 2));

end;

procedure configuracion(dif,ayud,error: integer);
var
 dff,ayd,err : string;
 begin

   case dif of
      1: dff := 'Facil             *';
      2: dff := 'Normal            *';
      3: dff := 'Predeterminada    *';
      4: dff := 'Dificil           *';
      5: dff := 'Experto           *';
   end;

   case ayud of
      1: ayd := 'Asistido                 *';
      2: ayd := 'Independiente            *';
    end;

    case error of
      1: err := 'Instantaneo                    *';
      2: err := 'No Instantaneo                 *';

    end;

   clrscr;
   writeln('*******************************************');
   writeln('* Tus configuraciones son las siguientes  *');
   writeln('*                                         *');
   writeln('* Dificultad del juego: ',dff);
   writeln('* Errores: ',err);
   writeln('* Modo de Juego: ', ayd);
   writeln('*                                         *');
   writeln('*******************************************');
   writeln;
   writeln('Presiona ENTER para continuar');
   readkey;
 end;


begin  ////////////////////// INICIO DEL PROGRAMA PRINCIPAL  ////////////////////////

Randomize;
tipo := 0;
salir := 0;
dif := 3;
ayud := 2;
error := 1;
clrscr;

letras();
name(user);


repeat  /// REPEAT PRINCIPAL DEL PROGRAMA

atras := 0;
atras := 5;
      repeat /// POR SI SALES DEL SEGUNDO MENU
         repeat /// EMPIEZA EL PRIMER MENU
   clrscr;
   menu1(opc);
             case opc of
               1: guia();
               2: reglas;
               3: creditos();
               5: salir := 5;
             end;
         until ((opc = 4) or (opc = 5));

         if opc = 4 then
             begin   /// EMPIEZA EL SEGUNDO MENU
                  repeat
  menu2(dif,ayud,error,opcc);

                      case opcc of
                        1: dificultad(dif);
                        2: pistas(ayud);
                        3: errores(error);
                        5: begin
                             atras := 5;
                           end;
                       end;

                 until(opcc = 4) or (opcc = 5);
             end;
                 if opcc = 4 then
                  begin
                  configuracion(dif,ayud,error);
                   tipotablero(tipo);
                     case tipo of
                       1: begin
                              vacio(a);
                              llenado_manu(A,ayud);
                              cargar_partida;
                              guardar_partida;

                              Readkey;
                          end;
                       2: begin
                              Generar_Sudoku();
                              s := a;
                               aleli(a,dif);
                               b := a;
                               h := a;
                               d := a;

                               cargar_partida;

                               Llenado_ale(a,b,error,ayud); // Procedimiento para llenar una matriz
                               guardar_partida;
                          end;
                     end;
                 end;

   until(atras = 5); // DEL SEGUNDO MENU
until (salir = 5); /// DEL PRIMER REPEAT
END.
