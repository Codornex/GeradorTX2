object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Gerador de arquivo TX2'
  ClientHeight = 477
  ClientWidth = 973
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
  object memoTX2: TMemo
    Left = 484
    Top = 16
    Width = 489
    Height = 403
    Align = alRight
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 458
    Width = 973
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 973
    Height = 16
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
  end
  object Panel3: TPanel
    Left = 0
    Top = 16
    Width = 217
    Height = 403
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 3
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 217
      Height = 19
      Align = alTop
      Alignment = taCenter
      Caption = 'Selecione o TXT Origem'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 183
    end
    object DirectoryListBox1: TDirectoryListBox
      Left = 0
      Top = 46
      Width = 217
      Height = 357
      Align = alClient
      FileList = FLBOrigem
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object DriveComboBox1: TDriveComboBox
      AlignWithMargins = True
      Left = 3
      Top = 22
      Width = 211
      Height = 21
      Align = alTop
      DirList = DirectoryListBox1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel4: TPanel
    Left = 217
    Top = 16
    Width = 267
    Height = 403
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object RGArqTX2: TRadioGroup
      Left = 0
      Top = 0
      Width = 267
      Height = 212
      Align = alClient
      Caption = 'Arquivos TX2 '
      Columns = 3
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Items.Strings = (
        'S1000'
        'S1005'
        'S1010'
        'S1020'
        'S1030'
        'S1035'
        'S1040'
        'S1050'
        'S1060'
        'S2190'
        'S2200'
        'S2205'
        'S2206'
        'S2210'
        'S2230'
        'S2250'
        'S2299')
      ParentFont = False
      TabOrder = 0
      OnClick = RGArqTX2Click
    end
    object RGTipoTX2: TRadioGroup
      Left = 0
      Top = 212
      Width = 267
      Height = 64
      Align = alBottom
      Caption = ' Tipo TX2 '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Inclus'#227'o'
        'Altera'#231#227'o')
      ParentFont = False
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 276
      Width = 267
      Height = 127
      Align = alBottom
      Caption = 'Arquivo Origem'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object FLBOrigem: TFileListBox
        Left = 2
        Top = 17
        Width = 263
        Height = 108
        Align = alClient
        ItemHeight = 15
        Mask = '*.txt'
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 419
    Width = 973
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
    DesignSize = (
      973
      39)
    object btnCopiar: TBitBtn
      Left = 864
      Top = 4
      Width = 106
      Height = 32
      Anchors = [akTop, akRight]
      Caption = 'Copiar TX2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = btnCopiarClick
    end
    object Button1: TButton
      Left = 368
      Top = 8
      Width = 97
      Height = 25
      Caption = 'visible=false'
      TabOrder = 1
      Visible = False
      OnClick = Button1Click
    end
  end
end
