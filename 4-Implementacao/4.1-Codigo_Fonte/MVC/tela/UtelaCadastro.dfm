inherited FTelaCadastro: TFTelaCadastro
  Caption = 'FTelaCadastro'
  ClientHeight = 439
  ClientWidth = 783
  Position = poDesktopCenter
  ExplicitWidth = 799
  ExplicitHeight = 478
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 783
    Height = 414
    TabOrder = 1
    OnChange = PageControlChange
    ExplicitWidth = 783
    ExplicitHeight = 414
    inherited Consulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 775
      ExplicitHeight = 386
      inherited Grid: TDBGrid
        Left = 0
        Top = 56
        Width = 775
        Height = 330
        Align = alClient
      end
      inherited Panel2: TPanel
        Width = 775
        ExplicitWidth = 775
        object BitBtnIncluirC: TBitBtn [2]
          Left = 6
          Top = 6
          Width = 51
          Height = 43
          Caption = 'Incluir'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
            0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
            00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
            00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
            F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
            F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
            FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
            0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
            00337777FFFF77FF7733EEEE0000000003337777777777777333}
          Layout = blGlyphTop
          NumGlyphs = 2
          TabOrder = 2
          OnClick = BitBtnNovoClick
        end
        inherited BotaoConsultar: TBitBtn
          TabOrder = 3
        end
      end
    end
    object DadosCadastrais: TTabSheet
      Caption = 'Dados Cadastrais'
      ImageIndex = 1
      object PanelBotoes: TPanel
        Left = 0
        Top = 0
        Width = 775
        Height = 57
        Align = alTop
        TabOrder = 0
        object BitBtnNovo: TBitBtn
          Left = 6
          Top = 6
          Width = 51
          Height = 43
          Caption = 'Incluir'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
            0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
            00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
            00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
            F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
            F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
            FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
            0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
            00337777FFFF77FF7733EEEE0000000003337777777777777333}
          Layout = blGlyphTop
          NumGlyphs = 2
          TabOrder = 1
          OnClick = BitBtnNovoClick
        end
        object BitBtnAltera: TBitBtn
          Left = 56
          Top = 6
          Width = 51
          Height = 43
          Caption = 'Alterar'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
            000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
            00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
            F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
            0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
            FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
            FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
            0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
            00333377737FFFFF773333303300000003333337337777777333}
          Layout = blGlyphTop
          NumGlyphs = 2
          TabOrder = 2
          OnClick = BitBtnAlteraClick
        end
        object BitBtnGrava: TBitBtn
          Left = 106
          Top = 6
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
          TabOrder = 0
          OnClick = BitBtnGravaClick
        end
        object BitBtnExclui: TBitBtn
          Left = 156
          Top = 6
          Width = 51
          Height = 43
          Caption = 'Excluir'
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333FFFFF333333000033333388888833333333333F888888FFF333
            000033338811111188333333338833FFF388FF33000033381119999111833333
            38F338888F338FF30000339119933331111833338F388333383338F300003391
            13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
            33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
            33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
            000039183811193333918338F8F833F83333838F000039118111933339118338
            F3833F83333833830000339111193333391833338F33F8333FF838F300003391
            11833338111833338F338FFFF883F83300003339111888811183333338FF3888
            83FF83330000333399111111993333333388FFFFFF8833330000333333999999
            3333333333338888883333330000333333333333333333333333333333333333
            0000}
          Layout = blGlyphTop
          NumGlyphs = 2
          TabOrder = 3
          OnClick = BitBtnExcluiClick
        end
        object BitBtnCancela: TBitBtn
          Left = 206
          Top = 6
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
          TabOrder = 4
          OnClick = BitBtnCancelaClick
        end
      end
      object PageControlEdit: TPageControl
        Left = 0
        Top = 57
        Width = 775
        Height = 329
        ActivePage = DadosPrincipais
        Align = alClient
        TabOrder = 1
        object DadosPrincipais: TTabSheet
          Caption = 'Dados Principais'
          object PanelEdits: TPanel
            Left = 0
            Top = 0
            Width = 767
            Height = 301
            Align = alClient
            ParentBackground = False
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 414
    Width = 783
    ExplicitTop = 414
    ExplicitWidth = 783
  end
end
