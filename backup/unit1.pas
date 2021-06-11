unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, Clipbrd, LCLIntf, LCLType, Menus, Spin, ComCtrls, MaskEdit, FileCtrl,
  FPCanvas;


type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtnPaste: TBitBtn;
    BitBtnCopy: TBitBtn;
    BitBtnOpen: TBitBtn;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    ScrollBox2: TScrollBox;
    ShapesBox: TGroupBox;
    BtnDownRight: TBitBtn;
    BtnDownLeft: TBitBtn;
    BtnUpLeft: TBitBtn;
    BtnUpRight: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    ToolCircle: TBitBtn;
    ToolDiamond: TBitBtn;
    ToolEraser: TBitBtn;
    GroupDraw: TGroupBox;
    ColorLine: TColorButton;
    style_lineBtn: TComboBox;
    ToolHexagon: TBitBtn;
    ToolKites: TBitBtn;
    ToolLine: TBitBtn;
    BtnRight: TBitBtn;
    BtnLeft: TBitBtn;
    BtnUp: TBitBtn;
    BtnDown: TBitBtn;
    Edge: TSpinEdit;
    FlipHor: TBitBtn;
    FlipVer: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    PreviewBox: TGroupBox;
    Canvas2: TPaintBox;
    ColorDropper: TBitBtn;
    ImageList2: TImageList;
    BitBtnNew: TBitBtn;
    BitBtnSave: TBitBtn;
    Canvas1: TPaintBox;
    ColorDialog1: TColorDialog;

    FileBox: TGroupBox;

    //tools item

    LineBox: TGroupBox;
    ColorBox: TGroupBox;
    RotateBtn: TBitBtn;
    SpinEdit2: TSpinEdit;
    ToolParallelogram: TBitBtn;
    ToolPencil: TBitBtn;
    ToolPentagon: TBitBtn;
    ToolRightTriangle: TBitBtn;
    ToolsBox: TGroupBox;
    CrusorPosition: TPanel;
    PositionX: TLabel;
    PositionY: TLabel;
    ImageList1: TImageList;
    FillColor: TColorButton;
    PosX: TLabel;
    PosY: TLabel;
    ScrollBox1: TScrollBox;
    SpinEdit1: TSpinEdit;
    Shape : TShape;
    ToolFloodFill : TBitBtn;
    ToolSquare: TBitBtn;
    ToolTrapezoid: TBitBtn;
    ToolTriangle: TBitBtn;
    ToolZoomIn: TBitBtn;
    ToolZoomOut: TBitBtn;


    //procedure file

    procedure BitBtnCopyClick(Sender: TObject);
    procedure BitBtnPasteClick(Sender: TObject);
    procedure ToolTrapezoidClick(Sender: TObject);
    procedure ToolHexagonClick(Sender: TObject);
    procedure BitBtnOpenClick(Sender: TObject);
    procedure BtnDownLeftClick(Sender: TObject);
    procedure BtnDownRightClick(Sender: TObject);
    procedure BtnRightClick(Sender: TObject);
    procedure BtnLeftClick(Sender: TObject);
    procedure BtnDownClick(Sender: TObject);
    procedure BtnUpClick(Sender: TObject);
    procedure BtnUpLeftClick(Sender: TObject);
    procedure BtnUpRightClick(Sender: TObject);
    procedure Canvas1Click(Sender: TObject);
    procedure ColorLineClick(Sender: TObject);
    procedure ColorLineColorChanged(Sender: TObject);
    procedure FlipHorClick(Sender: TObject);
    procedure FlipVerClick(Sender: TObject);
    procedure BitBtnNewClick(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure Canvas1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Canvas1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Canvas1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure Canvas1Paint(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    //tambahan
    procedure MidPoint;
    procedure RotateBtnClick(Sender: TObject);
    procedure Rotation;
    procedure DrawObject;
    procedure ClickZoomIn(a : integer; b: integer; c: integer; d: integer; e:integer; f:integer; g:integer; h:integer; i:integer; j:integer);
    procedure ClickZoomOut(a : integer; b: integer; c: integer; d: integer; e:integer; f:integer; g:integer; h:integer; i:integer; j:integer);


    procedure EdgeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FillColorClick(Sender: TObject);
      State: TDragState; var Accept: Boolean);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure ToolDiamondClick(Sender: TObject);
    procedure ToolKitesClick(Sender: TObject);
    procedure ToolParallelogramClick(Sender: TObject);
    procedure ToolPentagonClick(Sender: TObject);
    procedure ToolRightTriangleClick(Sender: TObject);

    //bangun datar
    procedure ToolSquareClick(Sender: TObject);
    procedure ToolTriangleClick(Sender: TObject);
    procedure ToolCircleClick(Sender: TObject);
    procedure ToolZoomInClick(Sender: TObject);
    procedure ToolZoomOutClick(Sender: TObject);
    procedure style_lineBtnChange(Sender: TObject);




  private

  public

  end;

var
  Form1: TForm1;
  paintbmp: TBitmap;
  MouseIsDown: Boolean;
  PrevX, PrevY: Integer;
  XInc,YInc : integer;
  move : integer;

  //Titik Bangun Datar
  TTitikBox,TTitikBox2 : array[1..5] of TPoint;
  TTitikTri,TTitikTri2 : array[1..4] of TPoint;
  TTitikCir,TTitikCir2 : array[1..2] of TPoint;  //Circle
  TTitikJG,TTitikJG2 : array[1..5] of TPoint;  //Parallelogram
  TTitikBK,TTitikBK2 : array[1..5] of TPoint; //Diamond
  TTitikSiku,TTitikSiku2 : array[1..4] of TPoint;//
  TTitikLay,TTitikLay2 : array[1..5] of TPoint;
  TTitikS5,TTitikS52 : array[1..6] of TPoint; //tambahan segi 5
  TTitikTrap,TTitikTrap2 : array[1..5] of TPoint;
  TTitikS6,TTitikS62 : array[1..7] of TPoint; //tambahan segi 5

  TTitikBoxRandom : array [1..6]of TPoint;

   ClickZoomInA, ClickZoomInB, ClickZoomInC,ClickZoomInD, ClickZoomInE, ClickZoomInF, ClickZoomInG,
      ClickZoomInH, ClickZoomInI, ClickZoomInJ: integer;
    ClickZoomOutA, ClickZoomOutB, ClickZoomOutC, ClickZoomOutD, ClickZoomOutE, ClickZoomOutF, ClickZoomOutG,
      ClickZoomOutH, ClickZoomOutI, ClickZoomOutJ: integer;

  AddPoint : integer;
  NoObjek :integer;
  r : integer; //tambahan
  LineCol,FillCol : TColor;
  LineThick : integer;
  EdgeValue : integer;
  TPC, TOB   : TPoint;
  NoTools : integer;
  sudut : double;
  Ssudut : double;
  scale : double;
  style_line: TFPPenStyle;



     //skala:=1; r:=50;
     //FillCol:clBlue;


implementation

{$R *.lfm}

{ TForm1 }




procedure TForm1.FormCreate(Sender: TObject);
begin
  // UNtuk buat Shape  >1
    //AddPoint:=0;
    //NoClick:=0;

    LineCol:=clBlack;
    FillCol:=clWhite;
    EdgeChange(Sender);
    ClickZoomIn(0,0,0,0,0,0,0,0,0,0);
    ClickZoomOut(0,0,0,0,0,0,0,0,0,0);
    scale:=1.0;
    BitBtnNewClick(Sender);
end;



procedure TForm1.FlipVerClick(Sender: TObject);
var
  i : integer;
begin
 midPoint;
   if NoObjek=1 then
   begin
       for i:=1 to 6 do
           begin
             TTitikBox[i].X:=TTitikBox[i].X-TOB.x;
             TTitikBox[i].Y:=TTitikBox[i].Y-TOB.y;
             // ---------------- Refleksi -------------------
             TTitikBox[i].x:= TTitikBox[i].x*(-1) + 0*TTitikBox[i].y;
             TTitikBox[i].y:= TTitikBox[i].x*(0) + 1*TTitikBox[i].y;
             // ---------- kembalikan ke titik semula -------
             TTitikBox[i].X:=TTitikBox[i].X+TOB.x;
             TTitikBox[i].Y:=TTitikBox[i].Y+TOB.y;
           end;
   end
  else if NoObjek=2 then
   begin
       for i:=1 to 5 do
           begin
             TTitikTri[i].X:=TTitikTri[i].X-TOB.x;
             TTitikTri[i].Y:=TTitikTri[i].Y-TOB.y;
             // ---------------- Refleksi -------------------
             TTitikTri[i].x:= TTitikTri[i].x*(-1) + 0*TTitikTri[i].y;
             TTitikTri[i].y:= TTitikTri[i].x*(0) + 1*TTitikTri[i].y;
             // ---------- kembalikan ke titik semula -------
             TTitikTri[i].X:=TTitikTri[i].X+TOB.x;
             TTitikTri[i].Y:=TTitikTri[i].Y+TOB.y;
           end

   end
  else if NoObjek=3 then
   begin
       for i:=1 to 4 do
           begin
             TTitikCir[i].X:=TTitikCir[i].X-TOB.x;
             TTitikCir[i].Y:=TTitikCir[i].Y-TOB.y;
             // ---------------- Refleksi -------------------
             TTitikCir[i].x:= TTitikCir[i].x*(-1) + 0*TTitikCir[i].y;
             TTitikCir[i].y:= TTitikCir[i].x*(0) + 1*TTitikCir[i].y;
             // ---------- kembalikan ke titik semula -------
             TTitikCir[i].X:=TTitikCir[i].X+TOB.x;
             TTitikCir[i].Y:=TTitikCir[i].Y+TOB.y;
           end;
   end
   else if NoObjek=4 then
   begin
       for i:=1 to 6 do
           begin
             TTitikJG[i].X:=TTitikJG[i].X-TOB.x;
             TTitikJG[i].Y:=TTitikJG[i].Y-TOB.y;
             // ---------------- Refleksi -------------------
             TTitikJG[i].x:= TTitikJG[i].x*(-1) + 0*TTitikJG[i].y;
             TTitikJG[i].y:= TTitikJG[i].x*(0) + 1*TTitikJG[i].y;
             // ---------- kembalikan ke titik semula -------
             TTitikJG[i].X:=TTitikJG[i].X+TOB.x;
             TTitikJG[i].Y:=TTitikJG[i].Y+TOB.y;
           end;
   end
   else if NoObjek=5 then
   begin
       for i:=1 to 6 do
           begin
             TTitikBK[i].X:=TTitikBK[i].X-TOB.x;
             TTitikBK[i].Y:=TTitikBK[i].Y-TOB.y;
             // ---------------- Refleksi -------------------
             TTitikBK[i].x:= TTitikBK[i].x*(-1) + 0*TTitikBK[i].y;
             TTitikBK[i].y:= TTitikBK[i].x*(0) + 1*TTitikBK[i].y;
             // ---------- kembalikan ke titik semula -------
             TTitikBK[i].X:=TTitikBK[i].X+TOB.x;
             TTitikBK[i].Y:=TTitikBK[i].Y+TOB.y;
           end;
   end
   else if NoObjek=6 then
   begin
       for i:=1 to 5 do
           begin
             TTitikSiku[i].X:=TTitikSiku[i].X-TOB.x;
             TTitikSiku[i].Y:=TTitikSiku[i].Y-TOB.y;
             // ---------------- Refleksi -------------------
             TTitikSiku[i].x:= TTitikSiku[i].x*(-1) + 0*TTitikSiku[i].y;
             TTitikSiku[i].y:= TTitikSiku[i].x*(0) + 1*TTitikSiku[i].y;
             // ---------- kembalikan ke titik semula -------
             TTitikSiku[i].X:=TTitikSiku[i].X+TOB.x;
             TTitikSiku[i].Y:=TTitikSiku[i].Y+TOB.y;
           end;
   end
   else if NoObjek=7 then
   begin
       for i:=1 to 6 do
           begin
             TTitikLay[i].X:=TTitikLay[i].X-TOB.x;
             TTitikLay[i].Y:=TTitikLay[i].Y-TOB.y;
             // ---------------- Refleksi -------------------
             TTitikLay[i].x:= TTitikLay[i].x*(-1) + 0*TTitikLay[i].y;
             TTitikLay[i].y:= TTitikLay[i].x*(0) + 1*TTitikLay[i].y;
             // ---------- kembalikan ke titik semula -------
             TTitikLay[i].X:=TTitikLay[i].X+TOB.x;
             TTitikLay[i].Y:=TTitikLay[i].Y+TOB.y;
           end;
   end
   else if NoObjek=8 then
   begin
       for i:=1 to 7 do
           begin
             TTitikS5[i].X:=TTitikS5[i].X-TOB.x;
             TTitikS5[i].Y:=TTitikS5[i].Y-TOB.y;
             // ---------------- Refleksi -------------------
             TTitikS5[i].x:= TTitikS5[i].x*(-1) + 0*TTitikS5[i].y;
             TTitikS5[i].y:= TTitikS5[i].x*(0) + 1*TTitikS5[i].y;
             // ---------- kembalikan ke titik semula -------
             TTitikS5[i].X:=TTitikS5[i].X+TOB.x;
             TTitikS5[i].Y:=TTitikS5[i].Y+TOB.y;
           end;
   end
   else if NoObjek=9 then
   begin
       for i:=1 to 7 do
           begin
             TTitikS6[i].X:=TTitikS6[i].X-TOB.x;
             TTitikS6[i].Y:=TTitikS6[i].Y-TOB.y;
             // ---------------- Refleksi -------------------
             TTitikS6[i].x:= TTitikS6[i].x*(-1) + 0*TTitikS6[i].y;
             TTitikS6[i].y:= TTitikS6[i].x*(0) + (1)*TTitikS6[i].y;
             // ---------- kembalikan ke titik semula -------
             TTitikS6[i].X:=TTitikS6[i].X+TOB.x;
             TTitikS6[i].Y:=TTitikS6[i].Y+TOB.y;
           end;
   end
   else if NoObjek=10 then
      begin
          for i:=1 to 6 do
              begin
                TTitikTrap[i].X:=TTitikTrap[i].X-TOB.x;
                TTitikTrap[i].Y:=TTitikTrap[i].Y-TOB.y;
                // ---------------- Refleksi -------------------
                TTitikTrap[i].x:= TTitikTrap[i].x*(-1) + 0*TTitikTrap[i].y;
                TTitikTrap[i].y:= TTitikTrap[i].x*(0) + 1*TTitikTrap[i].y;
                // ---------- kembalikan ke titik semula -------
                TTitikTrap[i].X:=TTitikTrap[i].X+TOB.x;
                TTitikTrap[i].Y:=TTitikTrap[i].Y+TOB.y;
              end;
      end;
  drawObject;
end;

procedure TForm1.FlipHorClick(Sender: TObject);
var
  i : integer;
begin
  midPoint;
   if NoObjek=1 then
   begin
       midPoint;
       for i:=1 to 6 do
           begin
             TTitikBox[i].X:=TTitikBox[i].X-TOB.x;
             TTitikBox[i].Y:=TTitikBox[i].Y-TOB.y;
             // ---------------- Refleksi -------------------
             TTitikBox[i].x:= TTitikBox[i].x*(1) + 0*TTitikBox[i].y;
             TTitikBox[i].y:= TTitikBox[i].x*(0) + (-1)*TTitikBox[i].y;
             // ---------- kembalikan ke titik semula -------
           TTitikBox[i].X:=TTitikBox[i].X+TOB.x;
           TTitikBox[i].Y:=TTitikBox[i].Y+TOB.y;
           end;
   end;
   if NoObjek=2 then
   begin
       for i:=1 to 5 do
           begin
             TTitikTri[i].X:=TTitikTri[i].X-TOB.x;
             TTitikTri[i].Y:=TTitikTri[i].Y-TOB.y;
             // ---------------- Refleksi -------------------
             TTitikTri[i].x:= TTitikTri[i].x*(1) + 0*TTitikTri[i].y;
             TTitikTri[i].y:= TTitikTri[i].x*(0) + (-1)*TTitikTri[i].y;
             // ---------- kembalikan ke titik semula -------
             TTitikTri[i].X:=TTitikTri[i].X+TOB.x;
             TTitikTri[i].Y:=TTitikTri[i].Y+TOB.y;
           end;
   end
   else if NoObjek=3 then
   begin
       for i:=1 to 4 do
           begin
             TTitikCir[i].X:=TTitikCir[i].X-TOB.x;
             TTitikCir[i].Y:=TTitikCir[i].Y-TOB.y;
             // ---------------- Refleksi -------------------
             TTitikCir[i].x:= TTitikCir[i].x*(1) + 0*TTitikCir[i].y;
             TTitikCir[i].y:= TTitikCir[i].x*(0) + (-1)*TTitikCir[i].y;
             // ---------- kembalikan ke titik semula -------
             TTitikCir[i].X:=TTitikCir[i].X+TOB.x;
             TTitikCir[i].Y:=TTitikCir[i].Y+TOB.y;
           end;
   end
   else if NoObjek=4 then
   begin
       for i:=1 to 6 do
           begin
             TTitikJG[i].X:=TTitikJG[i].X-TOB.x;
             TTitikJG[i].Y:=TTitikJG[i].Y-TOB.y;
             // ---------------- Refleksi -------------------
             TTitikJG[i].x:= TTitikJG[i].x*(1) + 0*TTitikJG[i].y;
             TTitikJG[i].y:= TTitikJG[i].x*(0) + (-1)*TTitikJG[i].y;
             // ---------- kembalikan ke titik semula -------
             TTitikJG[i].X:=TTitikJG[i].X+TOB.x;
             TTitikJG[i].Y:=TTitikJG[i].Y+TOB.y;
           end;
   end
   else if NoObjek=5 then
   begin
       for i:=1 to 6 do
           begin
             TTitikBK[i].X:=TTitikBK[i].X-TOB.x;
             TTitikBK[i].Y:=TTitikBK[i].Y-TOB.y;
             // ---------------- Refleksi -------------------
             TTitikBK[i].x:= TTitikBK[i].x*(1) + 0*TTitikBK[i].y;
             TTitikBK[i].y:= TTitikBK[i].x*(0) + (-1)*TTitikBK[i].y;
             // ---------- kembalikan ke titik semula -------
             TTitikBK[i].X:=TTitikBK[i].X+TOB.x;
             TTitikBK[i].Y:=TTitikBK[i].Y+TOB.y;
           end;
   end
   else if NoObjek=6 then
   begin
       for i:=1 to 5 do
           begin
             TTitikSiku[i].X:=TTitikSiku[i].X-TOB.x;
             TTitikSiku[i].Y:=TTitikSiku[i].Y-TOB.y;
             // ---------------- Refleksi -------------------
             TTitikSiku[i].x:= TTitikSiku[i].x*(1) + 0*TTitikSiku[i].y;
             TTitikSiku[i].y:= TTitikSiku[i].x*(0) + (-1)*TTitikSiku[i].y;
             // ---------- kembalikan ke titik semula -------
             TTitikSiku[i].X:=TTitikSiku[i].X+TOB.x;
             TTitikSiku[i].Y:=TTitikSiku[i].Y+TOB.y;
           end;
   end
   else if NoObjek=7 then
   begin
       for i:=1 to 6 do
           begin
             TTitikLay[i].X:=TTitikLay[i].X-TOB.x;
             TTitikLay[i].Y:=TTitikLay[i].Y-TOB.y;
             // ---------------- Refleksi -------------------
             TTitikLay[i].x:= TTitikLay[i].x*(1) + 0*TTitikLay[i].y;
             TTitikLay[i].y:= TTitikLay[i].x*(0) + (-1)*TTitikLay[i].y;
             // ---------- kembalikan ke titik semula -------
             TTitikLay[i].X:=TTitikLay[i].X+TOB.x;
             TTitikLay[i].Y:=TTitikLay[i].Y+TOB.y;
           end;
   end
   else if NoObjek=8 then
   begin
       for i:=1 to 7 do
           begin
             TTitikS5[i].X:=TTitikS5[i].X-TOB.x;
             TTitikS5[i].Y:=TTitikS5[i].Y-TOB.y;
             // ---------------- Refleksi -------------------
             TTitikS5[i].x:= TTitikS5[i].x*(1) + 0*TTitikS5[i].y;
             TTitikS5[i].y:= TTitikS5[i].x*(0) + (-1)*TTitikS5[i].y;
             // ---------- kembalikan ke titik semula -------
             TTitikS5[i].X:=TTitikS5[i].X+TOB.x;
             TTitikS5[i].Y:=TTitikS5[i].Y+TOB.y;
           end;
   end
   else if NoObjek=9 then
   begin
       for i:=1 to 7 do
           begin
             TTitikS6[i].X:=TTitikS6[i].X-TOB.x;
             TTitikS6[i].Y:=TTitikS6[i].Y-TOB.y;
             // ---------------- Refleksi -------------------
             TTitikS6[i].x:= TTitikS6[i].x*(1) + 0*TTitikS6[i].y;
             TTitikS6[i].y:= TTitikS6[i].x*(0) + (-1)*TTitikS6[i].y;
             // ---------- kembalikan ke titik semula -------
             TTitikS6[i].X:=TTitikS6[i].X+TOB.x;
             TTitikS6[i].Y:=TTitikS6[i].Y+TOB.y;
           end;
   end
  else if NoObjek=10 then
   begin
       for i:=1 to 6 do
           begin
             TTitikTrap[i].X:=TTitikTrap[i].X-TOB.x;
             TTitikTrap[i].Y:=TTitikTrap[i].Y-TOB.y;
             // ---------------- Refleksi -------------------
             TTitikTrap[i].x:= TTitikTrap[i].x*(1) + 0*TTitikTrap[i].y;
             TTitikTrap[i].y:= TTitikTrap[i].x*(0) + (-1)*TTitikTrap[i].y;
             // ---------- kembalikan ke titik semula -------
             TTitikTrap[i].X:=TTitikTrap[i].X+TOB.x;
             TTitikTrap[i].Y:=TTitikTrap[i].Y+TOB.y;
           end;
   end;
   drawObject;
end;

procedure TForm1.BtnLeftClick(Sender: TObject);
var
  i : integer;
begin

     if NoObjek=1 then
      for i:=1 to 6 do
          TTitikBox[i].X:=TTitikBox[i].X-XInc;
     if NoObjek=2 then
      for i:=1 to 4 do
          TTitikTri[i].X:=TTitikTri[i].X-XInc;
     if NoObjek=3 then
     for i:=1 to 2 do
         TTitikCir[i].X:=TTitikCir[i].X-XInc;
     if NoObjek=4 then
     for i:=1 to 5 do
        TTitikJG[i].X:=TTitikJG[i].X-XInc;
     if NoObjek=5 then
     for i:=1 to 5 do
        TTitikBK[i].X:=TTitikBK[i].X-XInc;
         if NoObjek=6 then
     for i:=1 to 4 do
       TTitikSiku[i].x:=TTitikSiku[i].x-XInc;
     if NoObjek=7 then
     for i:=1 to 5 do
        TTitikLay[i].x:=TTitikLay[i].x-XInc;
     if NoObjek=8 then
     for i:=1 to 6 do
        TTitikS5[i].x:= TTitikS5[i].x-XInc;
     if NoObjek=10 then
     for i:=1 to 6 do
        TTitikTrap[i].x:= TTitikTrap[i].x-XInc;

     midPoint;
drawObject;
end;

procedure TForm1.BtnRightClick(Sender: TObject);
var
  i : integer;
begin

     if NoObjek=1 then
      for i:=1 to 6 do
          TTitikBox[i].X:=TTitikBox[i].X+XInc;
     if NoObjek=2 then
      for i:=1 to 4 do
          TTitikTri[i].X:=TTitikTri[i].X+XInc;
     if NoObjek=3 then
     for i:=1 to 2 do
         TTitikCir[i].X:=TTitikCir[i].X+XInc;
     if NoObjek=4 then
     for i:=1 to 5 do
        TTitikJG[i].X:=TTitikJG[i].X+XInc;
     if NoObjek=5 then
     for i:=1 to 5 do
        TTitikBK[i].X:=TTitikBK[i].X+XInc;
     if NoObjek=6 then
     for i:=1 to 4 do
       TTitikSiku[i].x:=TTitikSiku[i].x+XInc;
     if NoObjek=7 then
     for i:=1 to 5 do
        TTitikLay[i].x:=TTitikLay[i].x+XInc;
     if NoObjek=8 then
     for i:=1 to 6 do
        TTitikS5[i].x:= TTitikS5[i].x+XInc;
     if NoObjek=10 then
     for i:=1 to 6 do
        TTitikTrap[i].x:= TTitikTrap[i].x+XInc;


     midPoint;
drawObject;
end;

procedure TForm1.BtnDownLeftClick(Sender: TObject);
var
   i : byte;
   begin
   if NoObjek=1 then
      for i:=1 to 6 do
            begin
              TTitikBox[i].X:=TTitikBox[i].X-XInc;
              TTitikBox[i].Y:=TTitikBox[i].Y-YInc;
            end;
   if NoObjek=2 then
         for i:=1 to 4 do
            begin
            TTitikTri[i].x:=TTitikTri[i].x-XInc;
            TTitikTri[i].y:=TTitikTri[i].y-YInc;

            end;
   if NoObjek=3 then
      for i:=1 to 2 do
         begin
           TTitikCir[i].x:=TTitikCir[i].x-XInc;
           TTitikCir[i].y:=TTitikCir[i].y-YInc;
         end;
   if NoObjek=4 then
      for i:=1 to 6 do
          begin
           TTitikJG[i].x:=TTitikJG[i].x-XInc;
           TTitikJG[i].y:=TTitikJG[i].y-YInc;
           end;
   if NoObjek=5 then
      for i:=1 to 6 do
         begin
           TTitikBK[i].x:=TTitikBK[i].x-XInc;
           TTitikBK[i].y:=TTitikBK[i].y-YInc;
         end;
   if NoObjek=6 then
    for i:=1 to 4 do
       begin
         TTitikSiku[i].x:=TTitikSiku[i].x-XInc;
         TTitikSiku[i].y:=TTitikSiku[i].y-YInc;
       end;
     if NoObjek=7 then
    for i:=1 to 5 do
       begin
         TTitikLay[i].x:= TTitikLay[i].x-XInc;
         TTitikLay[i].y:= TTitikLay[i].y-YInc;
       end;
       if NoObjek=8 then
    for i:=1 to 6 do
       begin
         TTitikS5[i].x:= TTitikS5[i].x-XInc;
          TTitikS5[i].y:= TTitikS5[i].y-YInc;
       end;
    if NoObjek=10 then
       for i:=1 to 6 do
       begin
         TTitikTrap[i].x:= TTitikTrap[i].x-XInc;
          TTitikTrap[i].y:= TTitikTrap[i].y-YInc;
       end;

        midPoint;
        drawObject;
end;

procedure TForm1.BitBtnOpenClick(Sender: TObject);
begin
    OpenDialog1.Execute;
     if (OpenDialog1.Files.Count > 0) then begin

    if (FileExists(OpenDialog1.FileName)) then begin
      paintbmp.LoadFromFile(OpenDialog1.FileName);
      Canvas1Paint(Sender);

    end else begin
      ShowMessage('File is not found. You will have to open an existing file.');

    end;

  end;
end;

procedure TForm1.ToolHexagonClick(Sender: TObject);
begin
  NoObjek:=9;
      NoObjek:=9;
      TTitikS6[1].x:=75;
      TTitikS6[1].y:=45;
      TTitikS6[2].x:=105;
      TTitikS6[2].y:=45;
      TTitikS6[3].x:=120;
      TTitikS6[3].y:=70;
      TTitikS6[4].x:=105;
      TTitikS6[4].y:=95;
      TTitikS6[5].x:=75;
      TTitikS6[5].y:=95;
      TTitikS6[6].x:=60;
      TTitikS6[6].y:=70;
      TTitikS6[7].x:=TTitikS6[1].x;
      TTitikS6[7].y:=TTitikS6[1].y;

   TTitikS62:=TTitikS6;
   midPoint;
   drawObject;


   TTitikS62:=TTitikS6;
   midPoint;
   drawObject;
end;

procedure TForm1.ToolTrapezoidClick(Sender: TObject);
begin
    NoObjek:=10;


    TTitikTrap[1].x:=65;
    TTitikTrap[1].y:=50;
    TTitikTrap[2].x:=100;
    TTitikTrap[2].y:=50;
    TTitikTrap[3].x:=120;
    TTitikTrap[3].y:=80;
    TTitikTrap[4].x:=45;
    TTitikTrap[4].y:=80;
    TTitikTrap[5].x:=TTitikTrap[1].x;
    TTitikTrap[5].y:=TTitikTrap[1].y;

   style_lineBtn.Enabled:=True;
   TTitikTrap2:=TTitikTrap;
   midPoint;
   drawObject;
end;

procedure TForm1.BitBtnCopyClick(Sender: TObject);
begin
     Clipboard.Assign(paintbmp);
end;

procedure TForm1.BitBtnPasteClick(Sender: TObject);
  var
  tempBitmap: TBitmap;
  PictureAvailable: boolean = False;
begin

  // we determine if any image is on clipboard
  if (Clipboard.HasFormat(PredefinedClipboardFormat(pcfBitmap))) or
    (Clipboard.HasFormat(PredefinedClipboardFormat(pcfBitmap))) then
    PictureAvailable := True;


  if PictureAvailable then
  begin

    tempBitmap := TBitmap.Create;

    if Clipboard.HasFormat(PredefinedClipboardFormat(pcfBitmap)) then
      tempBitmap.LoadFromClipboardFormat(PredefinedClipboardFormat(pcfBitmap));
    if Clipboard.HasFormat(PredefinedClipboardFormat(pcfBitmap)) then
      tempBitmap.LoadFromClipboardFormat(PredefinedClipboardFormat(pcfBitmap));

    // so we use assign, it works perfectly
    paintbmp.Assign(tempBitmap);
    Canvas1Paint(Sender);

    tempBitmap.Free;

  end else begin

    ShowMessage('No image is found on clipboard!');

  end;
end;


procedure TForm1.BtnDownRightClick(Sender: TObject);
var
   i : byte;
   begin
   if NoObjek=1 then
      for i:=1 to 6 do
            begin
              TTitikBox[i].X:=TTitikBox[i].X+XInc;
              TTitikBox[i].Y:=TTitikBox[i].Y-YInc;
            end;
   if NoObjek=2 then
         for i:=1 to 4 do
            begin
            TTitikTri[i].x:=TTitikTri[i].x+XInc;
            TTitikTri[i].y:=TTitikTri[i].y-YInc;

            end;
   if NoObjek=3 then
      for i:=1 to 2 do
         begin
           TTitikCir[i].x:=TTitikCir[i].x+XInc;
           TTitikCir[i].y:=TTitikCir[i].y-YInc;
         end;
   if NoObjek=4 then
      for i:=1 to 6 do
          begin
           TTitikJG[i].x:=TTitikJG[i].x+XInc;
           TTitikJG[i].y:=TTitikJG[i].y-YInc;
           end;
   if NoObjek=5 then
      for i:=1 to 6 do
         begin
           TTitikBK[i].x:=TTitikBK[i].x+XInc;
           TTitikBK[i].y:=TTitikBK[i].y-YInc;
         end;
   if NoObjek=6 then
    for i:=1 to 4 do
       begin
         TTitikSiku[i].x:=TTitikSiku[i].x+XInc;
         TTitikSiku[i].y:=TTitikSiku[i].y-YInc;
       end;
     if NoObjek=7 then
    for i:=1 to 5 do
       begin
         TTitikLay[i].x:= TTitikLay[i].x+XInc;
         TTitikLay[i].y:= TTitikLay[i].y-YInc;
       end;
       if NoObjek=8 then
    for i:=1 to 6 do
       begin
         TTitikS5[i].x:= TTitikS5[i].x+XInc;
          TTitikS5[i].y:= TTitikS5[i].y-YInc;
       end;
    if NoObjek=10 then
       for i:=1 to 6 do
       begin
         TTitikTrap[i].x:= TTitikTrap[i].x+XInc;
         TTitikTrap[i].y:= TTitikTrap[i].y-YInc;
       end;
        midPoint;
        drawObject;
end;

procedure TForm1.BtnDownClick(Sender: TObject);
var
  i : integer;
begin

     if NoObjek=1 then
      for i:=1 to 6 do
          TTitikBox[i].Y:=TTitikBox[i].Y-YInc;
     if NoObjek=2 then
      for i:=1 to 4 do
          TTitikTri[i].y:=TTitikTri[i].y-YInc;
     if NoObjek=3 then
     for i:=1 to 2 do
         TTitikCir[i].y:=TTitikCir[i].y-YInc;
     if NoObjek=4 then
     for i:=1 to 5 do
        TTitikJG[i].y:=TTitikJG[i].y-YInc;
     if NoObjek=5 then
     for i:=1 to 5 do
        TTitikBK[i].y:=TTitikBK[i].y-YInc;
     if NoObjek=6 then
     for i:=1 to 4 do
         TTitikSiku[i].y:=TTitikSiku[i].y-YInc;
      if NoObjek=7 then
      for i:=1 to 5 do
         TTitikLay[i].y:= TTitikLay[i].y-YInc;
      if NoObjek=8 then
      for i:=1 to 6 do
        TTitikS5[i].y:= TTitikS5[i].y-YInc;
      if NoObjek=10 then
      for i:=1 to 6 do
          TTitikTrap[i].Y:= TTitikTrap[i].Y-YInc;


     midPoint;
drawObject;
end;

procedure TForm1.BtnUpClick(Sender: TObject);
var
  i : integer;
begin
   if NoObjek=1 then
      for i:=1 to 6 do
          TTitikBox[i].Y:=TTitikBox[i].Y+YInc;
     if NoObjek=2 then
      for i:=1 to 4 do
          TTitikTri[i].y:=TTitikTri[i].y+YInc;
     if NoObjek=3 then
     for i:=1 to 2 do
         TTitikCir[i].y:=TTitikCir[i].y+YInc;
     if NoObjek=4 then
     for i:=1 to 5 do
        TTitikJG[i].y:=TTitikJG[i].y+YInc;
     if NoObjek=5 then
     for i:=1 to 5 do
        TTitikBK[i].y:=TTitikBK[i].y+YInc;
     if NoObjek=6 then
     for i:=1 to 4 do
        TTitikSiku[i].y:=TTitikSiku[i].y+YInc;
     if NoObjek=7 then
     for i:=1 to 5 do
        TTitikLay[i].y:= TTitikLay[i].y+YInc;
     if NoObjek=8 then
     for i:=1 to 6 do
       TTitikS5[i].y:= TTitikS5[i].y+YInc;
     if NoObjek=10 then
      for i:=1 to 6 do
          TTitikTrap[i].Y:= TTitikTrap[i].Y+YInc;

     midPoint;
drawObject;
end;

procedure TForm1.BtnUpLeftClick(Sender: TObject);
var
   i : byte;
   begin
   if NoObjek=1 then
      for i:=1 to 6 do
            begin
              TTitikBox[i].X:=TTitikBox[i].X-XInc;
              TTitikBox[i].Y:=TTitikBox[i].Y+YInc;
            end;
   if NoObjek=2 then
         for i:=1 to 4 do
            begin
            TTitikTri[i].x:=TTitikTri[i].x-XInc;
            TTitikTri[i].y:=TTitikTri[i].y+YInc;

            end;
   if NoObjek=3 then
      for i:=1 to 2 do
         begin
           TTitikCir[i].x:=TTitikCir[i].x-XInc;
           TTitikCir[i].y:=TTitikCir[i].y+YInc;
         end;
   if NoObjek=4 then
      for i:=1 to 6 do
          begin
           TTitikJG[i].x:=TTitikJG[i].x-XInc;
           TTitikJG[i].y:=TTitikJG[i].y+YInc;
           end;
   if NoObjek=5 then
      for i:=1 to 6 do
         begin
           TTitikBK[i].x:=TTitikBK[i].x-XInc;
           TTitikBK[i].y:=TTitikBK[i].y+YInc;
         end;

     if NoObjek=6 then
      for i:=1 to 4 do
         begin
           TTitikSiku[i].x:=TTitikSiku[i].x-XInc;
           TTitikSiku[i].y:=TTitikSiku[i].y+YInc;
         end;
       if NoObjek=7 then
      for i:=1 to 5 do
         begin
           TTitikLay[i].x:= TTitikLay[i].x-XInc;
           TTitikLay[i].y:= TTitikLay[i].y+YInc;
         end;
         if NoObjek=8 then
      for i:=1 to 6 do
         begin
           TTitikS5[i].x:= TTitikS5[i].x-XInc;
            TTitikS5[i].y:= TTitikS5[i].y+YInc;
         end;
         if NoObjek=10 then
      for i:=1 to 6 do
            begin
              TTitikTrap[i].X:= TTitikTrap[i].X-XInc;
              TTitikTrap[i].Y:= TTitikTrap[i].Y+YInc;
            end;

        midPoint;
        drawObject;
end;

procedure TForm1.BtnUpRightClick(Sender: TObject);
var
   i : byte;
   begin
   if NoObjek=1 then
      for i:=1 to 6 do
            begin
              TTitikBox[i].X:=TTitikBox[i].X+XInc;
              TTitikBox[i].Y:=TTitikBox[i].Y+YInc;
            end;
   if NoObjek=2 then
         for i:=1 to 4 do
            begin
            TTitikTri[i].x:=TTitikTri[i].x+XInc;
            TTitikTri[i].y:=TTitikTri[i].y+YInc;

            end;
   if NoObjek=3 then
      for i:=1 to 2 do
         begin
           TTitikCir[i].x:=TTitikCir[i].x+XInc;
           TTitikCir[i].y:=TTitikCir[i].y+YInc;
         end;
   if NoObjek=4 then
      for i:=1 to 6 do
          begin
           TTitikJG[i].x:=TTitikJG[i].x+XInc;
           TTitikJG[i].y:=TTitikJG[i].y+YInc;
           end;
   if NoObjek=5 then
      for i:=1 to 6 do
         begin
           TTitikBK[i].x:=TTitikBK[i].x+XInc;
           TTitikBK[i].y:=TTitikBK[i].y+YInc;
         end;

     if NoObjek=6 then
      for i:=1 to 4 do
         begin
           TTitikSiku[i].x:=TTitikSiku[i].x+XInc;
           TTitikSiku[i].y:=TTitikSiku[i].y+YInc;
         end;
       if NoObjek=7 then
      for i:=1 to 5 do
         begin
           TTitikLay[i].x:= TTitikLay[i].x+XInc;
           TTitikLay[i].y:= TTitikLay[i].y+YInc;
         end;
         if NoObjek=8 then
      for i:=1 to 6 do
         begin
           TTitikS5[i].x:= TTitikS5[i].x+XInc;
            TTitikS5[i].y:= TTitikS5[i].y+YInc;
         end;
         if NoObjek=10 then
      for i:=1 to 6 do
            begin
              TTitikTrap[i].X:= TTitikTrap[i].X+XInc;
              TTitikTrap[i].Y:= TTitikTrap[i].Y+YInc;
            end;

        midPoint;
        drawObject;
end;

procedure TForm1.Canvas1Click(Sender: TObject);
//var
//TempColor : TColor;
//X ,Y: integer;
//
begin
     //X := Canvas1.DragCursor;
     // Y := Canvas1.DragCursor;
     // TempColor := paintbmp.Canvas.Pixels[X, Y];
     // Canvas1.Canvas.Brush.Style := bsSolid;
     // Canvas1.Canvas.Brush.Color :=FillColor.ButtonColor;
     // Canvas1.Canvas.CopyRect(Canvas1;);
end;

procedure TForm1.ColorLineClick(Sender: TObject);
begin

end;

procedure TForm1.ColorLineColorChanged(Sender: TObject);
begin
          //canvas1
  LineCol := ColorLine.ButtonColor;
  drawObject;

  //canvas2
  paintbmp.Canvas.Pen.Color:=ColorLine.ButtonColor;
  Canvas1.Canvas.Pen.Color:=ColorLine.ButtonColor;
end;

procedure TForm1.DrawObject;
begin
    // jika canvas 1
   // //default
   // Canvas1.Canvas.Brush.Color:=clWhite;
   // Canvas1.Canvas.Brush.Style:=bsSolid;
   // Canvas1.Canvas.Pen.Color:=clWhite;
   // Canvas1.Canvas.Rectangle(0,0,1000,1000);
   // //edit
   //
   // Canvas1.Canvas.Pen.Color:=LineCol;
   // Canvas1.Canvas.Pen.Width:=LineThick;
   // Canvas1.Canvas.Brush.Color:=FillCol;
   //
   //if (NoObjek=1) then
   // Canvas1.Canvas.Polyline(TTitikBox);
   //if (NoObjek=2) then
   //  Canvas1.Canvas.Polyline(TTitikTri);
   //if NoObjek=3 then
   //  Canvas1.Canvas.Ellipse(TTitikCir[1].x,TTitikCir[1].y,TTitikCir[2].x,TTitikCir[2].y);
   //
   //
   //
   // Canvas1.Canvas.Brush.Color:=FillCol;
   // Canvas1.Canvas.FloodFill(TOB.x,TOB.y,LineCol,fsBorder);



     // jika canvas 2
   // //default
    Canvas2.Canvas.Brush.Color:=clWhite;
    Canvas2.Canvas.Brush.Style:=bsSolid;
    Canvas2.Canvas.Pen.Color:=clWhite;
    Canvas2.Canvas.Rectangle(0,0,1000,1000);
    //edit

    Canvas2.Canvas.Pen.Color:=LineCol;
    Canvas2.Canvas.Pen.Width:=LineThick;
    Canvas2.Canvas.Brush.Color:=FillCol;
    Canvas2.Canvas.Pen.Style:=style_line;


   if (NoObjek=1) then
    Canvas2.Canvas.Polyline(TTitikBox);
   if (NoObjek=2) then
     Canvas2.Canvas.Polyline(TTitikTri);
   if (NoObjek=3) then
     Canvas2.Canvas.Ellipse(TTitikCir[1].x,TTitikCir[1].y,TTitikCir[2].x,TTitikCir[2].y);
   if (NoObjek=4) then
     Canvas2.Canvas.Polyline(TTitikJG);
   if (NoObjek=5) then
     Canvas2.Canvas.Polyline(TTitikBK);
    if (NoObjek=6) then
    Canvas2.Canvas.Polyline(TTitikSiku);
   if (NoObjek=7) then
    Canvas2.Canvas.Polyline(TTitikLay);
   if (NoObjek=8) then
    Canvas2.Canvas.Polyline(TTitiks5);
    if (NoObjek=9) then                   //TAMBAHAN segi 6
    Canvas2.Canvas.Polyline(TTitikS6);
  if (NoObjek=10) then         //drawObj
    Canvas2.Canvas.Polyline(TTitikTrap);




    Canvas2.Canvas.Brush.Color:=FillCol;
    Canvas2.Canvas.FloodFill(TOB.x,TOB.y,LineCol,fsBorder);

end;

Procedure TForm1.MidPoint;
var i, tx, ty : integer;
begin
  tx:=0; ty:=0;
  if NoObjek=0 then
   begin
       for i:=1 to 4 do
           tx := tx + TTitikBox[i].x;
       for i:=1 to 4 do
           ty := ty + TTitikBox[i].y;
       TOB.x := round(tx/4);
       TOB.y := round(ty/4);
   end

  else if NoObjek=1 then
   begin
       for i:=1 to 4 do
           tx := tx + TTitikBox[i].x;
       for i:=1 to 4 do
           ty := ty + TTitikBox[i].y;
       TOB.x := round(tx/4);
       TOB.y := round(ty/4);
   end

  else if NoObjek=2 then
   begin
       for i:=1 to 3 do
           tx := tx + TTitikTri[i].x;
       for i:=1 to 3 do
           ty := ty + TTitikTri[i].y;
       TOB.x := round(tx/3);
       TOB.y := round(ty/3);
   end

  else if NoObjek=3 then
    begin
       TOB.x := round((TTitikCir[1].x+TTitikCir[2].x)/2);
       TOB.y := round((TTitikCir[1].y+TTitikCir[2].y)/2);
       r:=TTitikCir[2].X-TOB.X;
    end

   else if NoObjek=4 then    //TAMBAHAN jajar genjang
    begin
     for i:=1 to 4 do
       tx := tx + TTitikJG[i].x;
     for i:=1 to 4 do
       ty := ty + TTitikJG[i].y;
     TOB.x := round(tx/4);
     TOB.y := round(ty/4);
    end

   else if NoObjek=5 then    //TAMBAHAN diamond
    begin
     for i:=1 to 4 do
       tx := tx + TTitikBK[i].x;
     for i:=1 to 4 do
       ty := ty + TTitikBK[i].y;
     TOB.x := round(tx/4);
     TOB.y := round(ty/4);
    end
    else if NoObjek=6 then     //TAMBAHAN segi 3 sikusiku
    begin
     for i:=1 to 3 do
       tx := tx + TTitikSiku[i].x;
     for i:=1 to 3 do
       ty := ty + TTitikSiku[i].y;
     TOB.x := round(tx/3);
     TOB.y := round(ty/3);
    end

    else if NoObjek=7 then     //TAMBAHAN layang layang
    begin
     for i:=1 to 4 do
       tx := tx + TTitikLay[i].x;
     for i:=1 to 4 do
       ty := ty + TTitikLay[i].y;
     TOB.x := round(tx/4);
     TOB.y := round(ty/4);
    end
     else if NoObjek=8 then     //TAMBAHAN segi 5
    begin
     for i:=1 to 5 do
       tx := tx + TTitikS5[i].x;
     for i:=1 to 5 do
       ty := ty + TTitikS5[i].y;
     TOB.x := round(tx/5);
     TOB.y := round(ty/5);
    end
   else if NoObjek=9 then    //TAMBAHAN segi 6
    begin
     for i:=1 to 6 do
       tx := tx + TTitikS6[i].x;
     for i:=1 to 6 do
       ty := ty + TTitikS6[i].y;
     TOB.x := round(tx/6);
     TOB.y := round(ty/6);
    end
   else if NoObjek=10 then    //midpoint
    begin
     for i:=1 to 4 do
       tx := tx + TTitikTrap[i].x;
     for i:=1 to 4 do
       ty := ty + TTitikTrap[i].y;
     TOB.x := round(tx/4);
     TOB.y := round(ty/4);
    end;



   end;

procedure TForm1.style_lineBtnChange(Sender: TObject);
begin
  case style_lineBtn.ItemIndex of
       0 : style_line:=psSolid;
       1 : style_line:=psDot;
       2 : style_line:=psDash;
       3 : style_line:=psDashDot;

  end;
end;

procedure TForm1.RotateBtnClick(Sender: TObject);
begin
   SSudut:=SSudut-sudut;
    Rotation;
    drawObject;
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  //canvas1
  LineThick := SpinEdit1.Value;
  drawObject;
  //canvas2
     paintbmp.Canvas.Pen.Width:=SpinEdit1.Value;
     Canvas1.Canvas.Pen.Width:=SpinEdit1.Value;

end;

procedure TForm1.SpinEdit2Change(Sender: TObject);
begin
      XInc := SpinEdit2.Value;
      YInc := -SpinEdit2.Value;
end;

procedure TForm1.ToolDiamondClick(Sender: TObject);
begin
  NoObjek:=5;
      TTitikBK[1].x:=110;
      TTitikBK[1].y:=80;
      TTitikBK[2].x:=80;
      TTitikBK[2].y:=110;
      TTitikBK[3].x:=50;
      TTitikBK[3].y:=80;
      TTitikBK[4].x:=80;
      TTitikBK[4].y:=50;
      TTitikBK[5].x:=TTitikBK[1].x;
      TTitikBK[5].y:=TTitikBK[1].y;

   style_lineBtn.Enabled:=True;
   TTitikBK2:=TTitikBK;
   midPoint;
   drawObject;
end;

procedure TForm1.ToolKitesClick(Sender: TObject);
begin
  NoObjek:=7;
       TTitikLay[1].x:=110;
       TTitikLay[1].y:=70;
       TTitikLay[2].x:=90;
       TTitikLay[2].y:=110;
       TTitikLay[3].x:=70;
       TTitikLay[3].y:=70;
       TTitikLay[4].x:=90;
       TTitikLay[4].y:=50;
       TTitikLay[5].x:=TTitikLay[1].x;
       TTitikLay[5].y:=TTitikLay[1].y;

    style_lineBtn.Enabled:=True;
    TTitikLay2:=TTitikLay;
    midPoint;
    drawObject;
end;

procedure TForm1.ToolParallelogramClick(Sender: TObject);

begin
    NoObjek:=4;


      //TTitikJG[1].x:=250;
      //TTitikJG[1].y:=150;
      //TTitikJG[2].x:=400;
      //TTitikJG[2].y:=150;
      //TTitikJG[3].x:=350;
      //TTitikJG[3].y:=250;
      //TTitikJG[4].x:=200;
      //TTitikJG[4].y:=250;
      //TTitikJG[5].x:=TTitikJG[1].x;
      //TTitikJG[5].y:=TTitikJG[1].y;

      TTitikJG[1].x:=60;
      TTitikJG[1].y:=50;
      TTitikJG[2].x:=120;
      TTitikJG[2].y:=50;
      TTitikJG[3].x:=100;
      TTitikJG[3].y:=100;
      TTitikJG[4].x:=40;
      TTitikJG[4].y:=100;
      TTitikJG[5].x:=TTitikJG[1].x;
      TTitikJG[5].y:=TTitikJG[1].y;

   style_lineBtn.Enabled:=True;

   TTitikJG2:=TTitikJG;
   midPoint;
   drawObject;
end;

procedure TForm1.ToolPentagonClick(Sender: TObject);
begin
         NoObjek:=8;

        TTitikS5[1].x:=40;
      TTitikS5[1].y:=50;
      TTitikS5[2].x:=65;
      TTitikS5[2].y:=25;
      TTitikS5[3].x:=90;
      TTitikS5[3].y:=50;
      TTitikS5[4].x:=80;
      TTitikS5[4].y:=75;
      TTitikS5[5].x:=50;
      TTitikS5[5].y:=75;
      TTitikS5[6].x:=TTitikS5[1].x;
      TTitikS5[6].y:=TTitikS5[1].y;

      style_lineBtn.Enabled:=True;
       TTitikS52:=TTitikS5;
       midPoint;
       drawObject;
end;

procedure TForm1.ToolRightTriangleClick(Sender: TObject);
begin
 NoObjek:=6;

       TTitikSiku[1].x:=50;
       TTitikSiku[1].y:=25;
       TTitikSiku[2].x:=100;
       TTitikSiku[2].y:=75;
       TTitikSiku[3].x:=50;
       TTitikSiku[3].y:=75;
       TTitikSiku[4].x:=TTitikSiku[1].x;
       TTitikSiku[4].y:=TTitikSiku[1].y;

    TTitikSiku2:=TTitikSiku;
    midPoint;
    drawObject;
end;

procedure TForm1.ToolSquareClick(Sender: TObject);
begin
  NoObjek:=1;
   //NoClickObject;
   //if(NoClick=1) then
   //   begin
   //canvas1

   //TTitikBox[1].x:=150;
   //TTitikBox[1].y:=150;
   //TTitikBox[2].x:=300;
   //TTitikBox[2].y:=150;
   //TTitikBox[3].x:=300;
   //TTitikBox[3].y:=300;
   //TTitikBox[4].x:=150;
   //TTitikBox[4].y:=300;
   //TTitikBox[5].x:=TTitikBox[1].x;
   //TTitikBox[5].y:=TTitikBox[1].y;


   //Canvas2
   TTitikBox[1].x:=50;
   TTitikBox[1].y:=50;
   TTitikBox[2].x:=100;
   TTitikBox[2].y:=50;
   TTitikBox[3].x:=100;
   TTitikBox[3].y:=100;
   TTitikBox[4].x:=50;
   TTitikBox[4].y:=100;
   TTitikBox[5].x:=TTitikBox[1].x;
   TTitikBox[5].y:=TTitikBox[1].y;
   //end;

   ////jika klik lebih dari 1
   //if (NoClick>1)then
   //   begin
   //
   //TTitikBox[1].x:=200+addPoint;
   //TTitikBox[1].y:=200+addPoint;
   //TTitikBox[2].x:=350+addPoint;
   //TTitikBox[2].y:=200+addPoint;
   //TTitikBox[3].x:=350+addPoint;
   //TTitikBox[3].y:=350+addPoint;
   //TTitikBox[4].x:=200+addPoint;
   //TTitikBox[4].y:=350+addPoint;
   //TTitikBox[5].x:=200+addPoint;
   //TTitikBox[5].y:=350+addPoint;
   //TTitikBox[6].x:=TTitikBox[1].x;
   //TTitikBox[6].y:=TTitikBox[1].y;
   //
   //   end;
   style_lineBtn.Enabled:=True;
   TTitikBox2:=TTitikBox;
   midPoint;
   drawObject;


end;

procedure TForm1.ToolTriangleClick(Sender: TObject);
begin
   NoObjek:=2;
   //NoClickObject;
   //if(NoClick=1) then
   //   begin

   //canvas 1
      //TTitikTri[1].x:=225;
      //TTitikTri[1].y:=150;
      //TTitikTri[2].x:=300;
      //TTitikTri[2].y:=300;
      //TTitikTri[3].x:=150;
      //TTitikTri[3].y:=300;
      //TTitikTri[4].x:=TTitikTri[1].x;
      //TTitikTri[4].y:=TTitikTri[1].y;
//      end;

        //canvas2
      ToolTriangle.Color:=clBlue;
      TTitikTri[1].x:=75;
      TTitikTri[1].y:=50;
      TTitikTri[2].x:=100;
      TTitikTri[2].y:=100;
      TTitikTri[3].x:=50;
      TTitikTri[3].y:=100;
      TTitikTri[4].x:=TTitikTri[1].x;
      TTitikTri[4].y:=TTitikTri[1].y;

//    if (NoClick>1)then
//      begin
//      TTitikTri[1].x:=225+addPoint;
//      TTitikTri[1].y:=150+addPoint;
//      TTitikTri[2].x:=300+addPoint;
//      TTitikTri[2].y:=300+addPoint;
//      TTitikTri[3].x:=150+addPoint;
//      TTitikTri[3].y:=300+addPoint;
//      TTitikTri[4].x:=150+addPoint;
//      TTitikTri[4].y:=300+addPoint;
//      TTitikTri[5].x:=TTitikTri[1].x;
//      TTitikTri[5].y:=TTitikTri[1].y;
//      end;
   style_lineBtn.Enabled:=True;
   TTitikTri2:=TTitikTri;
   midPoint;
  drawObject;
end;

procedure TForm1.ToolCircleClick(Sender: TObject);
begin
    NoObjek:=3;
   //TTitikCir[1].x:=150;
   //TTitikCir[1].y:=100;
   //TTitikCir[2].x:=250;
   //TTitikCir[2].y:=200;

   //canvas2
   TTitikCir[1].x:=65;
   TTitikCir[1].y:=45;
   TTitikCir[2].x:=120;
   TTitikCir[2].y:=100;

   midPoint;
   style_lineBtn.Enabled:=True;
   TTitikCir2 :=TTitikCir;
   drawObject;
end;

procedure TForm1.ToolZoomInClick(Sender: TObject);
var
  i,ZoomInI,ZoomOutI   : integer;
begin



      if NoObjek=1 then
     begin
      ClickZoomIn(1,0,0,0,0,0,0,0,0,0);
       TTitikBox:=TTitikBox2;
       midPoint;
        for i:=1 to 5 do
         begin
            // ---------- translasi fix point ke pusat -------
           TTitikBox[i].X:=TTitikBox[i].X-TOB.x;
           TTitikBox[i].Y:=TTitikBox[i].Y-TOB.y;
            // ---------- Scaling -------
           TTitikBox[i].X:=round(TTitikBox[i].X * (scale + 0.25* ClickZoomInA));
           TTitikBox[i].Y:=round(TTitikBox[i].Y * (scale + 0.25*  ClickZoomInA));
            // ---------- kembalikan ke titik semula -------
           TTitikBox[i].X:=TTitikBox[i].X+TOB.x;
           TTitikBox[i].Y:=TTitikBox[i].Y+TOB.y;
       end;
       drawObject;

       end

     else if NoObjek=2 then
     begin
        ClickZoomIn(0,1,0,0,0,0,0,0,0,0);
       TTitikTri:=TTitikTri2;
       midPoint;
       for i:=1 to 4 do
         begin
            // ---------- translasi fix point ke pusat -------
           TTitikTri[i].X:=TTitikTri[i].X-TOB.x;
           TTitikTri[i].Y:=TTitikTri[i].Y-TOB.y;
            // ---------- Scaling -------
           TTitikTri[i].X:=round(TTitikTri[i].X * (scale + 0.25* ClickZoomInB));
           TTitikTri[i].Y:=round(TTitikTri[i].Y * (scale + 0.25* ClickZoomInB));
            // ---------- kembalikan ke titik semula -------
           TTitikTri[i].X:=TTitikTri[i].X+TOB.x;
           TTitikTri[i].Y:=TTitikTri[i].Y+TOB.y;
       end;
         drawObject;
     end

     else if NoObjek=3 then
     begin
       ClickZoomIn(0,0,1,0,0,0,0,0,0,0);
       TTitikCir:=TTitikCir2;
       midPoint;
       for i:=1 to 2 do
         begin
            // ---------- translasi fix point ke pusat -------
           TTitikCir[i].X:=TTitikCir[i].X-TOB.x;
           TTitikCir[i].Y:=TTitikCir[i].Y-TOB.y;
            // ---------- Scaling -------
           TTitikCir[i].X:=round(TTitikCir[i].X *  (scale + 0.25* ClickZoomInC));
           TTitikCir[i].Y:=round(TTitikCir[i].Y *  (scale + 0.25* ClickZoomInC));
            // ---------- kembalikan ke titik semula -------
           TTitikCir[i].X:=TTitikCir[i].X+TOB.x;
           TTitikCir[i].Y:=TTitikCir[i].Y+TOB.y;
       end;
       drawObject;
     end

     else if NoObjek=4 then
     begin
        ClickZoomIn(0,0,0,1,0,0,0,0,0,0);
       TTitikJG:=TTitikJG2;
       midPoint;
       for i:=1 to 5 do
         begin
            // ---------- translasi fix point ke pusat -------
           TTitikJG[i].X:=TTitikJG[i].X-TOB.x;
           TTitikJG[i].Y:=TTitikJG[i].Y-TOB.y;
            // ---------- Scaling -------
           TTitikJG[i].X:=round(TTitikJG[i].X* (scale + 0.25* ClickZoomInD));
           TTitikJG[i].Y:=round(TTitikJG[i].Y * (scale + 0.25* ClickZoomInD));
            // ---------- kembalikan ke titik semula -------
           TTitikJG[i].X:=TTitikJG[i].X+TOB.x;
           TTitikJG[i].Y:=TTitikJG[i].Y+TOB.y;
     end;
       end
     else if NoObjek=5 then
     begin
        ClickZoomIn(0,0,0,0,1,0,0,0,0,0);
       TTitikBK:=TTitikBK2;
       midPoint;
       for i:=1 to 5 do
         begin
            // ---------- translasi fix point ke pusat -------
           TTitikBK[i].X:=TTitikBK[i].X-TOB.x;
           TTitikBK[i].Y:=TTitikBK[i].Y-TOB.y;
            // ---------- Scaling -------
           TTitikBK[i].X:=round(TTitikBK[i].X* (scale + 0.25* ClickZoomInE));
           TTitikBK[i].Y:=round(TTitikBK[i].Y * (scale + 0.25* ClickZoomInE));
            // ---------- kembalikan ke titik semula -------
           TTitikBK[i].X:=TTitikBK[i].X+TOB.x;
           TTitikBK[i].Y:=TTitikBK[i].Y+TOB.y;
       end;
     drawObject;
     end

     else if NoObjek=6 then
     begin
        ClickZoomIn(0,0,0,0,0,1,0,0,0,0);
       TTitikSiku:=TTitikSiku2;
       midPoint;
       for i:=1 to 4 do
         begin
            // ---------- translasi fix point ke pusat -------
           TTitikSiku[i].X:=TTitikSiku[i].X-TOB.x;
           TTitikSiku[i].Y:=TTitikSiku[i].Y-TOB.y;
            // ---------- Scaling -------
           TTitikSiku[i].X:=round(TTitikSiku[i].X* (scale + 0.25* ClickZoomInF));
           TTitikSiku[i].Y:=round(TTitikSiku[i].Y * (scale + 0.25* ClickZoomInF));
            // ---------- kembalikan ke titik semula -------
           TTitikSiku[i].X:=TTitikSiku[i].X+TOB.x;
           TTitikSiku[i].Y:=TTitikSiku[i].Y+TOB.y;
       end;
     drawObject;
     end

     else if NoObjek=7 then
     begin
        ClickZoomIn(0,0,0,0,0,0,1,0,0,0);
       TTitikLay:=TTitikLay2;
       midPoint;
       for i:=1 to 5 do
         begin
            // ---------- translasi fix point ke pusat -------
           TTitikLay[i].X:=TTitikLay[i].X-TOB.x;
           TTitikLay[i].Y:=TTitikLay[i].Y-TOB.y;
            // ---------- Scaling -------
           TTitikLay[i].X:=round(TTitikLay[i].X* (scale + 0.25* ClickZoomInG));
           TTitikLay[i].Y:=round(TTitikLay[i].Y * (scale + 0.25* ClickZoomInG));
            // ---------- kembalikan ke titik semula -------
           TTitikLay[i].X:=TTitikLay[i].X+TOB.x;
           TTitikLay[i].Y:=TTitikLay[i].Y+TOB.y;
       end;
     drawObject;
     end

     else if NoObjek=8 then
     begin
        ClickZoomIn(0,0,0,0,0,0,0,1,0,0);
       TTitikS5:=TTitikS52;
       midPoint;
       for i:=1 to 6 do
         begin
            // ---------- translasi fix point ke pusat -------
           TTitikS5[i].X:=TTitikS5[i].X-TOB.x;
           TTitikS5[i].Y:=TTitikS5[i].Y-TOB.y;
            // ---------- Scaling -------
           TTitikS5[i].X:=round(TTitikS5[i].X* (scale + 0.25* ClickZoomInH));
           TTitikS5[i].Y:=round(TTitikS5[i].Y * (scale + 0.25* ClickZoomInH));
            // ---------- kembalikan ke titik semula -------
           TTitikS5[i].X:=TTitikS5[i].X+TOB.x;
           TTitikS5[i].Y:=TTitikS5[i].Y+TOB.y;
       end;
     drawObject;
     end


    else if NoObjek=9 then
     begin
        ClickZoomIn(0,0,0,0,0,0,0,0,1,0);
       TTitikS6:=TTitikS62;
       midPoint;
       for i:=1 to 7 do
         begin
            // ---------- translasi fix point ke pusat -------
           TTitikS6[i].X:=TTitikS6[i].X-TOB.x;
           TTitikS6[i].Y:=TTitikS6[i].Y-TOB.y;
            // ---------- Scaling -------
           TTitikS6[i].X:=round(TTitikS6[i].X* (scale + 0.25* ClickZoomInI));
           TTitikS6[i].Y:=round(TTitikS6[i].Y * (scale + 0.25* ClickZoomInI));
            // ---------- kembalikan ke titik semula -------
           TTitikS6[i].X:= TTitikS6[i].X+TOB.x;
           TTitikS6[i].Y:= TTitikS6[i].Y+TOB.y;
       end;
     drawObject;
     end

     else if NoObjek=10 then
     begin
        ClickZoomIn(0,0,0,0,0,0,0,0,0,1);
       TTitikTrap:=TTitikTrap2;
       midPoint;
       for i:=1 to 5 do
         begin
            // ---------- translasi fix point ke pusat -------
           TTitikTrap[i].X:=TTitikTrap[i].X-TOB.x;
           TTitikTrap[i].Y:=TTitikTrap[i].Y-TOB.y;
            // ---------- Scaling -------
           TTitikTrap[i].X:=round(TTitikTrap[i].X* (scale + 0.25* ClickZoomInJ));
           TTitikTrap[i].Y:=round(TTitikTrap[i].Y * (scale + 0.25* ClickZoomInJ));
            // ---------- kembalikan ke titik semula -------
           TTitikTrap[i].X:=TTitikTrap[i].X+TOB.x;
           TTitikTrap[i].Y:=TTitikTrap[i].Y+TOB.y;
       end;
     drawObject;
     end;
     drawObject;
     end;




procedure TForm1.ToolZoomOutClick(Sender: TObject); //Zoom out
var
  i : integer;

begin
       ClickZoomIn(0,0,0,0,0,0,0,0,0,0);
       //ClickZoomInA:=0;
       //ClickZoomInB:=0;
       //ClickZoomInC:=0;
       //ClickZoomInD:=0;
      if NoObjek=1 then
     begin
       ClickZoomOut(1,0,0,0,0,0,0,0,0,0);
       TTitikBox:=TTitikBox2;
       midPoint;
        for i:=1 to 5 do
         begin
            // ---------- translasi fix point ke pusat -------
           TTitikBox[i].X:=TTitikBox[i].X-TOB.x;
           TTitikBox[i].Y:=TTitikBox[i].Y-TOB.y;
            // ---------- Scaling -------
           TTitikBox[i].X:=round(TTitikBox[i].X * (scale - 0.25*ClickZoomOutA));
           TTitikBox[i].Y:=round(TTitikBox[i].Y *  (scale - 0.25*ClickZoomOutA));
            // ---------- kembalikan ke titik semula -------
           TTitikBox[i].X:=TTitikBox[i].X+TOB.x;
           TTitikBox[i].Y:=TTitikBox[i].Y+TOB.y;
       end;
       drawObject;

       end

     else if NoObjek=2 then
     begin
         ClickZoomOut(0,1,0,0,0,0,0,0,0,0);
       TTitikTri:=TTitikTri2;
       midPoint;
       for i:=1 to 4 do
         begin
            // ---------- translasi fix point ke pusat -------
           TTitikTri[i].X:=TTitikTri[i].X-TOB.x;
           TTitikTri[i].Y:=TTitikTri[i].Y-TOB.y;
            // ---------- Scaling -------
           TTitikTri[i].X:=round(TTitikTri[i].X * (scale - 0.25*ClickZoomOutB));
           TTitikTri[i].Y:=round(TTitikTri[i].Y * (scale - 0.25*ClickZoomOutB));
            // ---------- kembalikan ke titik semula -------
           TTitikTri[i].X:=TTitikTri[i].X+TOB.x;
           TTitikTri[i].Y:=TTitikTri[i].Y+TOB.y;
       end;
         drawObject;
     end

     else if NoObjek=3 then
     begin
       ClickZoomOut(0,0,1,0,0,0,0,0,0,0);
       TTitikCir:=TTitikCir2;
       midPoint;
       for i:=1 to 2 do
         begin
            // ---------- translasi fix point ke pusat -------
           TTitikCir[i].X:=TTitikCir[i].X-TOB.x;
           TTitikCir[i].Y:=TTitikCir[i].Y-TOB.y;
            // ---------- Scaling -------
           TTitikCir[i].X:=round(TTitikCir[i].X * ( scale- 0.25*ClickZoomOutC));
           TTitikCir[i].Y:=round(TTitikCir[i].Y * (scale - 0.25*ClickZoomOutC));
            // ---------- kembalikan ke titik semula -------
           TTitikCir[i].X:=TTitikCir[i].X+TOB.x;
           TTitikCir[i].Y:=TTitikCir[i].Y+TOB.y;
       end;
       drawObject;
     end

     else if NoObjek=4 then
     begin
        ClickZoomOut(0,0,0,1,0,0,0,0,0,0);
       TTitikJG:=TTitikJG2;
       midPoint;
       for i:=1 to 5 do
         begin
            // ---------- translasi fix point ke pusat -------
           TTitikJG[i].X:=TTitikJG[i].X-TOB.x;
           TTitikJG[i].Y:=TTitikJG[i].Y-TOB.y;
            // ---------- Scaling -------
           TTitikJG[i].X:=round(TTitikJG[i].X  * (scale - 0.25*ClickZoomOutD));
           TTitikJG[i].Y:=round(TTitikJG[i].Y  * (scale - 0.25*ClickZoomOutD));
            // ---------- kembalikan ke titik semula -------
           TTitikJG[i].X:=TTitikJG[i].X+TOB.x;
           TTitikJG[i].Y:=TTitikJG[i].Y+TOB.y;
       end;
     drawObject;
     end

     else if NoObjek=5 then
     begin
     ClickZoomOut(0,0,0,0,1,0,0,0,0,0);
       TTitikBK:=TTitikBK2;
       midPoint;
       for i:=1 to 5 do
         begin
            // ---------- translasi fix point ke pusat -------
           TTitikBK[i].X:=TTitikBK[i].X-TOB.x;
           TTitikBK[i].Y:=TTitikBK[i].Y-TOB.y;
            // ---------- Scaling -------
           TTitikBK[i].X:=round(TTitikBK[i].X* (scale - 0.25* ClickZoomOutE));
           TTitikBK[i].Y:=round(TTitikBK[i].Y * (scale - 0.25* ClickZoomOutE));
            // ---------- kembalikan ke titik semula -------
           TTitikBK[i].X:=TTitikBK[i].X+TOB.x;
           TTitikBK[i].Y:=TTitikBK[i].Y+TOB.y;
       end;
     drawObject;
     end

     else if NoObjek=6 then
     begin
        ClickZoomOut(0,0,0,0,0,1,0,0,0,0);
       TTitikSiku:=TTitikSiku2;
       midPoint;
       for i:=1 to 4 do
         begin
            // ---------- translasi fix point ke pusat -------
           TTitikSiku[i].X:=TTitikSiku[i].X-TOB.x;
           TTitikSiku[i].Y:=TTitikSiku[i].Y-TOB.y;
            // ---------- Scaling -------
           TTitikSiku[i].X:=round(TTitikSiku[i].X* (scale - 0.25* ClickZoomOutF));
           TTitikSiku[i].Y:=round(TTitikSiku[i].Y * (scale - 0.25* ClickZoomOutF));
            // ---------- kembalikan ke titik semula -------
           TTitikSiku[i].X:=TTitikSiku[i].X+TOB.x;
           TTitikSiku[i].Y:=TTitikSiku[i].Y+TOB.y;
       end;
     drawObject;
     end

     else if NoObjek=7 then
     begin
        ClickZoomOut(0,0,0,0,0,0,1,0,0,0);
       TTitikLay:=TTitikLay2;
       midPoint;
       for i:=1 to 5 do
         begin
            // ---------- translasi fix point ke pusat -------
           TTitikLay[i].X:=TTitikLay[i].X-TOB.x;
           TTitikLay[i].Y:=TTitikLay[i].Y-TOB.y;
            // ---------- Scaling -------
           TTitikLay[i].X:=round(TTitikLay[i].X* (scale - 0.25* ClickZoomOutG));
           TTitikLay[i].Y:=round(TTitikLay[i].Y * (scale - 0.25* ClickZoomOutG));
            // ---------- kembalikan ke titik semula -------
           TTitikLay[i].X:=TTitikLay[i].X+TOB.x;
           TTitikLay[i].Y:=TTitikLay[i].Y+TOB.y;
       end;
     drawObject;
     end

     else if NoObjek=8 then
     begin
        ClickZoomOut(0,0,0,0,0,0,0,1,0,0);
       TTitikS5:=TTitikS52;
       midPoint;
       for i:=1 to 6 do
         begin
            // ---------- translasi fix point ke pusat -------
           TTitikS5[i].X:=TTitikS5[i].X-TOB.x;
           TTitikS5[i].Y:=TTitikS5[i].Y-TOB.y;
            // ---------- Scaling -------
           TTitikS5[i].X:=round(TTitikS5[i].X* (scale - 0.25* ClickZoomOutH));
           TTitikS5[i].Y:=round(TTitikS5[i].Y * (scale - 0.25* ClickZoomOutH));
            // ---------- kembalikan ke titik semula -------
           TTitikS5[i].X:=TTitikS5[i].X+TOB.x;
           TTitikS5[i].Y:=TTitikS5[i].Y+TOB.y;
       end;
     drawObject;
     end


       else if NoObjek=9 then
     begin
        ClickZoomOut(0,0,0,0,0,0,0,0,1,0);
       TTitikS6:=TTitikS6;
       midPoint;
       for i:=1 to 7 do
         begin
            // ---------- translasi fix point ke pusat -------
           TTitikS6[i].X:=TTitikS6[i].X-TOB.x;
           TTitikS6[i].Y:=TTitikS6[i].Y-TOB.y;
            // ---------- Scaling -------
           TTitikS6[i].X:=round(TTitikS6[i].X* (scale - 0.25* ClickZoomOutI));
           TTitikS6[i].Y:=round(TTitikS6[i].Y * (scale - 0.25* ClickZoomOutI));
            // ---------- kembalikan ke titik semula -------
           TTitikS6[i].X:=TTitikS6[i].X+TOB.x;
           TTitikS6[i].Y:=TTitikS6[i].Y+TOB.y;
       end;
     drawObject;
     end

     else if NoObjek=10 then
     begin
        ClickZoomOut(0,0,0,0,0,0,0,0,0,1);
       TTitikTrap:=TTitikTrap2;
       midPoint;
       for i:=1 to 5 do
         begin
            // ---------- translasi fix point ke pusat -------
           TTitikTrap[i].X:=TTitikTrap[i].X-TOB.x;
           TTitikTrap[i].Y:=TTitikTrap[i].Y-TOB.y;
            // ---------- Scaling -------
           TTitikTrap[i].X:=round(TTitikTrap[i].X* (scale - 0.25* ClickZoomOutJ));
           TTitikTrap[i].Y:=round(TTitikTrap[i].Y * (scale - 0.25* ClickZoomOutJ));
            // ---------- kembalikan ke titik semula -------
           TTitikTrap[i].X:=TTitikTrap[i].X+TOB.x;
           TTitikTrap[i].Y:=TTitikTrap[i].Y+TOB.y;
       end;
     drawObject;
     end;
     drawObject;
     end;



procedure TForm1.EdgeChange(Sender: TObject);
begin

   EdgeValue:=Edge.Value Mod 360;
   sudut:=Edge.Value/180*PI;

end;


procedure TForm1.Rotation;
  var i,tx,ty : integer;
begin
  midPoint;
  if NoObjek=1 then
     begin
       for i:=1 to 6 do
         begin
           //cara pendek
           //TTitikBox[i].x:=TOB.x+(TTitikBox[i].x-TOB.x)*round(cos(sudut))- (TTitikBox[i].y-TOB.y)*round(sin(sudut));
           //TTitikBox[i].y:=TOB.y+(TTitikBox[i].y-TOB.x)*round(sin(sudut))+ (TTitikBox[i].y-TOB.y)*round(cos(sudut));
           TTitikBox[i].X:=TTitikBox[i].X-TOB.x;
           TTitikBox[i].Y:=TTitikBox[i].Y-TOB.y;
           tx:=TTitikBox[i].X;
           ty:=TTitikBox[i].Y;
              // ---------- Rotasi Sebesar sudut  -------
           TTitikBox[i].X:=round(tx*cos(sudut)-ty*sin(sudut));
           TTitikBox[i].Y:=round(tx*sin(sudut)+ty*cos(sudut));
              // ---------- kembalikan ke titik semula -------
           TTitikBox[i].X:=TTitikBox[i].X+TOB.x;
           TTitikBox[i].Y:=TTitikBox[i].Y+TOB.y;
       end;
       end
     else if NoObjek=2 then
     begin
       for i:=1 to 5 do
         begin
           //cara pendek
           //TTitikBox[i].x:=TOB.x+(TTitikBox[i].x-TOB.x)*round(cos(sudut))- (TTitikBox[i].y-TOB.y)*round(sin(sudut));
           //TTitikBox[i].y:=TOB.y+(TTitikBox[i].y-TOB.x)*round(sin(sudut))+ (TTitikBox[i].y-TOB.y)*round(cos(sudut));
           TTitikTri[i].X:=TTitikTri[i].X-TOB.x;
           TTitikTri[i].Y:=TTitikTri[i].Y-TOB.y;
           tx:=TTitikTri[i].X;
           ty:=TTitikTri[i].Y;
              // ---------- Rotasi Sebesar sudut  -------
           TTitikTri[i].X:=round(tx*cos(sudut)-ty*sin(sudut));
           TTitikTri[i].Y:=round(tx*sin(sudut)+ty*cos(sudut));
              // ---------- kembalikan ke titik semula -------
           TTitikTri[i].X:=TTitikTri[i].X+TOB.x;
           TTitikTri[i].Y:=TTitikTri[i].Y+TOB.y;
         end
       end
            else if NoObjek=4 then     //TAMBAHAN jajar genjang
         begin
           for i:=1 to 5 do
             begin
               TTitikJG[i].X:=TTitikJG[i].X-TOB.x;
               TTitikJG[i].Y:=TTitikJG[i].Y-TOB.y;
               tx:=TTitikJG[i].X;
               ty:=TTitikJG[i].Y;
                  // ---------- Rotasi Sebesar sudut  -------
               TTitikJG[i].X:=round(tx*cos(sudut)-ty*sin(sudut));
               TTitikJG[i].Y:=round(tx*sin(sudut)+ty*cos(sudut));
                  // ---------- kembalikan ke titik semula -------
               TTitikJG[i].X:=TTitikJG[i].X+TOB.x;
               TTitikJG[i].Y:=TTitikJG[i].Y+TOB.y;
           end;
       end
            else if NoObjek=5 then     //diamond
         begin
           for i:=1 to 5 do
             begin
               TTitikBK[i].X:=TTitikBK[i].X-TOB.x;
               TTitikBK[i].Y:=TTitikBK[i].Y-TOB.y;
               tx:=TTitikBK[i].X;
               ty:=TTitikBK[i].Y;
                  // ---------- Rotasi Sebesar sudut  -------
               TTitikBK[i].X:=round(tx*cos(sudut)-ty*sin(sudut));
               TTitikBK[i].Y:=round(tx*sin(sudut)+ty*cos(sudut));
                  // ---------- kembalikan ke titik semula -------
               TTitikBK[i].X:=TTitikBK[i].X+TOB.x;
               TTitikBK[i].Y:=TTitikBK[i].Y+TOB.y;
           end;
       end
            else if NoObjek=6 then     //TAMBAHAN jajar genjang
         begin
           for i:=1 to 4 do
             begin
               TTitikSiku[i].X:=TTitikSiku[i].X-TOB.x;
               TTitikSiku[i].Y:=TTitikSiku[i].Y-TOB.y;
               tx:=TTitikSiku[i].X;
               ty:=TTitikSiku[i].Y;
                  // ---------- Rotasi Sebesar sudut  -------
               TTitikSiku[i].X:=round(tx*cos(sudut)-ty*sin(sudut));
                 TTitikSiku[i].Y:=round(tx*sin(sudut)+ty*cos(sudut));
                  // ---------- kembalikan ke titik semula -------
                 TTitikSiku[i].X:=  TTitikSiku[i].X+TOB.x;
                 TTitikSiku[i].Y:=  TTitikSiku[i].Y+TOB.y;
           end;
       end
              else if NoObjek=7 then     //TAMBAHAN jajar genjang
         begin
           for i:=1 to 5 do
             begin
               TTitikLay[i].X:=TTitikLay[i].X-TOB.x;
               TTitikLay[i].Y:=TTitikLay[i].Y-TOB.y;
               tx:=TTitikLay[i].X;
               ty:=TTitikLay[i].Y;
                  // ---------- Rotasi Sebesar sudut  -------
               TTitikLay[i].X:=round(tx*cos(sudut)-ty*sin(sudut));
               TTitikLay[i].Y:=round(tx*sin(sudut)+ty*cos(sudut));
                  // ---------- kembalikan ke titik semula -------
               TTitikLay[i].X:=TTitikLay[i].X+TOB.x;
               TTitikLay[i].Y:=TTitikLay[i].Y+TOB.y;
           end;
       end
               else if NoObjek=8 then     //TAMBAHAN jajar genjang
         begin
           for i:=1 to 6 do
             begin
               TTitikS5[i].X:=TTitikS5[i].X-TOB.x;
               TTitikS5[i].Y:=TTitikS5[i].Y-TOB.y;
               tx:=TTitikS5[i].X;
               ty:=TTitikS5[i].Y;
                  // ---------- Rotasi Sebesar sudut  -------
               TTitikS5[i].X:=round(tx*cos(sudut)-ty*sin(sudut));
                TTitikS5[i].Y:=round(tx*sin(sudut)+ty*cos(sudut));
                  // ---------- kembalikan ke titik semula -------
                 TTitikS5[i].X:=  TTitikS5[i].X+TOB.x;
                 TTitikS5[i].Y:=  TTitikS5[i].Y+TOB.y;
           end;
       end
     else if NoObjek=9 then     //TAMBAHAN segi 6
     begin
       for i:=1 to 7 do
         begin
           TTitikS6[i].X:=TTitikS6[i].X-TOB.x;
           TTitikS6[i].Y:=TTitikS6[i].Y-TOB.y;
           tx:=TTitikS6[i].X;
           ty:=TTitikS6[i].Y;
              // ---------- Rotasi Sebesar sudut  -------
           TTitikS6[i].X:=round(tx*cos(sudut)-ty*sin(sudut));
           TTitikS6[i].Y:=round(tx*sin(sudut)+ty*cos(sudut));
              // ---------- kembalikan ke titik semula -------
           TTitikS6[i].X:=TTitikS6[i].X+TOB.x;
           TTitikS6[i].Y:=TTitikS6[i].Y+TOB.y;
       end;
       end
     else if NoObjek=10 then
         begin
           for i:=1 to 5 do
             begin
               TTitikTrap[i].X:= TTitikTrap[i].X-TOB.x;
               TTitikTrap[i].Y:= TTitikTrap[i].Y-TOB.y;
               tx:= TTitikTrap[i].X;
               ty:= TTitikTrap[i].Y;
                  // ---------- Rotasi Sebesar sudut  -------
               TTitikTrap[i].X:=round(tx*cos(sudut)-ty*sin(sudut));
               TTitikTrap[i].Y:=round(tx*sin(sudut)+ty*cos(sudut));
                  // ---------- kembalikan ke titik semula -------
               TTitikTrap[i].X:= TTitikTrap[i].X+TOB.x;
               TTitikTrap[i].Y:= TTitikTrap[i].Y+TOB.y;
           end;
       end;


          //Label1.Caption:=TOB.y.ToString();
          drawObject;

end;

procedure TForm1.FillColorClick(Sender: TObject);
begin

//canvas2
   //FillCol:=FillColor.ButtonColor;
   //drawObject;

   //canvas1
    paintbmp.Canvas.Brush.Color:=FillCol;
    Canvas1.Canvas.Brush.Color:=FillCol;

    //canvas2
    FillCol:=FillColor.ButtonColor;
    if Canvas2.Canvas.Pen.Color = Canvas2.Canvas.Brush.Color then begin
       LineCol:=FillCol;
       ColorLine.ButtonColor:=FillColor.ButtonColor;
    end;
    drawObject;


   ////canvas1
   // paintbmp.Canvas.Brush.Color:=FillCol;
   // Canvas1.Canvas.Brush.Color:=FillCol;
end;


procedure TForm1.ClickZoomIn(a : integer; b : integer; c:integer; d: integer; e: integer; f: integer; g:integer;
  h:integer; i:integer; j:integer);
begin
 if a=1 then
 begin
 ClickZoomInA:=ClickZoomInA+1;
 end

 else if b=1 then
 begin
 ClickZoomInB:=ClickZoomInB+1;
 end

 else if c=1 then
 begin
 ClickZoomInC:=ClickZoomInA+C;
 end

 else if d=1 then
 begin
 ClickZoomInD:=ClickZoomInD+1;
 end

 else if e=1 then
 begin
 ClickZoomInE:=ClickZoomInE+1;
 end

 else if f=1 then
 begin
 ClickZoomInF:=ClickZoomInF+1;
 end

 else if g=1 then
 begin
 ClickZoomInG:=ClickZoomInG+1;
 end

 else if h=1 then
 begin
 ClickZoomInH:=ClickZoomInH+1;
 end

 else if i=1 then
 begin
 ClickZoomInI:=ClickZoomInI+1;
 end

 else if j=1 then
 begin
 ClickZoomInJ:=ClickZoomInJ+1;
 end

 else
 begin
  CliCkZoomInA:=0;
  CliCkZoomInB:=0;
  CliCkZoomInC:=0;
  CliCkZoomInD:=0;
  CliCkZoomInE:=0;
  CliCkZoomInF:=0;
  CliCkZoomInG:=0;
  CliCkZoomInH:=0;
  CliCkZoomInI:=0;
  CliCkZoomInJ:=0;
   end;
   end;


procedure TForm1.ClickZoomOut(a : integer; b : integer; c:integer; d: integer; e: integer; f: integer; g:integer;
  h:integer; i:integer; j:integer);

begin
 if (a=1) then
 begin
 ClickZoomOutA:=ClickZoomOutA+1;
 end

 else if (b=1) then
 begin
 ClickZoomOutB:=ClickZoomOutB+1;
 end

 else if (c=1) then
 begin
 ClickZoomOutC:=ClickZoomOutC+1;
 end

 else if (d=1) then
 begin
 ClickZoomOutD:=ClickZoomOutD+1;
 end

 else if (e=1) then
 begin
 ClickZoomOutE:=ClickZoomOutE+1;
 end

 else if (f=1) then
 begin
 ClickZoomOutF:=ClickZoomOutF+1;
 end

 else if (g=1) then
 begin
 ClickZoomOutG:=ClickZoomOutG+1;
 end

 else if (h=1) then
 begin
 ClickZoomOutH:=ClickZoomOutH+1;
 end

 else if (i=1) then
 begin
 ClickZoomOutI:=ClickZoomOutI+1;
 end

 else if (j=1) then
 begin
 ClickZoomOutJ:=ClickZoomOutJ+1;
 end

 else
 begin
  CliCkZoomOutA:=0;
  CliCkZoomOutB:=0;
  CliCkZoomOutC:=0;
  CliCkZoomOutD:=0;
  CliCkZoomOutE:=0;
  CliCkZoomOutF:=0;
  CliCkZoomOutG:=0;
  CliCkZoomOutH:=0;
  CliCkZoomOutI:=0;
  CliCkZoomOutJ:=0;
   end;
   end;

procedure TForm1.BitBtnNewClick(Sender: TObject);
begin
  // if our bitmap is already Create-ed (TBitmap.Create)
    // then start fresh
    if paintbmp <> nil then
      paintbmp.Destroy;

    paintbmp := TBitmap.Create;

    paintbmp.SetSize(Canvas1.Width, Canvas1.Height);
    paintbmp.Canvas.FillRect(0,0,paintbmp.Width,paintbmp.Height);

    paintbmp.Canvas.Brush.Style:=bsClear;
    Canvas1.Canvas.Brush.Style:=bsClear;

    paintbmp.Canvas.Pen.Color:=ColorLine.ButtonColor;
    paintbmp.Canvas.Pen.Width:=SpinEdit1.Value;



    //canvas2
  ClickZoomIn(0,0,0,0,0,0,0,0,0,0); //tambahin ini
ClickZoomOut(0,0,0,0,0,0,0,0,0,0);
  Canvas2.Canvas.Brush.Color:=clWhite;
  Canvas2.Canvas.Clear;
  SpinEdit1.Value:=0;
  SpinEdit2.Value:=0;
  Edge.Value:=0;
  ColorLine.ButtonColor:=clBlack;
  FillColor.ButtonColor:=clWhite;

   Canvas1Paint(Sender);

  //FormCreate(Sender);


end;



procedure TForm1.BitBtnSaveClick(Sender: TObject);
begin
    SaveDialog1.Execute;

  if SaveDialog1.Files.Count > 0 then begin
    // if the user enters a file name without a .bmp
    // extension, we will add it
    if RightStr(SaveDialog1.FileName, 4) <> '.png' then
      SaveDialog1.FileName:=SaveDialog1.FileName+'.png';

    paintbmp.SaveToFile(SaveDialog1.FileName);
  end;
end;

procedure TForm1.Canvas1Paint(Sender: TObject);
begin

             //TTitikBox[1].x:=50;
   //TTitikBox[1].y:=50;

   //TTitikBox[2].x:=100;
   //TTitikBox[2].y:=50;
   //TTitikBox[3].x:=100;
   //TTitikBox[3].y:=100;
   //TTitikBox[4].x:=50;
   //TTitikBox[4].y:=100;
   //TTitikBox[5].x:=TTitikBox[1].x;
   //TTitikBox[5].y:=TTitikBox[1].y;

   //BoxAsli:=TTitikBox;
   //
    //Canvas1.Canvas.Polyline(TTitikBox);
   //   drawObject(NoObjek);
//    Canvas1.Canvas.Brush.Color:=clWhite;
//    Canvas1.Canvas.Brush.Style:=bsSolid;
//    Canvas1.Canvas.Pen.Color:=clBlue;
//    Canvas1.Canvas.Pen.Width:=2;
////
//     Canvas1.Canvas.Polyline(TTitikBox);


  //Canvas1.Canvas.Rectangle(50,50,400,300);


 // if Canvas1.Width<>paintbmp.Width then begin
    //Canvas1.Width:=paintbmp.Width;
    // the resize will run this function again
    // so we skip the rest of the code
  //  Exit;
  //end;
  //if Canvas1.Height<>paintbmp.Height then begin
    //Canvas1.Height:=paintbmp.Height;
    // the resize will run this function again
    // so we skip the rest of the code
   // Exit;
 // end;         //  Canvas1.Canvas.Rectangle(300,200,400,100);
    //Canvas1.Canvas.Draw(0,0,paintbmp);
  //Canvas1.Canvas.Draw(Canvas1.Width,Canvas1.Height,paintbmp);

    if Canvas1.Width<>paintbmp.Width then begin
    Canvas1.Width:=paintbmp.Width;
    // the resize will run this function again
    // so we skip the rest of the code
    Exit;
  end;
  if Canvas1.Height<>paintbmp.Height then begin
   Canvas1.Height:=paintbmp.Height;
    // the resize will run this function again
    // so we skip the rest of the code
    Exit;
  end;
  Canvas1.Canvas.Draw(0,0,paintbmp);
  end;

procedure TForm1.ColorBox1Change(Sender: TObject);
begin

end;


procedure TForm1.Canvas1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MouseIsDown := True;
  PrevX := X;
  PrevY := Y;



  end;



procedure TForm1.Canvas1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if MouseIsDown = true then begin
     Canvas1.Canvas.Pen.Style:=style_line;

     if ToolSquare.Active=true then begin
      Canvas1.Cursor:=crCross;
      style_lineBtn.Enabled:=True;
      Canvas1Paint(Sender);
      Canvas1.Canvas.Rectangle(PrevX, PrevY, X, Y);


      end
     else if ToolTriangle.Active=true then begin
      Canvas1.Cursor:=crCross;
      Canvas1.Canvas.Pen.Style:=style_line;
      Canvas1Paint(Sender);
      Canvas1.Canvas.Line(PrevX,Y,PrevX+((X-PrevX) div 2), PrevY);
      Canvas1.Canvas.Line(PrevX+((X-PrevX) div 2),PrevY,X,Y);
      Canvas1.Canvas.Line(PrevX,Y,X,Y);
     end
     else if ToolCircle.Active=true then begin
     Canvas1.Cursor:=crCross;
     Canvas1Paint(Sender);
     Canvas1.Canvas.Ellipse(PrevX, PrevY, X, Y);
     end
       else if ToolLine.Active=true then begin
        Canvas1Paint(Sender);
        Canvas1.Canvas.Line(PrevX,PrevY,X,Y);
      end
        else if ToolHexagon.Active=true then begin
      Canvas1.Cursor:=crCross;
      Canvas1.Canvas.Pen.Style:=style_line;
      Canvas1Paint(Sender);
      Canvas1.Canvas.Line(PrevX, PrevY+((Y-PrevY) div 2),PrevX+((X-PrevX) div 4),PrevY);
      Canvas1.Canvas.Line(PrevX+((X-PrevX) div 4),PrevY, PrevX+((X-PrevX)*3 div 4),PrevY);
      Canvas1.Canvas.Line(PrevX+((X-PrevX)*3 div 4), PrevY, X,PrevY+((Y-PrevY) div 2));
      Canvas1.Canvas.Line(X, PrevY+((Y-PrevY) div 2), PrevX+((X-PrevX)*3 div 4), Y);
      Canvas1.Canvas.Line(PrevX+((X-PrevX)*3 div 4), Y,PrevX+((X-PrevX) div 4), Y);
      Canvas1.Canvas.Line(PrevX+((X-PrevX) div 4), Y, PrevX,PrevY+((Y-PrevY) div 2) );
     end
      else if ToolParallelogram.Active=true then begin
      Canvas1.Cursor:=crCross;
      Canvas1.Canvas.Pen.Style:=style_line;
      Canvas1Paint(Sender);
      Canvas1.Canvas.Line(PrevX, Y, PrevX+((X-PrevX)div 4), PrevY);
      Canvas1.Canvas.Line(PrevX+((X-PrevX)div 4), PrevY, X, PrevY);
      Canvas1.Canvas.Line(X, PrevY, PrevX+((X-PrevX)*3 div 4), Y);
      Canvas1.Canvas.Line(PrevX+((X-PrevX)*3 div 4), Y,PrevX, Y);
      end
       else if ToolDiamond.Active=true then begin
      Canvas1.Cursor:=crCross;
      Canvas1.Canvas.Pen.Style:=style_line;
      Canvas1Paint(Sender);
      Canvas1.Canvas.Line(PrevX, PrevY+((Y-PrevY) div 2),PrevX+((X-PrevX) div 2),PrevY);
      Canvas1.Canvas.Line(PrevX+((X-PrevX) div 2), PrevY, X,PrevY+((Y-PrevY) div 2));
      Canvas1.Canvas.Line(X, PrevY+((Y-PrevY) div 2), PrevX+((X-PrevX) div 2), Y);
      Canvas1.Canvas.Line(PrevX+((X-PrevX) div 2), Y, PrevX,PrevY+((Y-PrevY) div 2) );
      end
      else if ToolRightTriangle.Active then begin
      Canvas1.Cursor:=crCross;
      Canvas1.Canvas.Pen.Style:=style_line;
      Canvas1Paint(Sender);
      Canvas1.Canvas.Line(PrevX, PrevY,X, Y);
      Canvas1.Canvas.Line(X,Y, PrevX, Y);
      Canvas1.Canvas.Line(PrevX, Y, PrevX, PrevY);
      end
      else if ToolKites.Active= true then begin
      Canvas1.Cursor:=crCross;
      Canvas1.Canvas.Pen.Style:=style_line;
      Canvas1Paint(Sender);
      Canvas1.Canvas.Line(PrevX, PrevY+((Y-PrevY) div 3),PrevX+((X-PrevX)div 2), PrevY);
      Canvas1.Canvas.Line(PrevX+((X-PrevX)div 2), PrevY, X, PrevY+((Y-PrevY) div 3));
      Canvas1.Canvas.Line(X, PrevY+((Y-PrevY) div 3), PrevX+((X-PrevX)div 2), Y);
      Canvas1.Canvas.Line(PrevX+((X-PrevX)div 2), Y, PrevX, PrevY+((Y-PrevY) div 3));
      end
      else if ToolPentagon.Active=true then begin
      Canvas1.Cursor:=crCross;
      Canvas1.Canvas.Pen.Style:=style_line;
      Canvas1Paint(Sender);
        Canvas1.Canvas.Line(PrevX, PrevY+((Y-PrevY)div 2), PrevX+((X-PrevX)div 2), PrevY);
        Canvas1.Canvas.Line(PrevX+((X-PrevX)div 2), PrevY, X, PrevY+((Y-PrevY)div 2));
        Canvas1.Canvas.Line(X, PrevY+((Y-PrevY)div 2), PrevX+((X-PrevX)*3 div 4), Y);
        Canvas1.Canvas.Line(PrevX+((X-PrevX)*3 div 4), Y, PrevX+((X-PrevX) div 4), Y);
        Canvas1.Canvas.Line(PrevX+((X-PrevX) div 4), Y, PrevX, PrevY+((Y-PrevY)div 2));
      end
      else if ToolTrapezoid.Active=true then begin
      Canvas1.Cursor:=crCross;
      Canvas1.Canvas.Pen.Style:=style_line;
      Canvas1Paint(Sender);
        Canvas1.Canvas.Line(PrevX, Y, PrevX+((X-PrevX) div 5), PrevY);
        Canvas1.Canvas.Line(PrevX+((X-PrevX) div 5), PrevY, PrevX+((X-PrevX)*4 div 5), PrevY);
        Canvas1.Canvas.Line(PrevX+((X-PrevX)*4 div 5), PrevY, X, Y);
        Canvas1.Canvas.Line(X, Y, PrevX, Y);

      end
      else if ToolPencil.Active=true then begin
      paintbmp.Canvas.Line(PrevX,PrevY,X,Y);
      Canvas1.Canvas.Line(PrevX,PrevY,X,Y);
      PrevX:=X;
      PrevY:=Y;
      end
      else if ToolEraser.Active=true then begin
      paintbmp.Canvas.Line(PrevX,PrevY,X,Y);
      Canvas1.Canvas.Line(PrevX,PrevY,X,Y);
      Canvas1.Canvas.Pen.Color:=clWhite;
      paintbmp.Canvas.Pen.Color:=clWhite;
      Canvas1.Canvas.Pen.Width:=10;
      paintbmp.Canvas.Pen.Width:=10;

      PrevX:=X;
      PrevY:=Y;
      end;


    PositionX.Caption:=PrevX.ToString;
    PositionY.Caption:=PrevY.ToString;
    PosX.Caption:=X.ToString;
    PosY.Caption:=Y.ToString;

  end;

end;

procedure TForm1.Canvas1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
TempColor : TColor;

begin


  if MouseIsDown then begin

      Canvas1.Cursor:=crHandPoint;
      Canvas1.Canvas.Pen.Color:=ColorLine.ButtonColor;
      paintbmp.Canvas.Pen.Color:=ColorLine.ButtonColor;
      Canvas1.Canvas.Pen.Width:=SpinEdit1.Value;
      paintbmp.Canvas.Pen.Width:=SpinEdit1.Value;
      paintbmp.Canvas.Pen.Style:=style_line;

      if ToolSquare.Active=true then begin
      paintbmp.Canvas.Rectangle(PrevX, PrevY, X, Y);
      style_lineBtn.Enabled:=True;
      end
      else if ToolTriangle.Active=true then begin
      paintbmp.Canvas.Line(PrevX,Y,PrevX+((X-PrevX) div 2), PrevY);
      paintbmp.Canvas.Line(PrevX+((X-PrevX) div 2),PrevY,X,Y);
      paintbmp.Canvas.Line(PrevX,Y,X,Y)
      end
      else if ToolCircle.Active=true then    begin
      paintbmp.Canvas.Ellipse(PrevX, PrevY, X, Y);
      end
      else if ToolDiamond.Active=true then begin
      paintbmp.Canvas.Rectangle(PrevX, PrevY, X, Y);
      style_lineBtn.Enabled:=True;
      end
       else if ToolParallelogram.Active=true then begin
      paintbmp.Canvas.Line(PrevX, Y, PrevX+((X-PrevX)div 4), PrevY);
      paintbmp.Canvas.Line(PrevX+((X-PrevX)div 4), PrevY, X, PrevY);
      paintbmp.Canvas.Line(X, PrevY, PrevX+((X-PrevX)*3 div 4), Y);
      paintbmp.Canvas.Line(PrevX+((X-PrevX)*3 div 4), Y,PrevX, Y);
      end
      else if ToolDiamond.Active=true then begin
      paintbmp.Canvas.Line(PrevX, PrevY+((Y-PrevY) div 2),PrevX+((X-PrevX) div 2),PrevY);
      paintbmp.Canvas.Line(PrevX+((X-PrevX) div 2), PrevY, X,PrevY+((Y-PrevY) div 2));
      paintbmp.Canvas.Line(X, PrevY+((Y-PrevY) div 2), PrevX+((X-PrevX) div 2), Y);
      paintbmp.Canvas.Line(PrevX+((X-PrevX) div 2), Y, PrevX,PrevY+((Y-PrevY) div 2) );
      end
      else if ToolRightTriangle.Active then begin
      paintbmp.Canvas.Line(PrevX, PrevY,X, Y);
      paintbmp.Canvas.Line(X,Y, PrevX, Y);
      paintbmp.Canvas.Line(PrevX, Y, PrevX, PrevY);
      end
      else if ToolHexagon.Active=true then begin
      paintbmp.Canvas.Line(PrevX, PrevY+((Y-PrevY) div 2),PrevX+((X-PrevX) div 4),PrevY);
      paintbmp.Canvas.Line(PrevX+((X-PrevX) div 4),PrevY, PrevX+((X-PrevX)*3 div 4),PrevY);
      paintbmp.Canvas.Line(PrevX+((X-PrevX)*3 div 4), PrevY, X,PrevY+((Y-PrevY) div 2));
      paintbmp.Canvas.Line(X, PrevY+((Y-PrevY) div 2), PrevX+((X-PrevX)*3 div 4), Y);
      paintbmp.Canvas.Line(PrevX+((X-PrevX)*3 div 4), Y, PrevX+((X-PrevX) div 4), Y);
      paintbmp.Canvas.Line(PrevX+((X-PrevX) div 4), Y, PrevX,PrevY+((Y-PrevY) div 2) );
      end
      else if ToolKites.Active= true then begin
      paintbmp.Canvas.Line(PrevX, PrevY+((Y-PrevY) div 3),PrevX+((X-PrevX)div 2), PrevY);
      paintbmp.Canvas.Line(PrevX+((X-PrevX)div 2), PrevY, X, PrevY+((Y-PrevY) div 3));
      paintbmp.Canvas.Line(X, PrevY+((Y-PrevY) div 3), PrevX+((X-PrevX)div 2), Y);
      paintbmp.Canvas.Line(PrevX+((X-PrevX)div 2), Y, PrevX, PrevY+((Y-PrevY) div 3));
      end
      else if ToolPentagon.Active=true then begin
        paintbmp.Canvas.Line(PrevX, PrevY+((Y-PrevY)div 2), PrevX+((X-PrevX)div 2), PrevY);
        paintbmp.Canvas.Line(PrevX+((X-PrevX)div 2), PrevY, X, PrevY+((Y-PrevY)div 2));
        paintbmp.Canvas.Line(X, PrevY+((Y-PrevY)div 2), PrevX+((X-PrevX)*3 div 4), Y);
        paintbmp.Canvas.Line(PrevX+((X-PrevX)*3 div 4), Y, PrevX+((X-PrevX) div 4), Y);
        paintbmp.Canvas.Line(PrevX+((X-PrevX) div 4), Y, PrevX, PrevY+((Y-PrevY)div 2));
      end
      else if ToolTrapezoid.Active=true then begin
        paintbmp.Canvas.Line(PrevX, Y, PrevX+((X-PrevX) div 5), PrevY);
        paintbmp.Canvas.Line(PrevX+((X-PrevX) div 5), PrevY, PrevX+((X-PrevX)*4 div 5), PrevY);
        paintbmp.Canvas.Line(PrevX+((X-PrevX)*4 div 5), PrevY, X, Y);
        paintbmp.Canvas.Line(X, Y, PrevX, Y);
      end
      else if ToolFloodFill.Active=true then begin
      TempColor := paintbmp.Canvas.Pixels[X, Y];
      paintbmp.Canvas.Brush.Style := bsSolid;
      paintbmp.Canvas.Brush.Color :=FillColor.ButtonColor;
      paintbmp.Canvas.FloodFill(X, Y, TempColor,fsSurface);
      paintbmp.Canvas.Brush.Style := bsClear;
      Canvas1Paint(Sender);
      end
      else if ColorDropper.Active=true then begin
      FillColor.ButtonColor:=Canvas1.Canvas.Pixels[X,Y];
      Canvas1Paint(Sender);
      end
      else if ToolLine.Active=true then begin
      paintbmp.Canvas.Line(PrevX, PrevY, X, Y);
      end;



  MouseIsDown:=False;

end;
  end;

end.
