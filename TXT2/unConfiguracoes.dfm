object frmConfiguracoes: TfrmConfiguracoes
  Left = 0
  Top = 0
  Caption = 'Configura'#231#245'es'
  ClientHeight = 115
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object StatusBar1: TStatusBar
    Left = 0
    Top = 96
    Width = 447
    Height = 19
    Panels = <>
    ExplicitLeft = 360
    ExplicitTop = 136
    ExplicitWidth = 0
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 431
    Height = 52
    Caption = ' Local dos arquivos TX2 '
    TabOrder = 1
    object sbSelectDirect: TSpeedButton
      Left = 399
      Top = 25
      Width = 29
      Height = 24
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
        055557777777777775F508888888888880557F5FFFFFFFFFF75F080000000000
        88057577777777775F755080FFFFFF05088057F7FFFFFF7575F70000000000F0
        F08077777777775757F70FFFFFFFFF0F008075F5FF5FF57577F750F00F00FFF0
        F08057F775775557F7F750FFFFFFFFF0F08057FF5555555757F7000FFFFFFFFF
        0000777FF5FFFFF577770900F00000F000907F775777775777F7090FFFFFFFFF
        00907F7F555555557757000FFFFFFFFF0F00777F5FFF5FF57F77550F000F00FF
        0F05557F777577557F7F550FFFFFFFFF0005557F555FFFFF7775550FFF000000
        05555575FF777777755555500055555555555557775555555555}
      NumGlyphs = 2
      OnClick = sbSelectDirectClick
    end
    object edtDiretorioTX2: TEdit
      Left = 3
      Top = 25
      Width = 394
      Height = 24
      TabOrder = 0
    end
  end
  object bConfirmar: TBitBtn
    Left = 363
    Top = 66
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 2
    OnClick = bConfirmarClick
  end
  object OpenDialog1: TOpenDialog
    Left = 336
    Top = 8
  end
end
