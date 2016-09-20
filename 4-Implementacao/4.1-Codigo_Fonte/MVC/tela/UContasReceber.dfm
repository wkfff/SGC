inherited FTelaCadastroContasReceber: TFTelaCadastroContasReceber
  Caption = 'Contas a Receber'
  ClientHeight = 502
  ClientWidth = 887
  ExplicitWidth = 903
  ExplicitHeight = 541
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 887
    Height = 477
    ActivePage = DadosCadastrais
    ExplicitWidth = 887
    ExplicitHeight = 477
    inherited Consulta: TTabSheet
      ExplicitWidth = 879
      ExplicitHeight = 449
      inherited Grid: TDBGrid
        Width = 879
        Height = 393
        PopupMenu = PopupMenu1
      end
      inherited Panel2: TPanel
        Width = 879
        ExplicitWidth = 879
        inherited BitBtn2: TBitBtn
          Left = 808
          Top = 10
          ExplicitLeft = 808
          ExplicitTop = 10
        end
        inherited GroupBox1: TGroupBox
          Left = 447
          Top = 3
          Width = 288
          ExplicitLeft = 447
          ExplicitTop = 3
          ExplicitWidth = 288
          inherited EditBusca: TMaskEdit
            Left = 3
            Top = 19
            Width = 273
            ExplicitLeft = 3
            ExplicitTop = 19
            ExplicitWidth = 273
          end
        end
        inherited BotaoConsultar: TBitBtn
          Left = 741
          Top = 10
          ExplicitLeft = 741
          ExplicitTop = 10
        end
        object GroupBox2: TGroupBox
          Left = 63
          Top = 3
          Width = 154
          Height = 47
          Caption = 'Vencimento '
          TabOrder = 4
          object MaskEdit1: TMaskEdit
            Left = 3
            Top = 19
            Width = 66
            Height = 21
            EditMask = '!99/99/9999;1;_'
            MaxLength = 10
            TabOrder = 0
            Text = '  /  /    '
          end
          object MaskEdit2: TMaskEdit
            Left = 79
            Top = 19
            Width = 66
            Height = 21
            EditMask = '!99/99/9999;1;_'
            MaxLength = 10
            TabOrder = 1
            Text = '  /  /    '
          end
        end
        object GroupBox3: TGroupBox
          Left = 223
          Top = 3
          Width = 218
          Height = 47
          Caption = 'Tipo'
          TabOrder = 5
          object RadioButtonValor: TRadioButton
            Left = 3
            Top = 16
            Width = 54
            Height = 28
            Caption = 'Valor'
            TabOrder = 0
          end
          object RadioButtonDoc: TRadioButton
            Left = 53
            Top = 16
            Width = 79
            Height = 28
            Caption = 'Documento'
            TabOrder = 1
          end
          object RadioButton1: TRadioButton
            Left = 136
            Top = 19
            Width = 65
            Height = 25
            Caption = 'Descri'#231#227'o'
            TabOrder = 2
          end
        end
      end
    end
    inherited DadosCadastrais: TTabSheet
      ExplicitWidth = 879
      ExplicitHeight = 449
      inherited PanelBotoes: TPanel
        Width = 879
        ParentBackground = False
        ExplicitWidth = 879
      end
      inherited PageControlEdit: TPageControl
        Width = 879
        Height = 392
        ExplicitWidth = 879
        ExplicitHeight = 392
        inherited DadosPrincipais: TTabSheet
          ExplicitWidth = 871
          ExplicitHeight = 364
          inherited PanelEdits: TPanel
            Width = 871
            Height = 364
            ExplicitWidth = 871
            ExplicitHeight = 364
            object Label1: TLabel
              Left = 16
              Top = 13
              Width = 74
              Height = 13
              Caption = 'Compet'#234'ncia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel
              Left = 102
              Top = 13
              Width = 67
              Height = 13
              Caption = 'Vencimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label4: TLabel
              Left = 17
              Top = 274
              Width = 29
              Height = 13
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
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
              Left = 102
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
              EditLabel.Width = 65
              EditLabel.Height = 13
              EditLabel.Caption = 'Documento'
              EditLabel.Font.Charset = DEFAULT_CHARSET
              EditLabel.Font.Color = clWindowText
              EditLabel.Font.Height = -11
              EditLabel.Font.Name = 'Tahoma'
              EditLabel.Font.Style = [fsBold]
              EditLabel.ParentFont = False
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
              OnExit = LabeledEditPessoaExit
            end
            object LabeledEditConta: TLabeledEdit
              Left = 16
              Top = 167
              Width = 80
              Height = 21
              EditLabel.Width = 29
              EditLabel.Height = 13
              EditLabel.Caption = 'Conta'
              TabOrder = 4
              OnExit = LabeledEditContaExit
            end
            object LabeledEditContraP: TLabeledEdit
              Left = 16
              Top = 207
              Width = 80
              Height = 21
              EditLabel.Width = 70
              EditLabel.Height = 13
              EditLabel.Caption = 'Contra Partida'
              TabOrder = 5
              OnExit = LabeledEditContraPExit
            end
            object BtnContra: TBitBtn
              Left = 439
              Top = 205
              Width = 33
              Height = 25
              Caption = 'P'
              TabOrder = 6
              OnClick = BtnContraClick
            end
            object BtnConta: TBitBtn
              Left = 439
              Top = 165
              Width = 33
              Height = 25
              Caption = 'P'
              TabOrder = 7
              OnClick = BtnContaClick
            end
            object BtnPessoa: TBitBtn
              Left = 439
              Top = 123
              Width = 33
              Height = 25
              Caption = 'P'
              TabOrder = 8
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
              TabOrder = 9
              OnExit = LabeledEditHistoricoExit
            end
            object BtnHistorico: TBitBtn
              Left = 439
              Top = 245
              Width = 33
              Height = 25
              Caption = 'P'
              TabOrder = 10
              OnClick = BtnHistoricoClick
            end
            object EditValor: TEdit
              Left = 16
              Top = 288
              Width = 80
              Height = 21
              TabOrder = 11
            end
            object LabeledEditComp: TLabeledEdit
              Left = 102
              Top = 288
              Width = 331
              Height = 21
              EditLabel.Width = 65
              EditLabel.Height = 13
              EditLabel.Caption = 'Complemento'
              TabOrder = 12
            end
            object LabeledEditDsPessoa: TEdit
              Left = 102
              Top = 127
              Width = 331
              Height = 21
              ReadOnly = True
              TabOrder = 13
            end
            object LabeledEditDsConta: TEdit
              Left = 102
              Top = 167
              Width = 331
              Height = 21
              ReadOnly = True
              TabOrder = 14
            end
            object LabeledEditDsContra: TEdit
              Left = 102
              Top = 207
              Width = 331
              Height = 21
              ReadOnly = True
              TabOrder = 15
            end
            object LabeledEditDsHist: TEdit
              Left = 102
              Top = 247
              Width = 331
              Height = 21
              ReadOnly = True
              TabOrder = 16
            end
          end
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 477
    Width = 887
    ExplicitTop = 477
    ExplicitWidth = 887
  end
  object PanelBaixa: TPanel
    Left = 134
    Top = 41
    Width = 639
    Height = 398
    ParentBackground = False
    TabOrder = 2
    Visible = False
    object GroupBox4: TGroupBox
      AlignWithMargins = True
      Left = 8
      Top = 8
      Width = 623
      Height = 382
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      Align = alClient
      Caption = ' Processar Baixa '
      TabOrder = 0
      object Label5: TLabel
        Left = 6
        Top = 57
        Width = 78
        Height = 13
        Caption = 'Unidade / Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 16
        Top = 138
        Width = 63
        Height = 13
        Caption = 'Valor Baixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 26
        Top = 165
        Width = 53
        Height = 13
        Caption = 'Valor Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 26
        Top = 192
        Width = 53
        Height = 13
        Caption = 'Valor Multa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 7
        Top = 219
        Width = 72
        Height = 13
        Caption = 'Valor Desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 50
        Top = 246
        Width = 33
        Height = 13
        Caption = 'Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 38
        Top = 272
        Width = 41
        Height = 13
        Caption = 'Hist'#243'rico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 18
        Top = 84
        Width = 61
        Height = 13
        Caption = 'Data Baixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TLabel
        Left = 25
        Top = 31
        Width = 54
        Height = 13
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 196
        Top = 30
        Width = 88
        Height = 13
        Caption = 'Data Competencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 19
        Top = 111
        Width = 60
        Height = 13
        Caption = 'Valor Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BtnSair: TBitBtn
        Tag = 2
        Left = 562
        Top = 331
        Width = 51
        Height = 43
        Caption = 'Fechar'
        NumGlyphs = 2
        TabOrder = 14
        OnClick = BtnSairClick
      end
      object EditBxCredito: TEdit
        Left = 96
        Top = 49
        Width = 425
        Height = 21
        ReadOnly = True
        TabOrder = 15
      end
      object EditBxValor: TEdit
        Left = 96
        Top = 130
        Width = 89
        Height = 21
        TabOrder = 2
      end
      object EditBxJuros: TEdit
        Left = 96
        Top = 157
        Width = 89
        Height = 21
        TabOrder = 3
      end
      object EditBxMulta: TEdit
        Left = 96
        Top = 184
        Width = 89
        Height = 21
        TabOrder = 4
      end
      object EditBxDesc: TEdit
        Left = 96
        Top = 211
        Width = 89
        Height = 21
        TabOrder = 5
      end
      object EditBxConta: TEdit
        Left = 96
        Top = 238
        Width = 89
        Height = 21
        TabOrder = 6
        OnExit = EditBxContaExit
      end
      object EditBxDsConta: TEdit
        Left = 191
        Top = 237
        Width = 330
        Height = 21
        ReadOnly = True
        TabOrder = 7
      end
      object BtnBxConta: TBitBtn
        Left = 527
        Top = 232
        Width = 33
        Height = 25
        Caption = 'P'
        TabOrder = 8
        OnClick = BtnBxContaClick
      end
      object BitBtn3: TBitBtn
        Left = 462
        Top = 331
        Width = 51
        Height = 43
        Caption = '&Gravar'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        Layout = blGlyphTop
        NumGlyphs = 2
        TabOrder = 12
        OnClick = BitBtn3Click
      end
      object EditBxHist: TEdit
        Left = 96
        Top = 265
        Width = 89
        Height = 21
        TabOrder = 9
        OnExit = EditBxHistExit
      end
      object EditBxDsHist: TEdit
        Left = 191
        Top = 264
        Width = 330
        Height = 21
        ReadOnly = True
        TabOrder = 10
      end
      object BtnBxHist: TBitBtn
        Left = 527
        Top = 263
        Width = 33
        Height = 25
        Caption = 'P'
        TabOrder = 11
        OnClick = BtnBxHistClick
      end
      object MaskEditBxEdit: TMaskEdit
        Left = 96
        Top = 76
        Width = 89
        Height = 21
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
      object EditBxDoc: TEdit
        Left = 96
        Top = 22
        Width = 89
        Height = 21
        ReadOnly = True
        TabOrder = 16
      end
      object BitBtn1: TBitBtn
        Left = 512
        Top = 331
        Width = 51
        Height = 43
        Cancel = True
        Caption = 'Cancelar'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        Layout = blGlyphTop
        NumGlyphs = 2
        TabOrder = 13
        OnClick = BitBtn1Click
      end
      object MaskEdit3: TMaskEdit
        Left = 290
        Top = 22
        Width = 89
        Height = 21
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 17
        Text = '  /  /    '
      end
      object Edit1: TEdit
        Left = 96
        Top = 103
        Width = 89
        Height = 21
        TabOrder = 1
        OnExit = Edit1Exit
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 52
    Top = 168
    object ProcessarBaixa1: TMenuItem
      Caption = 'Processar Baixa'
      OnClick = ProcessarBaixa1Click
    end
  end
end
