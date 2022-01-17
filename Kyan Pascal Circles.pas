#a
_UsesHires
#

(* You really do have to put the _UsesHires *)
(* statement at the top of the code; otherwise, *)
(* the program crashes to the monitor upon exit. *)

program kp_circles(input, output);

const
        pi = 3.14;

type
        String16 = array[1..16] of char; 
        String43 = array[1..43] of char;
        String27 = array[1..27] of char; 
        String23 = array[1..23] of char;
        String14 = array[1..14] of char;
        String47 = array[1..47] of char;
        String21 = array[1..21] of char;
        String10 = array[1..10] of char;
        String6 = array[1..6] of char;

var
        colors : array[1..5] of integer;

#i peekpoke.i
#i /kyan.pascal/screen.lib/on80.i
#i /kyan.pascal/screen.lib/cls.i
#i /kyan.pascal/screen.lib/gotoxy.i
#i /kyan.pascal/screen.lib/inverse.i
#i /kyan.pascal/screen.lib/normal.i
#i /kyan.pascal/bin/hires.i
#i /kyan.pascal/other.lib/seed.i
#i /kyan.pascal/other.lib/rnd.i
#i /kyan.pascal/other.lib/random.i

function CenterTextCol(l : integer) : integer;
begin
        CenterTextCol := 41 - trunc((l + 1) / 2)
end;

procedure DoConcentricDemo;
var
        sx : real;
        sy : real;
        r : integer;
        s : real;
        a : real;
        x : real;
        y : real;
        x2 : integer;
        y2 : integer;
        xOld : integer;
        yOld : integer;
        drawColor : integer; 
        t1 : String10;
        keyPress : integer;
begin
        t1 := 'CONCENTRIC';
        repeat
                hgr;
                gotoxy(CenterTextCol(10), 22);
                write(t1);                
                sx := (280 / 2) - 0.5;
                sy := (160 / 2) - 0.5;
                r := 5;
                repeat
                        drawColor := colors[random(1, 5)];
                        s := 2.0 / r;
                        xOld := trunc(sx + r);
                        yOld := trunc(sy);
                        a := s;
                        repeat
                                y := sin(a) * r;
                                x := cos(a) * r;
                                x2 := trunc(sx + x);
                                y2 := trunc(sy + y);
                                draw(xOld, yOld, x2, y2, drawColor);
                                xold := trunc(sx + x);
                                yold := trunc(sy + y);
                                a := a + s;
                        until (a > 2 * pi) or (peek(-16384) = 155);
                        x2 := trunc(sx + r);
                        y2 := trunc(sy);
                        draw(xOld, yOld, x2, y2, drawColor);
                        r := r + 5;
                until (r = 85) or (peek(-16384) = 155);
        until (peek(-16384) = 155);
        poke(-16368, 0);
        tx
end;

procedure DoSpiralDemo;
var
        r : real;
        sx : real;
        sy : real;
        a : real;
        x : real;
        y : real;
        xOld : integer;
        yOld : integer;
        x2 : integer;
        y2 : integer;
        drawColor : integer;
        t1 : String6;
        keyPress : integer;
begin
        t1 := 'SPIRAL';
        repeat
                hgr;
                gotoxy(CenterTextCol(6), 22);
                write(t1);
                r := 5;
                a := 0;
                drawColor := colors[random(1, 5)];
                sx := (280 / 2) - 0.5;
                sy := (160 / 2) - 0.5;
                xOld := trunc(sx + r);
                yOld := trunc(sy);
                repeat
                        a := a + pi / 60;
                        y := sin(a) * r;
                        x := cos(a) * r;
                        x2 := trunc(sx + x);
                        y2 := trunc(sy + y);
                        draw(xOld, yOld, x2, y2, drawColor);
                        xOld := x2;
                        yOld := y2;
                        r := r + 0.1;
                until (r >= 86) or (peek(-16384) = 155);
        until (peek(-16384) = 155);
        poke(-16368, 0);   
        tx
end;

procedure TitleScreen;
var
        col : integer;
        t1 : String16;
        t2 : String43;
        t3 : String27;
        t4 : String23;
        t5 : String14;
        t6 : String14;
        t7 : String47;
        t8 : String21;
        keyPress : integer;
        rndSeed : integer; 
begin
        repeat
                t1 := 'KP-CIRCLES V1.00';
                t2 := 'A SMALL GRAPHICS DEMO MADE WITH KYAN PASCAL';
                t3 := 'COPYLEFT 2022 BY ERICH KOHL';
                t4 := 'PLEASE SELECT AN OPTION';
                t5 := '<1> CONCENTRIC';
                t6 := '<2> SPIRAL    ';
                t7 := 'PRESS ESC DURING DEMO TO RETURN TO TITLE SCREEN';
                t8 := 'PRESS ESC NOW TO EXIT';
                cls;
                for col := 0 to 79 do begin
                        gotoxy(col, 5);
                        write('=');
                        inverse;
                        gotoxy(col, 6);
                        write(' ');
                        gotoxy(col, 7);
                        write(' ');
                        gotoxy(col, 8);
                        write(' ');
                        normal;  
                        gotoxy(col, 9);
                        write('=')
                end;        
                inverse;
                gotoxy(CenterTextCol(16), 6);               
                write(t1);
                gotoxy(CenterTextCol(43), 7);
                write(t2);
                gotoxy(CenterTextCol(27), 8);
                write(t3);
                normal;
                gotoxy(CenterTextCol(23), 11);
                write(t4);
                gotoxy(CenterTextCol(15), 13);
                write(t5);
                gotoxy(CenterTextCol(15), 14);
                write(t6);
                gotoxy(CenterTextCol(47), 16);
                write(t7);
                gotoxy(CenterTextCol(21), 18);
                write(t8);
                rndSeed := 0;
                repeat
                        rndSeed := rndSeed + 1;
                        if rndSeed = 255 then rndSeed := 0;
                        keyPress := peek(-16384);
                until (keyPress = 155) or (keyPress = 177) or (keyPress = 178);
				seed(rndSeed, 1, 1, 1);
                if keyPress = 177 then DoConcentricDemo;
                if keyPress = 178 then DoSpiralDemo;
        until (keyPress = 155)
end;

procedure Init;
begin
        colors[1] := 1;
        colors[2] := 2;
        colors[3] := 3;
        colors[4] := 5;
        colors[5] := 6;
        tx;
        on80 
end;

begin
        Init;
        TitleScreen;
        cls
end.