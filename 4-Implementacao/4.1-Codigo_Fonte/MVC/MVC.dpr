program MVC;

uses
  Vcl.Forms,
  uMVC in 'uMVC.pas' {FormMenu},
  UBase in 'tela\UBase.pas' {FBase},
  ULogin in 'tela\ULogin.pas' {FormLogin},
  UTela in 'tela\UTela.pas' {FTela},
  UPessoasVO in 'VO\UPessoasVO.pas',
  Atributos in 'comum\Atributos.pas',
  Constantes in 'comum\Constantes.pas',
  UtelaCadastro in 'tela\UtelaCadastro.pas' {FTelaCadastro},
  Upessoa in 'tela\Upessoa.pas' {FTelaCadastroPessoa},
  UDAO in 'dao\UDAO.pas',
  ConexaoBD in 'Conexao\ConexaoBD.pas',
  Biblioteca in 'comum\Biblioteca.pas',
  UGenericVO in 'VO\UGenericVO.pas',
  UController in 'controle\UController.pas',
  UPessoasController in 'controle\UPessoasController.pas',
  UPaisVO in 'VO\UPaisVO.pas',
  UPais in 'tela\UPais.pas' {FTelaCadastroPais},
  UCnaeVO in 'VO\UCnaeVO.pas',
  UCnae in 'tela\UCnae.pas' {FTelaCadastroCnae},
  UNaturezaJuridicaVO in 'VO\UNaturezaJuridicaVO.pas',
  UNaturezaJuridica in 'tela\UNaturezaJuridica.pas' {FTelaCadastroNaturezaJuridica},
  UCondominioVO in 'VO\UCondominioVO.pas',
  UEstadoVO in 'VO\UEstadoVO.pas',
  UEstado in 'tela\UEstado.pas' {FTelaCadastroEstado},
  UEstadoController in 'controle\UEstadoController.pas',
  UCidadeVO in 'VO\UCidadeVO.pas',
  UCidadeController in 'controle\UCidadeController.pas',
  UCidade in 'tela\UCidade.pas' {TFTelaCadastroCidade},
  UCondominioController in 'controle\UCondominioController.pas',
  UCondominio in 'tela\UCondominio.pas' {FTelaCadastroCondominio},
  UCnaeController in 'controle\UCnaeController.pas',
  UNaturezaJuridicaController in 'controle\UNaturezaJuridicaController.pas',
  UPaisController in 'controle\UPaisController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMenu, FormMenu);
  Application.CreateForm(TFTelaCadastroEstado, FTelaCadastroEstado);
  Application.CreateForm(TTFTelaCadastroCidade, TFTelaCadastroCidade);
  Application.CreateForm(TFTelaCadastroCondominio, FTelaCadastroCondominio);
  Application.Run;
end.
