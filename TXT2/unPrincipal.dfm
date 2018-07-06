object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Gerador de arquivo TX2'
  ClientHeight = 663
  ClientWidth = 1356
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object FileListBox1: TFileListBox
    Left = 145
    Top = 0
    Width = 145
    Height = 663
    Align = alLeft
    ItemHeight = 13
    Mask = '*.txt'
    TabOrder = 0
    OnDblClick = FileListBox1DblClick
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 0
    Top = 0
    Width = 145
    Height = 663
    Align = alLeft
    FileList = FileListBox1
    TabOrder = 1
  end
  object Button1: TButton
    Left = 296
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Gerar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 392
    Top = 0
    Width = 964
    Height = 663
    Align = alRight
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 3
  end
end
