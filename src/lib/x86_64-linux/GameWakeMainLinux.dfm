object Main: TMain
  Left = 237
  Height = 290
  Top = 160
  Width = 298
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Game Wake'
  ClientHeight = 268
  ClientWidth = 298
  Color = clBtnFace
  Font.CharSet = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Arial'
  Icon.Data = {
    FE0200000000010001002020100001000400E802000016000000280000002000
    0000400000000100040000000000800200000000000000000000000000000000
    000000000000000080000080000000808000800000008000800080800000C0C0
    C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
    FF00000000000000000000000000000000000000000000077777777700000000
    00000000000007777777777777000000000000000007777FFFF9FFFFFF770000
    0000000000777FFFFFFFFFFFFFF7700000000000077FF9FFFFFFFFFFF9FF7700
    0000000077F9FFFFFFFFFFFFFFFFF7700000000077FF9FFFFFFFFFFFFFFFFF70
    000000077FFFF9FFFFFFFFFFFFFFFF77000000077F9FFF9FFFFFFFFFFFFF9FF7
    00000077FFFFFFF9FFFFFFFFFFFFFFF770000077FFFFFFFF9FFFFFFFFFFFFFF7
    70000077FFFFFFFFF9FFFFFFFFFFFFFF70000077FFFFFFFFFF000FFFFFFFFFFF
    700000779FFFFFFFFF000FFFFFFFFF9F70000077FFFFFFFFFF000FFFFFFFFFFF
    70000077FFFFFFFFF0F0FFFFFFFFFFF770000077FFFFFFFF0FF0FFFFFFFFFFF7
    700000077FFFFFF0FFF0FFFFFFFFFFF7000000077FFFFF0FFFF0FFFFFFFF9F77
    00000000779FF0FFFFF0FFFFFFFFFF700000000077FF0FFFFFFFFFFFFFFFF770
    00000000077FFFFFFFFFFFFFFFFF7700000000007077FF9FFFFFFFFF9FF77070
    00000077070777FFFFFFFFFFF7770707700000F77000077FFFF9FFFF77000077
    7000000F7000000777777777000000F700000000000000000000000000000000
    0000000000000000007770000000000000000000000000000F07070000000000
    00000000000000000F0707000000000000000000000000000000000000000000
    0000FFE00FFFFF8003FFFE0000FFFC00007FF800003FF000001FE000000FE000
    000FC0000007C000000780000003800000038000000380000003800000038000
    00038000000380000003C0000007C0000007E000000FE000000FF000001FC000
    00078000000382000083C3800387E7E00FCFFFF83FFFFFF01FFFFFF01FFFFFF8
    3FFF
  }
  Menu = MainMenu
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  Position = poDefault
  LCLVersion = '0.9.30.4'
  object lDp: TLabel
    Left = 144
    Height = 28
    Top = 26
    Width = 9
    Caption = ':'
    Font.CharSet = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lHour: TLabel
    Left = 8
    Height = 13
    Top = 8
    Width = 43
    Caption = '00:00:00'
    ParentColor = False
  end
  object lCopy: TLabel
    Left = 95
    Height = 13
    Top = 253
    Width = 106
    Anchors = [akBottom]
    Caption = '© P.Meisberger 2014'
    Font.CharSet = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = lCopyClick
    OnMouseEnter = lCopyMouseEnter
    OnMouseLeave = lCopyMouseLeave
  end
  object lVersion: TLabel
    Left = 264
    Height = 13
    Top = 8
    Width = 25
    Anchors = [akTop, akRight]
    Caption = 'v 3.0'
    ParentColor = False
  end
  object bAlert: TButton
    Left = 8
    Height = 33
    Top = 212
    Width = 136
    Anchors = [akLeft, akBottom]
    Caption = 'Alarm !'
    Default = True
    OnClick = bAlertClick
    TabOrder = 12
  end
  object gpOther: TGroupBox
    Left = 152
    Height = 125
    Top = 80
    Width = 137
    Anchors = [akTop, akLeft, akBottom]
    Caption = 'Bei Alarm'
    ClientHeight = 111
    ClientWidth = 133
    TabOrder = 10
    object cbBlink: TCheckBox
      Left = 12
      Height = 22
      Top = 18
      Width = 58
      Caption = 'blinken'
      OnClick = cbBlinkClick
      TabOrder = 0
    end
    object cbText: TCheckBox
      Left = 12
      Height = 22
      Top = 38
      Width = 90
      Caption = 'Schrift zeigen'
      OnClick = cbTextClick
      TabOrder = 2
    end
    object bChange: TButton
      Left = 12
      Height = 33
      Top = 64
      Width = 109
      Caption = 'Beschriftug ändern'
      Enabled = False
      OnClick = bChangeClick
      TabOrder = 3
    end
    object bColor: TButton
      Left = 80
      Height = 18
      Top = 18
      Width = 40
      Caption = 'Farbe'
      Enabled = False
      OnClick = bColorClick
      TabOrder = 1
    end
  end
  object rgSounds: TRadioGroup
    Left = 8
    Height = 125
    Top = 80
    Width = 137
    Anchors = [akTop, akLeft, akBottom]
    AutoFill = True
    Caption = 'Alarmauswahl'
    ChildSizing.LeftRightSpacing = 6
    ChildSizing.TopBottomSpacing = 6
    ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
    ChildSizing.EnlargeVertical = crsHomogenousChildResize
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclLeftToRightThenTopToBottom
    ChildSizing.ControlsPerLine = 1
    ClientHeight = 111
    ClientWidth = 133
    ItemIndex = 0
    Items.Strings = (
      'Wecker'
      'Horn'
      'Beep'
      'Bing'
      'Herunterfahren'
    )
    TabOrder = 9
  end
  object eHour: TEdit
    Left = 111
    Height = 37
    Top = 24
    Width = 33
    Font.CharSet = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    MaxLength = 2
    OnKeyPress = eHourKeyPress
    OnKeyUp = eHourKeyUp
    ParentFont = False
    TabOrder = 0
    Text = '00'
  end
  object eMin: TEdit
    Left = 152
    Height = 37
    Top = 24
    Width = 33
    Font.CharSet = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    MaxLength = 2
    OnKeyPress = eHourKeyPress
    OnKeyUp = eMinKeyUp
    ParentFont = False
    TabOrder = 1
    Text = '00'
  end
  object bStop: TButton
    Left = 152
    Height = 33
    Top = 212
    Width = 137
    Anchors = [akBottom]
    Caption = 'aus'
    Enabled = False
    OnClick = bStopClick
    TabOrder = 11
    TabStop = False
  end
  object bPlayClock: TButton
    Left = 120
    Height = 17
    Top = 96
    Width = 17
    Caption = '>'
    OnClick = bPlayClockClick
    TabOrder = 6
  end
  object bPlayBing: TButton
    Left = 120
    Height = 17
    Top = 136
    Width = 17
    Caption = '>'
    OnClick = bPlayBingClick
    TabOrder = 8
  end
  object bPlayBeep: TButton
    Left = 120
    Height = 17
    Top = 156
    Width = 17
    Caption = '>'
    OnClick = bPlayBeepClick
    TabOrder = 13
  end
  object bPlayHorn: TButton
    Left = 120
    Height = 17
    Top = 116
    Width = 17
    Caption = '>'
    OnClick = bPlayHornClick
    TabOrder = 7
  end
  object pText: TPanel
    Left = 8
    Height = 124
    Top = 81
    Width = 281
    Caption = 'TEXT'
    Font.CharSet = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -37
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    Visible = False
  end
  object bIncHour: TButton
    Left = 111
    Height = 17
    Top = 7
    Width = 33
    Caption = '+'
    OnClick = bIncHourClick
    TabOrder = 3
  end
  object bDecHour: TButton
    Left = 111
    Height = 17
    Top = 60
    Width = 33
    Caption = '-'
    OnClick = bDecHourClick
    TabOrder = 2
  end
  object bDecMin: TButton
    Left = 152
    Height = 17
    Top = 60
    Width = 33
    Caption = '-'
    OnClick = bDecMinClick
    TabOrder = 4
  end
  object bIncMin: TButton
    Left = 152
    Height = 16
    Top = 8
    Width = 33
    Caption = '+'
    OnClick = bIncMinClick
    TabOrder = 5
  end
  object MainMenu: TMainMenu
    left = 224
    top = 24
    object mmFile: TMenuItem
      Caption = 'Datei'
      object mmSave: TMenuItem
        AutoCheck = True
        Caption = 'Einstellungen speichern'
        Checked = True
        OnClick = mmSaveClick
      end
    end
    object mmEdit: TMenuItem
      Caption = 'Bearbeiten'
      object mmOptions: TMenuItem
        Caption = 'Optionen'
        OnClick = mmOptionsClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mmTimer: TMenuItem
        Caption = 'Timer Modus'
        Checked = True
        RadioItem = True
        OnClick = mmTimerClick
      end
      object mmCounter: TMenuItem
        Caption = 'Counter Modus'
        RadioItem = True
        OnClick = mmCounterClick
      end
    end
    object mmView: TMenuItem
      Caption = 'Ansicht'
      object mmLang: TMenuItem
        Caption = 'Sprache wählen'
      end
    end
    object mmHelp: TMenuItem
      Caption = 'Hilfe'
      object mmUpdate: TMenuItem
        Caption = 'nach Update suchen'
        OnClick = mmUpdateClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mmWebsite: TMenuItem
        Caption = 'Zur Website'
        OnClick = mmWebsiteClick
      end
      object mmDownloadCert: TMenuItem
        Caption = 'Zertifikat herunterladen'
        OnClick = mmDownloadCertClick
      end
      object mmReport: TMenuItem
        Caption = 'Fehler melden'
        OnClick = mmReportClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mmInfo: TMenuItem
        Caption = 'Über'
        OnClick = mmInfoClick
      end
    end
  end
  object pmMenu: TPopupMenu
    left = 48
    top = 24
    object pmOpen: TMenuItem
      Caption = 'Öffnen'
      Default = True
      OnClick = pmOpenClick
    end
    object pmClose: TMenuItem
      Caption = 'Beenden'
      OnClick = pmCloseClick
    end
  end
end
