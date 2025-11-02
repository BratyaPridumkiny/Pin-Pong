uses GraphWPF;

var tr := true;
var Bx := 400.0;
var By := 300.0;
var Py := 75.0;
var Px := 25.0;
var Dy := 450.0;
var Dx := 750.0;
var FBx := 5.0;
var FBy := 5.0;
var Score := 0;
var Large := 25;

procedure Duo;
begin
  tr := false;
  Rectangle(Dx,Dy,25,150,colors.Green);
  if (((Bx < Dx+Large) and (Bx > Dx-Large)) and ((By < Dy+150) and (By > Dy-Large))) then
  begin
    Score += 1;
    FBx *= -1.1;
  end;
  
  if (Bx > Window.Width-Large) then
  begin
    EndFrameBasedAnimation;
    DrawText(200,200,400,200,'Blue win!',colors.Blue);
  end
end;

procedure Ball;
begin
  if tr=true then
    DrawText(200,25,400,50,Score,colors.Black);
  Circle(Bx,By,Large/2,colors.Red);
  Rectangle(Px,Py,25,150,colors.Blue);
  Bx += FBx;
  if (Bx < 0) then
  begin
    EndFrameBasedAnimation;
    if tr = true then
      DrawText(200,200,400,200,'Game Over!',colors.Red)
    else
      DrawText(200,200,400,200,'Green win!',colors.Green);
  end;
  if tr = true then
    if (Bx > Window.Width-50) then
      FBx *= -1;
  
  {if score = 1 then
  begin
    FBx := -5;
    FBy := -5;
  end else
    if score > 15 then
    begin
      FBx := 10;
      //FBy := -10;
    end;}
  
  Duo;
  if (((Bx < Px+25) and (Bx > Px-25)) and ((By < Py+150) and (By > Py-50))) then
  begin
    Score += 1;
    FBx *= -1.1;
  end;
  
  By += FBy;
  if (By > Window.Height-Large) or (By < 0) then
  begin
    FBy *= -1;
  end;
end;

procedure Move(c:char);
begin
  case c of
    'w': Py -= large*2;
    's': Py += large*2;
    'i': Dy -= large*2;
    'k': Dy += large*2;
  end;
end;

begin
  OnKeyPress := Move;
  BeginFrameBasedAnimation(Ball,100);
end.