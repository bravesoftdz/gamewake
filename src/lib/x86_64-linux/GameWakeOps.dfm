object Options: TOptions
  Left = 230
  Top = 188
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Optionen'
  ClientHeight = 242
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    426
    242)
  PixelsPerInch = 96
  TextHeight = 14
  object gbSave: TGroupBox
    Left = 16
    Top = 24
    Width = 394
    Height = 97
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Speicher-Optionen'
    TabOrder = 3
    DesignSize = (
      394
      97)
    object cbSaveClock: TCheckBox
      Left = 16
      Top = 16
      Width = 110
      Height = 22
      Caption = 'Uhrzeit speichern'
      TabOrder = 0
    end
    object cbSaveSound: TCheckBox
      Left = 208
      Top = 16
      Width = 173
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Soundauswahl speichern'
      TabOrder = 1
    end
    object cbSaveColor: TCheckBox
      Left = 208
      Top = 40
      Width = 173
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Farbe speichern'
      TabOrder = 3
    end
    object cbSaveText: TCheckBox
      Left = 16
      Top = 40
      Width = 96
      Height = 22
      Caption = 'Text speichern'
      TabOrder = 2
    end
    object cbSavePos: TCheckBox
      Left = 16
      Top = 64
      Width = 113
      Height = 22
      Caption = 'Position speichern'
      TabOrder = 4
    end
  end
  object bOk: TButton
    Left = 335
    Top = 206
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 0
    OnClick = bOkClick
  end
  object bCancel: TButton
    Left = 240
    Top = 206
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'abbrechen'
    TabOrder = 1
    OnClick = bCancelClick
  end
  object bReset: TButton
    Left = 16
    Top = 206
    Width = 97
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Standardwerte'
    TabOrder = 2
    OnClick = bResetClick
  end
  object gbGeneral: TGroupBox
    Left = 16
    Top = 128
    Width = 394
    Height = 68
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Allgemein'
    TabOrder = 4
    object cbCombine: TCheckBox
      Left = 16
      Top = 16
      Width = 167
      Height = 22
      Caption = 'Stunden und Minuten koppeln'
      TabOrder = 0
    end
    object cbUpdate: TCheckBox
      Left = 16
      Top = 36
      Width = 240
      Height = 22
      Caption = 'Beim Start automatisch nach Update suchen'
      TabOrder = 1
    end
  end
end
