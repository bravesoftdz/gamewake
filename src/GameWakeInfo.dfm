object Info: TInfo
  Left = 542
  Top = 172
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #220'ber Game Wake'
  ClientHeight = 282
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Sans'
  Font.Style = []
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
    3FFF}
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    405
    282)
  PixelsPerInch = 96
  TextHeight = 14
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 408
    Height = 286
    ActivePage = tsInfo
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object tsInfo: TTabSheet
      Caption = 'Infos'
      DesignSize = (
        400
        257)
      object lVersion: TLabel
        Left = 24
        Top = 56
        Width = 24
        Height = 14
        Caption = 'v 3.1'
        Color = clBtnFace
        ParentColor = False
      end
      object Image: TImage
        Left = 24
        Top = 24
        Width = 32
        Height = 32
        Picture.Data = {
          055449636F6E0000010001002020100001000400E80200001600000028000000
          2000000040000000010004000000000080020000000000000000000000000000
          0000000000000000000080000080000000808000800000008000800080800000
          C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
          FFFFFF0000000000000000000000000000000000000000000007777777770000
          000000000000000007777777777777000000000000000007777FFFF9FFFFFF77
          00000000000000777FFFFFFFFFFFFFF7700000000000077FF9FFFFFFFFFFF9FF
          77000000000077F9FFFFFFFFFFFFFFFFF7700000000077FF9FFFFFFFFFFFFFFF
          FF70000000077FFFF9FFFFFFFFFFFFFFFF77000000077F9FFF9FFFFFFFFFFFFF
          9FF700000077FFFFFFF9FFFFFFFFFFFFFFF770000077FFFFFFFF9FFFFFFFFFFF
          FFF770000077FFFFFFFFF9FFFFFFFFFFFFFF70000077FFFFFFFFFF000FFFFFFF
          FFFF700000779FFFFFFFFF000FFFFFFFFF9F70000077FFFFFFFFFF000FFFFFFF
          FFFF70000077FFFFFFFFF0F0FFFFFFFFFFF770000077FFFFFFFF0FF0FFFFFFFF
          FFF7700000077FFFFFF0FFF0FFFFFFFFFFF7000000077FFFFF0FFFF0FFFFFFFF
          9F7700000000779FF0FFFFF0FFFFFFFFFF700000000077FF0FFFFFFFFFFFFFFF
          F77000000000077FFFFFFFFFFFFFFFFF7700000000007077FF9FFFFFFFFF9FF7
          707000000077070777FFFFFFFFFFF7770707700000F77000077FFFF9FFFF7700
          00777000000F7000000777777777000000F70000000000000000000000000000
          00000000000000000000007770000000000000000000000000000F0707000000
          000000000000000000000F070700000000000000000000000000000000000000
          00000000FFE00FFFFF8003FFFE0000FFFC00007FF800003FF000001FE000000F
          E000000FC0000007C00000078000000380000003800000038000000380000003
          800000038000000380000003C0000007C0000007E000000FE000000FF000001F
          C00000078000000382000083C3800387E7E00FCFFFF83FFFFFF01FFFFFF01FFF
          FFF83FFF}
      end
      object l_copy: TLabel
        Left = 144
        Top = 235
        Width = 112
        Height = 14
        Anchors = [akBottom]
        Caption = #169' P.Meisberger 2014'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lBuild: TLabel
        Left = 16
        Top = 72
        Width = 29
        Height = 14
        Caption = 'Build: '
        Color = clBtnFace
        ParentColor = False
      end
      object mInfo: TMemo
        Left = 80
        Top = 24
        Width = 302
        Height = 195
        Anchors = [akLeft, akTop, akRight, akBottom]
        Lines.Strings = (
          '"Game Wake ist ein virtueller Wecker, den man sich stellen '
          'kann, um nicht, z.B. w'#228'hrend des exzessiven Gamings, die '
          'Pizza im Ofen zu vergessen. Aber auch sonst eignet sich '
          'Game Wake zum Erinnern an alle m'#246'glichen Dinge."'
          ''
          'Game Wake ist durch internationale Copyright-Gesetze '
          'gesch'#252'tzt und unterliegt dem Urheberrecht. Das Copyright '
          'f'#252'r alle Programmteile liegt beim Autor von Game Wake '
          'Philipp Meisberger (PM Code Works). F'#252'r Sch'#228'den an Hard- '
          'und Software, die durch die Benutzung dieses Programms '
          'entstehen, wird keine Haftung '#252'bernommen.'
          '03/2014')
        ReadOnly = True
        TabOrder = 0
      end
      object bOk: TButton
        Left = 309
        Top = 223
        Width = 73
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'OK'
        Default = True
        TabOrder = 1
        OnClick = bOkClick
      end
    end
    object tsHistory: TTabSheet
      Caption = 'Versions History'
      ImageIndex = 1
      DesignSize = (
        400
        257)
      object lCopy2: TLabel
        Left = 144
        Top = 235
        Width = 112
        Height = 14
        Anchors = [akBottom]
        Caption = #169' P.Meisberger 2014'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object mHistroy: TMemo
        Left = 16
        Top = 25
        Width = 366
        Height = 188
        Anchors = [akLeft, akTop, akRight, akBottom]
        Lines.Strings = (
          'Game Wake'
          'Ein Freeware-Programm von PM Code Works'
          ''
          'History'
          '--------'
          ''
          'Version 3.0  [16.03.14]'
          ''
          '- API Version 3'
          '- Updatefunktion verbessert'
          '- Plattformunabh'#228'ngig verbessert'
          '- Source-Code an vielen Stellen vereinfacht'
          ''
          '---------------------------------'
          ''
          'Version 2.1.2  [02.11.13]'
          ''
          '- Plattformunabh'#228'ngig (momentan nur Windows/Debian/Ubuntu)'
          '- neuer Beep-Sound'
          '- Bug im Counter-Modus bei Stunden > 23 behoben'
          '- Sonstige kleine Bug Fixes'
          ''
          '---------------------------------'
          ''
          'Version 2.1.1  [09.10.13]'
          ''
          '- Zeit wird nach Standby aktualisiert (nur Windows)'
          
            '- Bei Klick auf Tray-Icon erscheint ein Balloon Tip mit der Alar' +
            'mzeit'
          '- Bug in "Herunterfahren"-Funktion behoben'
          
            '- "Abbrechen"-Button ist bei Update von Anfang an verf'#252'gbar (nur' +
            ' '
          'Windows)'
          ''
          '---------------------------------'
          ''
          'Version 2.1  [21.06.13]'
          ''
          '- API Version 2.1'
          '- neue Option: Stunden und Minuten k'#246'nnen gekoppelt werden'
          '- Zeit wird nun im Format "HH:MM:SS" dargestellt'
          '- '#196'nderungen im Fenstermanagement und GUI '
          ''
          '---------------------------------'
          ''
          'Version 2.0.1  [03.12.12]'
          ''
          '- Sprachunterst'#252'tzung f'#252'r Englisch und Franz'#246'sich hinzugef'#252'gt'
          '- Update-Funktion verbessert'
          '- automatische Updatesuche kann ge'#228'ndert werden'
          '- GUI '#196'nderungen im Optionenfenster'
          '- Bug beim Speichervorgang behoben'
          ''
          '---------------------------------'
          ''
          'Version 2.0 (NT)  [18.11.12]'
          ''
          '- Game Wake NT: Source Code gr'#246#223'tenteils neugeschrieben'
          '  - Speichervorgang verbessert'
          '  - Alarm als Thread'
          '- neues Alarm-Event "Herunterfahren" hinzugef'#252'gt'
          '- Counter hinzugef'#252'gt'
          '- GUI verbessert'
          '  - Buttons zur Alarmeinstellung hinzugef'#252'gt'
          '- automatische und manuelle Updatefunktion hinzugef'#252'gt'
          '- Zertifikat kann heruntergeladen werden'
          '- kleinere Bug fixes'
          ''
          '---------------------------------'
          ''
          'Version 1.3.1  [09.11.11]'
          ''
          '- Neuer Alarm-Sound "Martinshorn" verf'#252'gbar'
          '- jede Menge Bugfixes'
          ''
          '---------------------------------'
          ''
          'Version 1.3  [24.08.11]'
          ''
          '- Ein Optionen-Men'#252' wurde unter "Bearbeiten" im Main Menu '
          'hinzugef'#252'gt'
          '  - User kann selbst entscheiden, was gespeichert werden soll'
          
            '- "Position speichern"-Funktion ist nun unter Reiter "Optionen" ' +
            'zu '
          'finden'
          '- kleinere Bugfixes'
          ''
          '---------------------------------'
          ''
          'Version 1.2  [17.08.11]'
          ''
          '- Farbe des Blinkens kann frei gew'#228'hlt und gespeichert werden '
          '- Speicherung selbstkreierter Farben m'#246'glich'
          '- Bugfixes'
          ''
          '---------------------------------'
          ''
          'Version 1.1  [14.08.11]'
          ''
          '- Main Menu hinzugef'#252'gt'
          '  - Eingaben k'#246'nnen gespeichert werden'
          '  - Position speichern m'#246'glich'
          '- Text kann bei Alarm angezeigt und (in userconfig) gespeichert '
          'werden'
          '- Game Wake kann bei Alarm (rot) blinken'
          ''
          '---------------------------------'
          ''
          'Version 1.0  [10.08.11]'
          ''
          'Das Erste Mal Game Wake.'
          ''
          
            '----------------------------------------------------------------' +
            '-------------------'
          ''
          'Game Wake ist Freeware. Das hei'#223't, dass das Kopieren und die '
          'Weitergabe von Game Wake, sowie die Ver'#246'ffentlichung auf WWW-'
          
            'Servern und Datentr'#228'gern erlaubt ist. Allerdings muss das Progra' +
            'mm '
          
            'vollst'#228'ndig und in der Original-Form kopiert werden. Das Kopiere' +
            'n von '
          'Teilen des Programmes ist nicht erlaubt.'
          'Soll Game Wake auf eine kommerzielle CD-ROM (mit Magazin) '
          'gepresst werden, w'#228're es nett, mir eine Ausgabe dieser CD-ROM '
          '(mit Magazin) zuschicken. Meine Adresse erfahren Sie unter '
          '"team@pm-codeworks.de".'
          ''
          '10/2013')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object bOk2: TButton
        Left = 309
        Top = 223
        Width = 73
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'OK'
        TabOrder = 1
        OnClick = bOkClick
      end
    end
  end
end
