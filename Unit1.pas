unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    Close1: TMenuItem;
    Timer2: TTimer;
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormPaint(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer2Timer(Sender: TObject);
  private
     Batman:Record
              x,y,x0,y0,cp:Word;
            End;
     BatmanPic:Array[1..4] of TBitmap;
     BackBuffer:TBitmap;
     Procedure Redraw;
  //x0,
 // y0:Word;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

Procedure TForm1.Redraw;
Begin
BackBuffer.Canvas.fillrect(canvas.ClipRect);
backBuffer.Canvas.Draw(Batman.x,Batman.y,BatmanPic[Batman.cp]);
Canvas.Draw(0,0,BackBuffer);
End;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
If ssLeft in Shift then
    Begin
     Batman.x:=x-Batman.x0;
     Batman.y:=y-Batman.y0;
     Redraw
    End;
end;

procedure TForm1.FormShow(Sender: TObject);
 var Z:byte;
begin
 For Z:=1 to 3 Do Begin
  BatmanPic[Z]:=TBitmap.Create;
  BatmanPic[Z].LoadFromFile(IntToStr(Z)+'.bmp');
 End;
 BackBuffer:=TBitmap.Create;
 BackBuffer.canvas.Brush.color:=clfuchsia;
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
If Button=mbLeft Then Begin
TImer2.Enabled:=False;
Batman.x0:=x-Batman.x;
Batman.y0:=y-Batman.y;
End Else If button= mbRight then PopupMenu1.Popup(x,y);
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
 BackBuffer.Width:=ClientWidth;
 BackBuffer.Height:=ClientHeight;
 Batman.cp:=1;
 Redraw
end;

procedure TForm1.Close1Click(Sender: TObject);
begin
Form1.close
end;

procedure TForm1.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Timer2.Enabled:=true;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
 If Batman.y< clientheight-BatmanPic[1].height Then Begin
    Canvas.fillrect(canvas.ClipRect);
    Batman.y:=Batman.y+3;
    Batman.cp:=Batman.cp+1;If Batman.cp=4 then Batman.cp:=2;
 End else Batman.cp:=1;
 Redraw
end;

end.
