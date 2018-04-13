unit Form_Splash_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, XPMan, ComCtrls, Kumpulan_Fungsi;

type
  TForm_Splash = class(TForm)
    Image_Logo: TImage;
    Label_NamaAplikasi: TLabel;
    XPManifest: TXPManifest;
    ProgressBar_Splash: TProgressBar;
    Label_Persen: TLabel;
    Label_Keterangan: TLabel;
    Timer_Splash: TTimer;
    procedure Timer_SplashTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Splash: TForm_Splash;

implementation

{$R *.dfm}

procedure TForm_Splash.Timer_SplashTimer(Sender: TObject);
begin
     if (ProgressBar_Splash.Position <= ProgressBar_Splash.Max) then
     begin
          ProgressBar_Splash.Position := ProgressBar_Splash.Position + 2;
          Label_Persen.Caption := IntToStr(ProgressBar_Splash.Position) + ' %';
          case (ProgressBar_Splash.Position) of
                2   : Label_Keterangan.Caption := 'Tugas Besar Struktur Data';
                14  : Label_Keterangan.Caption := 'Dosen : Andri Heryandi, S.T., M.T.';
                35  : Label_Keterangan.Caption := 'ABank Versi 1.0';
                40  : Label_Keterangan.Caption := 'Dibuat oleh..';
                50  : Label_Keterangan.Caption := 'Raka Suryaardi Widjaja / 10115253' ;
                64  : Label_Keterangan.Caption := 'Resa Saeful Wafa / 10115501';
                74  : Label_Keterangan.Caption := 'Endang Maulana / 10115461';
                84  : Label_Keterangan.Caption := 'Agung Budi Pangestu / 10115412';
                94  : Label_Keterangan.Caption := 'Memuat program...';
                98  : sleep(600);
                100 : begin
                           Close;
                           run_once := true;
                      end;
          end;
     end;
end;

procedure TForm_Splash.FormCreate(Sender: TObject);
begin
     Timer_Splash.Enabled := true;
     ProgressBar_Splash.Position := 0;
end;

end.
