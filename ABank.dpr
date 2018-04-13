program ABank;

uses
  Forms,
  Form_Main_Unit in 'Unit\Form_Main_Unit.pas' {Form_Main},
  Form_About_Unit in 'unit\Form_About_Unit.pas' {Form_About},
  Kumpulan_Fungsi in 'unit\Kumpulan_Fungsi.pas',
  Form_Splash_Unit in 'unit\Form_Splash_Unit.pas' {Form_Splash};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ABank';
  Application.CreateForm(TForm_Main, Form_Main);
  Application.CreateForm(TForm_Splash, Form_Splash);
  Application.CreateForm(TForm_About, Form_About);
  run_once := false;
  bahasa := 'indonesian';
  Application.Run;
end.
