inherited FTelaCadastroResponsavel: TFTelaCadastroResponsavel
  Caption = 'Cadastro de Respons'#225'vel'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited Consulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 0
      ExplicitHeight = 0
      inherited Panel2: TPanel
        object GroupBox3: TGroupBox
          Left = 66
          Top = 2
          Width = 103
          Height = 47
          Caption = 'Tipo'
          TabOrder = 4
          object RadioButton1: TRadioButton
            Left = 22
            Top = 19
            Width = 51
            Height = 25
            Caption = 'Nome'
            TabOrder = 0
          end
        end
      end
    end
    inherited DadosCadastrais: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 775
      ExplicitHeight = 386
      inherited PanelBotoes: TPanel
        inherited BitBtnCancela: TBitBtn
          Top = 7
          ExplicitTop = 7
        end
      end
      inherited PageControlEdit: TPageControl
        inherited DadosPrincipais: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 767
          ExplicitHeight = 301
          inherited PanelEdits: TPanel
            ExplicitLeft = 0
            ExplicitTop = 0
            object Label6: TLabel
              Left = 32
              Top = 46
              Width = 46
              Height = 13
              Caption = 'Pessoa :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel
              Left = 28
              Top = 88
              Width = 50
              Height = 13
              Caption = 'Entrada :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel
              Left = 184
              Top = 88
              Width = 33
              Height = 13
              Caption = 'Sa'#237'da :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label5: TLabel
              Left = 23
              Top = 123
              Width = 55
              Height = 13
              Caption = 'Ocupa'#231#227'o :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object LabeledEditPessoa: TEdit
              Left = 102
              Top = 43
              Width = 62
              Height = 21
              MaxLength = 10
              NumbersOnly = True
              TabOrder = 0
              OnExit = LabeledEditPessoaExit
            end
            object BitBtn3: TBitBtn
              Left = 172
              Top = 41
              Width = 31
              Height = 25
              Caption = 'P'
              TabOrder = 1
              OnClick = BitBtn3Click
            end
            object LabeledEditNomePessoa: TEdit
              Left = 211
              Top = 43
              Width = 396
              Height = 21
              ReadOnly = True
              TabOrder = 2
            end
            object MaskEditDtInicio: TMaskEdit
              Left = 102
              Top = 85
              Width = 63
              Height = 21
              Color = clWhite
              EditMask = '!99/99/9999;1;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 10
              ParentFont = False
              TabOrder = 3
              Text = '  /  /    '
              OnExit = MaskEditDtInicioExit
            end
            object MaskEdit1: TMaskEdit
              Left = 240
              Top = 85
              Width = 64
              Height = 21
              Color = clWhite
              EditMask = '!99/99/9999;1;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 10
              ParentFont = False
              TabOrder = 4
              Text = '  /  /    '
              OnExit = MaskEdit1Exit
            end
            object CheckBox1: TCheckBox
              Left = 102
              Top = 160
              Width = 139
              Height = 17
              Caption = 'Respons'#225'vel na Receita'
              TabOrder = 5
            end
            object LabeledEditSenha: TEdit
              Left = 102
              Top = 120
              Width = 197
              Height = 21
              MaxLength = 80
              TabOrder = 6
            end
          end
        end
      end
    end
  end
end
