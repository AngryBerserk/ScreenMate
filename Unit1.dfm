object Form1: TForm1
  Left = 599
  Top = 90
  BorderStyle = bsNone
  Caption = 'Form1'
  ClientHeight = 355
  ClientWidth = 511
  Color = clFuchsia
  TransparentColor = True
  TransparentColorValue = clFuchsia
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnMouseDown = FormMouseDown
  OnMouseMove = FormMouseMove
  OnMouseUp = FormMouseUp
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Timer1: TTimer
    Left = 312
    Top = 104
  end
  object PopupMenu1: TPopupMenu
    Left = 56
    Top = 80
    object Close1: TMenuItem
      Caption = 'Close'
      OnClick = Close1Click
    end
  end
  object Timer2: TTimer
    Interval = 1
    OnTimer = Timer2Timer
    Left = 88
    Top = 80
  end
end
