object FormMenu: TFormMenu
  Left = 0
  Top = 0
  Caption = 'SGC - Sistema de Gest'#227'o de Condom'#237'nios'
  ClientHeight = 509
  ClientWidth = 924
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 104
    Top = 72
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Pessoa1: TMenuItem
        AutoLineReduction = maAutomatic
        Caption = 'Pessoa'
        ShortCut = 16464
        OnClick = Pessoa1Click
      end
      object Cnae1: TMenuItem
        Caption = 'Cnae'
        OnClick = Cnae1Click
      end
      object NaturezaJurdica1: TMenuItem
        Caption = 'Natureza Jur'#237'dica'
        OnClick = NaturezaJurdica1Click
      end
      object Pas1: TMenuItem
        Caption = 'Pa'#237's'
        OnClick = Pas1Click
      end
      object Estado1: TMenuItem
        Caption = 'Estado'
        OnClick = Estado1Click
      end
      object Cidade1: TMenuItem
        Caption = 'Cidade'
        OnClick = Cidade1Click
      end
      object Condomnio1: TMenuItem
        Caption = 'Condom'#237'nio'
        OnClick = Condomnio1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end