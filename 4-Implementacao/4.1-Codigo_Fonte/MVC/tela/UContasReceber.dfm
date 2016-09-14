inherited FTelaCadastroContasReceber: TFTelaCadastroContasReceber
  Caption = 'Contas a Receber'
  ClientHeight = 502
  ClientWidth = 827
  ExplicitWidth = 843
  ExplicitHeight = 541
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 827
    Height = 477
    inherited Consulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      inherited Grid: TDBGrid
        Width = 819
        Height = 393
      end
      inherited Panel2: TPanel
        Width = 819
      end
    end
    inherited DadosCadastrais: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 775
      ExplicitHeight = 386
      inherited PanelBotoes: TPanel
        Width = 819
      end
      inherited PageControlEdit: TPageControl
        Width = 819
        Height = 392
        inherited DadosPrincipais: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 767
          ExplicitHeight = 301
          inherited PanelEdits: TPanel
            Width = 811
            Height = 364
            object Label1: TLabel
              Left = 16
              Top = 13
              Width = 88
              Height = 13
              Caption = 'Data Compet'#234'ncia'
            end
            object Label3: TLabel
              Left = 131
              Top = 13
              Width = 81
              Height = 13
              Caption = 'Data Vencimento'
            end
            object Label4: TLabel
              Left = 17
              Top = 274
              Width = 24
              Height = 13
              Caption = 'Valor'
            end
            object MaskEditComp: TMaskEdit
              Left = 16
              Top = 32
              Width = 64
              Height = 21
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 0
              Text = '  /  /    '
            end
            object MaskEditVenc: TMaskEdit
              Left = 131
              Top = 32
              Width = 67
              Height = 21
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 1
              Text = '  /  /    '
            end
            object LabeledEditDoc: TLabeledEdit
              Left = 16
              Top = 80
              Width = 121
              Height = 21
              EditLabel.Width = 54
              EditLabel.Height = 13
              EditLabel.Caption = 'Documento'
              TabOrder = 2
            end
            object LabeledEditPessoa: TLabeledEdit
              Left = 16
              Top = 127
              Width = 80
              Height = 21
              EditLabel.Width = 39
              EditLabel.Height = 13
              EditLabel.Caption = 'Unidade'
              TabOrder = 3
            end
            object LabeledEditdsPessoa: TLabeledEdit
              Left = 102
              Top = 127
              Width = 331
              Height = 21
              EditLabel.Width = 3
              EditLabel.Height = 13
              ReadOnly = True
              TabOrder = 4
            end
            object LabeledEditConta: TLabeledEdit
              Left = 16
              Top = 167
              Width = 80
              Height = 21
              EditLabel.Width = 29
              EditLabel.Height = 13
              EditLabel.Caption = 'Conta'
              TabOrder = 5
            end
            object LabeledEditDsConta: TLabeledEdit
              Left = 102
              Top = 167
              Width = 331
              Height = 21
              EditLabel.Width = 3
              EditLabel.Height = 13
              ReadOnly = True
              TabOrder = 6
            end
            object LabeledEditContraP: TLabeledEdit
              Left = 16
              Top = 207
              Width = 80
              Height = 21
              EditLabel.Width = 70
              EditLabel.Height = 13
              EditLabel.Caption = 'Contra Partida'
              TabOrder = 7
            end
            object LabeledEditDsContra: TLabeledEdit
              Left = 102
              Top = 207
              Width = 331
              Height = 21
              EditLabel.Width = 3
              EditLabel.Height = 13
              ReadOnly = True
              TabOrder = 8
            end
            object BtnContra: TBitBtn
              Left = 439
              Top = 205
              Width = 33
              Height = 25
              Caption = 'P'
              TabOrder = 9
              OnClick = BtnContraClick
            end
            object BtnConta: TBitBtn
              Left = 439
              Top = 165
              Width = 33
              Height = 25
              Caption = 'P'
              TabOrder = 10
              OnClick = BtnContaClick
            end
            object BtnPessoa: TBitBtn
              Left = 439
              Top = 123
              Width = 33
              Height = 25
              Caption = 'P'
              TabOrder = 11
              OnClick = BtnPessoaClick
            end
            object LabeledEditHistorico: TLabeledEdit
              Left = 17
              Top = 247
              Width = 79
              Height = 21
              EditLabel.Width = 41
              EditLabel.Height = 13
              EditLabel.Caption = 'Hist'#243'rico'
              TabOrder = 12
            end
            object LabeledEditDsHist: TLabeledEdit
              Left = 102
              Top = 247
              Width = 331
              Height = 21
              EditLabel.Width = 3
              EditLabel.Height = 13
              ReadOnly = True
              TabOrder = 13
            end
            object BtnHistorico: TBitBtn
              Left = 439
              Top = 245
              Width = 33
              Height = 25
              Caption = 'P'
              TabOrder = 14
              OnClick = BtnHistoricoClick
            end
            object EditValor: TEdit
              Left = 16
              Top = 288
              Width = 80
              Height = 21
              TabOrder = 15
            end
            object LabeledEditComp: TLabeledEdit
              Left = 102
              Top = 288
              Width = 331
              Height = 21
              EditLabel.Width = 65
              EditLabel.Height = 13
              EditLabel.Caption = 'Complemento'
              TabOrder = 16
            end
          end
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 477
    Width = 827
  end
end
