object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gerador de arquivo TX2'
  ClientHeight = 456
  ClientWidth = 840
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
    Left = 351
    Top = 16
    Width = 489
    Height = 375
    Align = alRight
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 437
    Width = 840
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 840
    Height = 16
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
  end
  object Panel3: TPanel
    Left = 0
    Top = 16
    Width = 188
    Height = 375
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 3
    object Label1: TLabel
      Left = 1
      Top = 6
      Width = 183
      Height = 19
      Caption = 'Selecione o TXT Origem'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DirectoryListBox1: TDirectoryListBox
      Left = 0
      Top = 38
      Width = 188
      Height = 337
      Align = alBottom
      FileList = FLBOrigem
      TabOrder = 0
    end
  end
  object Panel4: TPanel
    Left = 188
    Top = 16
    Width = 163
    Height = 375
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object FLBOrigem: TFileListBox
      Left = 5
      Top = 216
      Width = 153
      Height = 159
      ItemHeight = 13
      Mask = '*.txt'
      TabOrder = 0
    end
    object RGArqTX2: TRadioGroup
      Left = 5
      Top = 6
      Width = 153
      Height = 134
      Caption = 'Arquivos TX2 '
      Columns = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'S1000'
        'S1005'
        'S1010'
        'S1020'
        'S1030'
        'S1050'
        'S2190'
        'S2200')
      ParentFont = False
      TabOrder = 1
      OnClick = RGArqTX2Click
    end
    object RGTipoTX2: TRadioGroup
      Left = 6
      Top = 146
      Width = 151
      Height = 64
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
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 391
    Width = 840
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
    object sbConfiguracao: TSpeedButton
      Left = 1
      Top = 6
      Width = 39
      Height = 41
      Hint = 'Configura'#231#245'es'
      Flat = True
      Glyph.Data = {
        42100000424D4210000000000000420000002800000020000000200000000100
        20000300000000100000C30E0000C30E000000000000000000000000FF0000FF
        0000FF0000000000000000000000000000080000002400000027000000270000
        0027000000270000002700000027000000270000002700000027000000270000
        0027000000270000002700000027000000270000002700000027000000270000
        0027000000270000002700000027000000260000000E00000000000000000000
        00000000000000000000000000004444445AA0A0A0D9A6A6A6DBA4A4A4DBA3A3
        A3DBA1A1A1DB9F9F9FDB9E9E9EDB9D9D9DDB9A9A9ADB999999DB979797DB9595
        95DB939393DB919191DB909090DB8F8F8FDB8E8E8EDB8B8B8BDB8A8A8ADB8989
        89DB888888DB858585DB848484DB828282DB5050508500000002000000000000
        0000000000000000000000000000B1B1B191EEEEEEFFE3E3E3FFE3E3E3FFE3E3
        E3FFE3E3E3FFE2E2E2FFE2E2E2FFE2E2E2FFE2E2E2FFE2E2E2FFE2E2E2FFE1E1
        E1FFE1E1E1FFE1E1E1FFE0E0E0FFE0E0E0FFE0E0E0FFDCDCDCFFD6D6D6FFDFDF
        DFFFE0E0E0FFE0E0E0FFDFDFDFFFDCDCDCFF9E9E9ECC00000004000000000000
        0000000000000000000000000000B5B5B591EBEBEBFFE2E2E2FFE2E2E2FFE2E2
        E2FFE2E2E2FFE2E2E2FFE2E2E2FFE2E2E2FFE2E2E2FFE2E2E2FFE2E2E2FFE2E2
        E2FFE2E2E2FFE2E2E2FFDFDFDFFFC8C8C8FFD8D8D8FFA6A4A3FF807876FFD3D3
        D3FFCACACAFFE0E0E0FFE2E2E2FFE2E2E2FFA6A6A6CD00000004000000000000
        0000000000000000000000000000B5B5B591ECECECFFE5E5E5FFE5E5E5FFE5E5
        E5FFE5E5E5FFE5E5E5FFE5E5E5FFE5E5E5FFE5E5E5FFE5E5E5FFE5E5E5FFE5E5
        E5FFE5E5E5FFE5E5E5FFCDCDCDFF786865FF716A69FF776561FF856A65FF6D66
        66FF72635FFFD0CFCFFFE5E5E5FFE5E5E5FFA9A9A9CD00000004000000000000
        0000000000000000000000000000B6B6B691EDEDEDFFE7E7E7FFE7E7E7FFE7E7
        E7FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7
        E7FFE5E5E5FFB5B5B5FF8F8E8EFF9B817CFFC1ADA9FFC8B6B3FFC7B5B1FFBDA9
        A5FF947973FF919090FFB6B6B6FFE6E6E6FFACACACCD00000004000000000000
        0000000000000000000000000000B8B8B891EEEEEEFFE8E8E8FFE8E8E8FFE8E8
        E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8
        E8FFE5E5E5FFA39391FF99807CFFC0A9A6FFAD918DFFAB8F8AFFAA8D88FFA88C
        87FFBAA29DFF8D736FFF93817EFFE5E5E5FFB0B0B0CD00000004000000000000
        0000000000000000000000000000B8B8B891EFEFEFFFE8E8E8FFE8E8E8FFE8E8
        E8FFE8E8E8FFE8E8E8FFE8E8E8FFE5E5E5FFB4B4B4FFBFBFBFFFE7E7E7FFE8E8
        E8FFDCDCDCFFA49E9EFFBA9D98FFB89C97FFBFA5A1FFDBC8C7FFDBC8C6FFBA9F
        9CFFAD918CFFAD8F8BFFA09897FFE1E1E1FFB3B3B3CD00000004000000000000
        0000000000000000000000000000BABABA91F0F0F0FFE9E9E9FFE9E9E9FFE8E8
        E8FFC8C8C8FFCDCDCDFFE5E5E5FFCCCCCCFF735F5BFF7B6C69FFDEDEDEFFD4D4
        D4FFA29D9DFFA7928EFFC0A49FFFCAB1AEFFCCB5B3FFDBD9D9FFD9D8D8FFC7B0
        AEFFBA9F9CFFB19490FF8B7774FFC1BEBDFFB8B8B8CD00000004000000000000
        0000000000000000000000000000BABABA91F1F1F1FFECECECFFECECECFFE0E0
        E0FF7A6B68FF746664FF7B7877FF6E6361FF8D7069FF826862FF787372FF7268
        67FF73605DFFC1B3B2FFC9B2AEFFDDCBC9FFBCA5A1FF8D8A8AFF8B8888FFB89F
        9BFFCBB5B2FFBBA09CFFBCABA9FFE0DEDDFFBABABACD00000004000000000000
        0000000000000000000000000000BCBCBC91F2F2F2FFECECECFFE8E8E8FFDFDF
        DFFF8F7A77FF987973FFA68D88FFC7B5B2FFCFBFBCFFCAB9B6FFAB938FFF9072
        6CFF7F6560FF9A9696FFC9B5B2FFE8DBD9FFE3D4D3FFBCAAA7FFBFAEABFFDECF
        CDFFE2D3D2FFCAB3B1FFA7A1A1FFEBEBEBFFBEBEBECD00000004000000000000
        0000000000000000000000000000BCBCBC91F3F3F3FFCACACAFF85807FFF7F7A
        7AFF9A807CFFD2C2BFFFEDE2E1FFECDDDDFFEAD9D9FFEBDCDCFFEEE2E2FFDCCE
        CCFF9B817CFFA99C9BFFC3B5B3FFBEABA7FFF0E6E5FFF4EBEBFFF4EBEBFFF2E8
        E8FFEADFDEFFDDD2D1FFCEC3C2FFEDEDEDFFC2C2C2CD00000004000000000000
        0000000000000000000000000000BDBDBD91F4F4F4FFBDB4B2FFA1827EFFA386
        82FFCEBAB8FFDDCAC9FFE6D4D4FFE8D6D6FFE8D6D6FFE8D6D6FFE7D5D5FFE0CD
        CCFFD7C5C3FF9B7E79FF92746EFFAE9C99FFCDBDBBFFD1C1BFFFD9CCCAFFE5DB
        DAFFE1D8D8FFDDDCDCFFF0F0F0FFF0F0F0FFC5C5C5CD00000004000000000000
        0000000000000000000000000000BFBFBF91F5F5F5FFEBEAEAFFB3A19EFFBCA0
        9CFFCEB6B4FFD9C3C2FFE5D3D2FFE7D5D5FFE8D6D6FFE7D5D5FFE7D5D5FFDDC9
        C8FFCFB9B7FFBCA39FFF947B77FFDEDAD9FFEDECECFFECE8E8FFECE8E8FFE9E8
        E8FFEEEBEBFFEEEDEDFFF2F2F2FFF2F2F2FFC9C9C9CD00000004000000000000
        0000000000000000000000000000C1C1C191E5E5E5FFA4A4A4FFA18D8AFFBEA0
        9BFFC9AEABFFD5BEBBFFDCC7C5FFE8DBDBFFF0E9E9FFEADEDEFFDAC6C5FFD7C1
        C0FFCAB2AFFFBDA19EFF977F7CFFACACACFFE7E7E7FFF4F4F4FFF3F2F2FFF2F2
        F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFCCCCCCCD00000004000000000000
        0000000000000000000000000000C1C1C191CDCAC9FFAF9793FFC2A7A3FFBB9E
        99FFC7ADAAFFD0B9B6FFCCB6B3FFE4E3E3FFF7F7F7FFE9E9E9FFC9B6B4FFC9B1
        AFFFC2A9A6FFB69B97FFAC8F8AFF8A7370FFBEB9B8FFF7F7F7FFF7F7F7FFF6F6
        F6FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFCFCFCFCD00000004000000000000
        0000000000000000000000000000C3C3C391E9E7E7FFCFC0BEFFCDB7B5FFB99E
        99FFC7AEABFFCDB7B3FFB89E9BFFBBBABAFFEFEFEFFFC5C5C5FFAF9996FFC4AB
        A8FFBA9F9CFFAE918DFFB69A96FFB6A19EFFDFDBDAFFF8F8F8FFF8F8F8FFF8F8
        F8FFF7F7F7FFF4F4F4FFF4F4F4FFF4F4F4FFD2D2D2CD00000004000000000000
        0000000000000000000000000000C4C4C491F8F8F8FFF6F6F6FFCFC3C2FFB69D
        98FFC7B0ACFFCDB8B4FFB59B97FF8C7875FF7E7675FF867572FFAE928EFFCDB8
        B4FFC4ACA8FFAB8E8AFFB8A4A1FFF0F0F0FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9
        F9FFF9F9F9FFF8F8F8FFF5F5F5FFF5F5F5FFD3D3D3CD00000004000000000000
        0000000000000000000000000000C6C6C691F9F9F9FFD6D6D6FFB8ADACFFC3AE
        AAFFC1ABA7FFCDB9B5FFCFBCB8FFCBB9B6FFCAB8B5FFCDBBB8FFCFBCB9FFCEBB
        B7FFCAB6B1FFCAB5B1FFAA9795FFBFBEBEFFFAFAFAFFFBFBFBFFFBFBFBFFFBFB
        FBFFFBFBFBFFFBFBFBFFF8F8F8FFF7F7F7FFD4D4D4CD00000004000000000000
        0000000000000000000000000000C6C6C691F9F9F9FFE1DEDEFFE9DDDCFFE9DD
        DCFFB09894FFC9B6B2FFD1BFBCFFD2C2BEFFD3C2BFFFD2C2BEFFD1C0BDFFCFBD
        BAFFD5C5C1FFE7DBDAFFC9B4B1FFD0C8C7FFFAFAFAFFFBFBFBFFFBFBFBFFFBFB
        FBFFFBFBFBFFFBFBFBFFFAFAFAFFF7F7F7FFD5D5D5CD00000004000000000000
        0000000000000000000000000000C8C8C891FAFAFAFFF9F9F9FFF0EDEDFFECEA
        EAFFDDD4D3FFB09A95FFBDA9A5FFD0C1BDFFD5C6C2FFD4C5C1FFCDBDB9FFD5C6
        C3FFE4DBDBFFE4E1E1FFEBE8E8FFF4F4F4FFFBFBFBFFFBFBFBFFFAFAFAFFF8F8
        F8FFF6F6F6FFF4F4F4FFF4F4F4FFEFEFEFFFD3D3D3CD00000004000000000000
        0000000000000000000000000000CACACA91FBFBFBFFFBFBFBFFFBFBFBFFF4F4
        F4FFD6CFCFFFF4EEEEFFD5C9C7FFC0AEABFFC3B2AFFFCBBCB9FFE2D8D7FFF2EA
        EAFFD9D1D1FFE5E5E5FFFBFBFBFFFBFBFBFFFBFBFBFFF9F9F9FFF5F5F5FFF1F1
        F1FFEDEDEDFFEBEBEBFFEAEAEAFFE6E6E6FFCDCDCDCD00000004000000000000
        0000000000000000000000000000CACACA91FBFBFBFFFCFCFCFFFCFCFCFFFAFA
        FAFFF1EFEFFFF1EFEFFFF4F3F3FFE8E6E6FFF7F1F1FFE9E5E5FFF4F3F3FFEDEA
        EAFFEFEBEBFFF6F6F6FFFCFCFCFFFCFCFCFFFAFAFAFFF3F3F3FFEEEEEEFFE9E9
        E9FFE5E5E5FFE3E3E3FFE3E3E3FFE2E2E2FFC8C8C8CD00000004000000000000
        0000000000000000000000000000CCCCCC91FBFBFBFFFCFCFCFFFCFCFCFFFCFC
        FCFFFCFCFCFFFCFCFCFFFCFCFCFFF3F3F3FFF7F5F5FFF1F0F0FFFCFCFCFFFCFC
        FCFFFCFCFCFFFCFCFCFFFCFCFCFFFAFAFAFFF4F4F4FFEEEEEEFFE8E8E8FFE3E3
        E3FFDEDEDEFFDBDBDBFFDADADAFFD9D9D9FFB5B5B5C700000002000000000000
        0000000000000000000000000000CDCDCD91FCFCFCFFFCFCFCFFFCFCFCFFFCFC
        FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
        FCFFFCFCFCFFFCFCFCFFFBFBFBFFF7F7F7FFF1F1F1FFD2D2D2FFCFCFCFFFD0D0
        D0FFD1D1D1FFD1D1D1FFCDCDCDFFBDBDBDFC9F9F9F5800000000000000000000
        0000000000000000000000000000CDCDCD91FCFCFCFFFCFCFCFFFCFCFCFFFCFC
        FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
        FCFFFCFCFCFFFCFCFCFFFAFAFAFFF4F4F4FFEDEDEDFFD7D7D7FFFCFCFCFFFCFC
        FCFFFBFBFBFFEFEFEFFFCCCCCCFCAAAAAA5E0000000000000000000000000000
        0000000000000000000000000000CFCFCF91FCFCFCFFFCFCFCFFFCFCFCFFFCFC
        FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
        FCFFFCFCFCFFFCFCFCFFF9F9F9FFF3F3F3FFECECECFFDBDBDBFFFCFCFCFFFBFB
        FBFFEFEFEFFFCDCDCDFCB0B0B05E000000000000000000000000000000000000
        0000000000000000000000000000D1D1D191FCFCFCFFFCFCFCFFFCFCFCFFFCFC
        FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
        FCFFFCFCFCFFFCFCFCFFF9F9F9FFF3F3F3FFECECECFFDFDFDFFFFBFBFBFFEFEF
        EFFFCFCFCFFCB3B3B35E00000000000000000000000000000000000000000000
        0000000000000000000000000000D3D3D391FCFCFCFFFCFCFCFFFCFCFCFFFCFC
        FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
        FCFFFCFCFCFFFCFCFCFFF9F9F9FFF4F4F4FFEEEEEEFFE4E4E4FFEFEFEFFFD1D1
        D1FCB8B8B85E0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000D3D3D391FCFCFCFFFCFCFCFFFCFCFCFFFCFC
        FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
        FCFFFCFCFCFFFCFCFCFFFAFAFAFFF5F5F5FFF0F0F0FFE5E5E5FFD1D1D1FEBEBE
        BE63000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000D6D6D690FCFCFCFFFCFCFCFFFCFCFCFFFCFC
        FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
        FCFFFCFCFCFFFCFCFCFFFBFBFBFFF8F8F8FFF4F4F4FFDEDEDEFEC3C3C36C0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000DDDDDD5CEFEFEFFDF1F1F1FFF1F1F1FFF1F1
        F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1
        F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFEAEAEAFBD3D3D36A000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbConfiguracaoClick
    end
    object sbGeraTx2: TSpeedButton
      Left = 677
      Top = 6
      Width = 163
      Height = 41
      Caption = 'Gerar Arquivo TX2'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        42100000424D4210000000000000420000002800000020000000200000000100
        20000300000000100000120B0000120B000000000000000000000000FF0000FF
        0000FF0000000000000000000000000000000000000000000001000000660000
        00C6000000DF000000DF000000DF000000DF000000DF000000DF000000DF0000
        00DF000000DF000000DF000000DF000000DF000000DF000000DF000000DF0000
        00DF000000DF000000DF000000C6000000660000000100000000000000000000
        00000000000000000000000000000000000000000000000000A20C0B0BFF6866
        63FF898783FF898783FF898783FF898783FF898783FF898783FF898783FF8987
        83FF898783FF898783FF898783FF898783FF898783FF898783FF898783FF8987
        83FF898783FF898783FF686663FF0C0B0BFF000000A200000000000000000000
        0000000000000000000000000000000000000000004C060605FFB7B4B0FFE4E1
        DDFFEBE9E6FFEBE9E6FFEBE9E6FFEBE9E6FFEBE9E6FFEBE9E6FFEBE9E6FFEBE9
        E6FFEBE9E6FFEBE9E6FFEBE9E6FFEBE9E6FFEBE9E6FFEBE9E6FFEBE9E6FFEBE9
        E6FFEBE9E6FFEBE9E6FFE4E1DDFFB6B4B0FF060605FF0000004C000000000000
        0000000000000000000000000000000000000000009D4D4C4BFFE7E4E0FFC3C2
        C3FF616062FFA1A1A2FFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFDFCFCFFE7E4E0FF4D4C4BFF0000009D000000000000
        000000000000000000000000000000000000000000AF666563FFEEECE9FFACAC
        AEFFABA8A6FF97918DFF545253FFA6A6A7FFE4E4E4FFE3E3E3FFF2F2F2FFE4E4
        E4FFE9E9E9FFE7E7E7FFF5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFEEECE9FF666563FF000000AF000000000000
        000000000000000000000000000000000000000000AF676765FFF1EFEDFFEEEE
        EFFF5E5A59FFDED9D5FFD6D0CAFF857D76FF4C4B4BFFAFAEAFFFD1D1D1FFCCCC
        CCFFCACACAFFCFCFCFFFEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF1EFEDFF676765FF000000AF000000000000
        000000000000000000000000000000000000000000AF696867FFF3F2F0FFFFFF
        FFFF666364FFCFC8C1FFE8E5E2FFB5A390FF6A4012FF4D4237FF8A8A8BFFC4C4
        C4FFAFAFAFFFC0C0C0FFB7B7B7FFBBBBBBFFBABABAFFC2C2C2FFBFBFBFFFECEC
        ECFFFFFFFFFFFFFFFFFFFFFFFFFFF3F2F0FF696867FF000000AF000000000000
        000000000000000000000000000000000000000000AF6A6969FFF5F4F3FFFFFF
        FFFF939395FF9C9288FFB59674FFAD5C04FF995000FF7A4103FF584A3EFFB3B2
        B3FFDCDCDCFFEBEBEBFFE5E5E5FFE3E3E3FFE3E3E3FFECECECFFE9E9E9FFE7E7
        E7FFFFFFFFFFFFFFFFFFFFFFFFFFF5F4F3FF6A6969FF000000AF000000000000
        000000000000000000000000000000000000000000AF6B6A6AFFF7F6F5FFFFFF
        FFFFE3E3E3FF4A3C30FF8F4B00FFAC5A00FFAC5A00FF944D00FF733C00FF4C3E
        30FF8D8C8DFFBABABBFFC4C4C4FFCECECEFFC6C6C6FFCFCFCFFFC8C8C8FFCCCC
        CCFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6F5FF6B6A6AFF000000AF000000000000
        000000000000000000000000000000000000000000AF6C6B6BFFF8F8F7FFFFFF
        FFFFFFFFFFFF545251FF733E04FF9A5000FFAE5B00FFA85800FF8E4A00FF6E3A
        01FF4A3D30FF89898AFFA9A9A9FFC0C0C0FFB5B5B5FFB1B1B1FFAEAEAEFFF7F7
        F7FFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F7FF6C6B6BFF000000AF000000000000
        000000000000000000000000000000000000000000AF6C6C6CFFFAF9F8FFFFFF
        FFFFFFFFFFFFECEBECFF604E3CFF824400FF9F5300FFB05C00FFA45600FF8947
        00FF673702FF594E44FFAAAAABFFECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F8FF6C6C6CFF000000AF000000000000
        000000000000000000000000000000000000000000AF6D6D6CFFFBFAFAFFFFFF
        FFFFFEFEFEFFB0B0B0FF7B7B7CFF653E16FF884700FFA35500FFB05C00FF9F53
        00FF824400FF613403FF5C534CFFAAA9ABFFF0F0F1FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFAFAFF6D6D6CFF000000AF000000000000
        000000000000000000000000000000000000000000AF6D6D6DFFFCFBFBFFFFFF
        FFFFFEFEFEFFC1C1C1FFBFBFBFFF57514BFF6E3B03FF8E4A00FFA85700FFAF5B
        00FF9A5000FF7C4100FF5B3206FF56504CFF939394FFD1D1D1FFC5C5C5FFC7C7
        C7FFCFCFCFFFFFFFFFFFFFFFFFFFFCFBFBFF6D6D6DFF000000AF000000000000
        000000000000000000000000000000000000000000AF6E6E6EFFFCFCFCFFFEFE
        FEFFFEFEFEFFEFEFEEFFE5E5E5FFD4D4D4FF634F3BFF743C00FF934D00FFAB59
        00FFAC5A00FF954E00FF763D00FF532F09FF615E5DFFA3A3A4FFE5E5E5FFEAEA
        E9FFF1F1F1FFFEFEFEFFFEFEFEFFFCFCFCFF6E6E6EFF000000AF000000000000
        000000000000000000000000000000000000000000AF6E6E6EFFFDFDFCFFFEFE
        FEFFFCFCFCFFB4B4B4FFC6C6C6FFB1B1B1FF7E7D7EFF5D3B18FF7B4000FF9950
        00FFAE5B00FFA95800FF8F4B00FF6F3A00FF472A0BFF4B4A4BFF818081FFBABA
        BAFFFEFEFEFFFEFEFEFFFEFEFEFFFDFDFCFF6E6E6EFF000000AF000000000000
        000000000000000000000000000000000000000000AF6E6E6EFFFDFDFDFFFEFE
        FEFFFCFCFCFFC6C6C6FFD3D3D3FFC4C4C4FFC0C0C0FF696461FF5D3203FF8143
        00FF9E5200FFB05C00FFA55600FF894800FF683600FF4C361FFF5C5C5DFFB7B7
        B8FFDADADAFFFEFEFEFFFEFEFEFFFDFDFDFF6E6E6EFF000000AF000000000000
        000000000000000000000000000000000000000000AF6F6F6FFFFDFDFDFFFDFD
        FDFFFDFDFDFFE9E8E8FFF0F0EFFFE0DFDFFFEAEAEAFFD9D9D9FF726559FF6635
        00FF874600FFA35500FFB05C00FFA05300FF834400FF613200FF483A2CFF706F
        71FFD6D5D5FFFDFDFDFFFDFDFDFFFDFDFDFF6F6F6FFF000000AF000000000000
        000000000000000000000000000000000000000000AF6F6F6FFFFDFDFDFFFDFD
        FCFFFCFCFCFFAAAAA9FFB4B4B4FFBABABAFFC4C4C4FFACACACFF9B9B9BFF604A
        33FF6C3800FF8D4900FFA75700FFAF5B00FF9B5100FF7D4100FF5A2F02FF3A33
        2DFF7A797BFFF7F7F6FFFDFDFCFFFDFDFDFF6F6F6FFF000000AF000000000000
        000000000000000000000000000000000000000000AF6F6F6FFFFEFDFDFFFCFC
        FBFFFCFCFBFFCACACAFFC7C7C7FFC4C3C3FFD0D0CFFFC8C8C7FFD2D2D2FF8483
        83FF563615FF733C00FF934C00FFAB5900FFAC5A00FF964E00FF763D00FF5A42
        27FF4E4D4EFFA3A2A4FFFCFCFBFFFEFDFDFF6F6F6FFF000000AF000000000000
        000000000000000000000000000000000000000000AF6F6F6FFFFEFEFEFFFBFB
        FAFFFAFAF9FFE3E3E2FFEAE9E9FFEEEDEDFFEAEAE9FFE9E9E8FFEEEDEDFFE8E8
        E7FF9C9896FF5F390FFF7A3F00FF984F00FFAE5B00FFA75700FFA07C55FFABA0
        93FF766B61FF565557FFCCCBCCFFFEFEFEFF6F6F6FFF000000AF000000000000
        000000000000000000000000000000000000000000AF6F6F6FFFFEFEFDFFFAFA
        F9FFFAFAF9FFB0B0B0FFB6B6B5FFB0AFAFFFC4C4C3FFB6B6B5FFF7F7F6FFFAFA
        F9FFF1F0F0FF938B83FF613505FF804300FF995407FFC4A380FFACA297FFA89D
        91FFA5998CFF605A55FF636264FFF2F2F2FF6F6F6FFF000000AF000000000000
        000000000000000000000000000000000000000000AF6F6F6FFFFDFDFDFFF9F8
        F8FFF9F8F8FFDEDEDDFFE7E6E5FFE4E4E3FFE5E5E4FFD3D2D2FFE9E8E7FFE0DF
        DEFFDEDDDCFFD5D5D4FF7E7163FF5E380FFFAA9A89FFD3CDC7FFE3DFDBFFB9B0
        A6FFABA195FF9B8E81FF4A4849FF908F91FF6F6F6FFF000000AF000000000000
        000000000000000000000000000000000000000000AF6F6F6FFFFDFDFDFFF7F7
        F6FFF7F7F6FFC2C2C0FFC7C7C6FFD1D0CFFFC8C7C6FFCCCCCAFFCFCECDFFC9C8
        C7FFD3D2D1FFD0CFCEFFC5C5C4FF8E867FFFA39688FFC3BBB2FFC3BAB1FFE2DE
        DAFFB8AFA5FFBAB0A6FF82786EFF414043FF434343FF000000AF000000000000
        000000000000000000000000000000000000000000AF6F6F6FFFFDFDFCFFF6F5
        F3FFF4F3F2FFA8A7A6FFA8A7A6FFB6B5B4FFBDBCBBFFB0AFAEFFB4B3B2FFAEAD
        ACFFC2C1C0FFBFBEBDFFB7B6B5FF90908FFF837A70FFA99D91FFBCB2A8FFD4CE
        C7FFDBD6D1FFB5ABA2FFB4AA9FFF5B5653FF19191AFF000000AF000000000000
        000000000000000000000000000000000000000000AF6F6F6FFFFCFCFCFFF3F2
        F0FFF3F2F0FFD9D8D6FFD6D5D4FFDBDAD8FFD7D6D4FFDFDFDDFFE5E4E2FFE5E4
        E2FFDADAD8FFDBDAD8FFE3E2E0FFE2E1DFFFBCBBBAFF988E84FFB0A599FFCBC4
        BCFFDAD5CFFFD0CAC3FFB8AFA6FFA49A90FF1B1A1AFF000000AF000000000000
        000000000000000000000000000000000000000000AF6F6F6FFFFCFCFBFFF1EF
        EDFFF0EFEDFFBCBBB9FFBBBAB8FFBCBBB9FFCAC9C7FFBEBCBAFFCECDCBFFBAB9
        B7FFBCBBB9FFBAB9B7FFCCCBC9FFCAC9C7FFB9B8B6FFBBBAB8FFA3998FFFB6AC
        A1FFCEC7BFFFDFDAD6FFC4BDB5FFBBB2A9FF5F5A54FF000000E70000000B0000
        000000000000000000000000000000000000000000AF6F6F6FFFFBFBFAFFEEEC
        E9FFEEECE9FFADACAAFFA9A7A5FFAFAEABFFA7A6A4FFAEADABFFB9B8B5FFAAA9
        A7FFB9B7B5FFAEADABFFAFADABFFBDBBB9FFADABA9FFA7A5A3FF8D8B8AFF9188
        7EFFBDB3A9FFCFC8C1FFE2DEDAFFBAB1A8FFB7AEA5FF11100FFF000000750000
        000000000000000000000000000000000000000000AF6F6F6FFFFBFAFAFFEAE8
        E4FFEAE8E4FFEAE8E4FFEAE8E4FFEAE8E4FFEAE8E4FFEAE8E4FFEAE8E4FFEAE8
        E4FFEAE8E4FFEAE8E4FFEAE8E4FFEAE8E4FFEAE8E4FFEAE8E4FFEAE8E4FFD4D2
        CFFFB5ACA3FFC3BAB1FFD1CAC3FFE2DEDAFFB6ADA4FF6A6561FF000000E00000
        0001000000000000000000000000000000000000009D555555FFFDFDFDFFE8E5
        E1FFE6E3DFFFE6E3DFFFE6E3DFFFE6E3DFFFE6E3DFFFE6E3DFFFE6E3DFFFE6E3
        DFFFE6E3DFFFE6E3DFFFE6E3DFFFE6E3DFFFE6E3DFFFE6E3DFFFE6E3DFFFE6E3
        DFFFD8D5D1FFBFB8B0FFC8C0B8FFD4CEC8FFE2DEDAFFAEA9A4FF000000FF0000
        0025000000000000000000000000000000000000004C060606FFCFCFCFFFFBFB
        FAFFF4F3F1FFF4F3F1FFF4F3F1FFF4F3F1FFF4F3F1FFF4F3F1FFF4F3F1FFF4F3
        F1FFF4F3F1FFF4F3F1FFF4F3F1FFF4F3F1FFF4F3F1FFF4F3F1FFF4F3F1FFF4F3
        F1FFF4F3F1FFEDECEAFFDBD7D4FFD1CAC4FFE0DCD8FFA09B96FF000000FF0000
        001F0000000000000000000000000000000000000000000000A20D0D0DFF7878
        78FF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F
        9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F
        9FFF9F9F9FFF9F9F9FFF767676FF1D1D1CFF2F2C28FF0C0B0BFF000000A60000
        0000000000000000000000000000000000000000000000000001000000660000
        00C6000000DF000000DF000000DF000000DF000000DF000000DF000000DF0000
        00DF000000DF000000DF000000DF000000DF000000DF000000DF000000DF0000
        00DF000000DF000000DF000000C600000082000000990000006A000000010000
        000000000000}
      ParentFont = False
      OnClick = sbGeraTx2Click
    end
    object BitBtn1: TBitBtn
      Left = 336
      Top = 16
      Width = 75
      Height = 25
      Caption = 'BitBtn1'
      TabOrder = 0
      Visible = False
      OnClick = BitBtn1Click
    end
  end
end
