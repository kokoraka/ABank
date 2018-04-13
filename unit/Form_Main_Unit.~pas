unit Form_Main_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, MMSystem, ExtCtrls, Form_About_Unit, Form_Splash_Unit,
  Kumpulan_Fungsi;

type
  TForm_Main = class(TForm)
    GroupBox_Menu: TGroupBox;
    GroupBox_View: TGroupBox;
    GroupBox_Meja1: TGroupBox;
    LabelMeja1: TLabel;
    TextMeja1: TEdit;
    Image_PanggilMeja1: TImage;
    GroupBox_Meja2: TGroupBox;
    TextMeja2: TEdit;
    LabelMeja2: TLabel;
    Image_PanggilMeja2: TImage;
    MainMenu_Utama: TMainMenu;
    Menu_File: TMenuItem;
    Menu_Exit: TMenuItem;
    Menu_Help: TMenuItem;
    Menu_About: TMenuItem;
    CmdShowHide: TButton;
    CmdPanggil_Meja1: TButton;
    CmdPanggil_Meja2: TButton;
    GroupBox_Antrian: TGroupBox;
    RadioButton_Bisnis: TRadioButton;
    RadioButton_Personal: TRadioButton;
    CmdTambahAntrian: TButton;
    GroupBox_Pengaturan: TGroupBox;
    LabelSisaAntrian: TLabel;
    TextSisaAntrian: TEdit;
    CmdSimpanBahasa: TButton;
    ComboBoxBahasa: TComboBox;
    LabelBahasa: TLabel;
    Menu_Tools: TMenuItem;
    Menu_Reset: TMenuItem;
    procedure Menu_AboutClick(Sender: TObject);
    procedure Image_PanggilMeja1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Menu_ExitClick(Sender: TObject);
    procedure Image_PanggilMeja2Click(Sender: TObject);
    procedure CmdShowHideClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmdTambahAntrianClick(Sender: TObject);
    procedure CmdPanggil_Meja1Click(Sender: TObject);
    procedure CmdPanggil_Meja2Click(Sender: TObject);
    procedure CmdSimpanBahasaClick(Sender: TObject);
    procedure Menu_ResetClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    bilang_teks:string;
  end;

var
  Form_Main: TForm_Main;

implementation

{$R *.dfm}

procedure TForm_Main.Menu_AboutClick(Sender: TObject);
begin
     Form_About.Show;
end;

procedure TForm_Main.Image_PanggilMeja1Click(Sender: TObject);

begin
     if (Kumpulan_Fungsi.heap_kosong(posisi)) and (TextMeja1.Text = 'B-0000') then
     begin
          Application.MessageBox('Silahkan tambahkan antrian terlebih dahulu.','Antrian Kosong', MB_OK + MB_ICONWARNING);
     end
     else
     begin
          Kumpulan_Fungsi.panggil_suara(bilang_saja(TextMeja1.Text, bahasa), '1', bahasa);
     end;
end;

procedure TForm_Main.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if (Application.MessageBox('Keluar dari aplikasi Antrian Bank?','Keluar Aplikasi', MB_YESNO or MB_ICONQUESTION) = ID_NO) then
     begin
          CanClose := false;
     end;
end;

procedure TForm_Main.Menu_ExitClick(Sender: TObject);
begin
     Form_Main.Close;
end;

procedure TForm_Main.Image_PanggilMeja2Click(Sender: TObject);
begin
     if (Kumpulan_Fungsi.heap_kosong(posisi)) and (TextMeja2.Text = 'P-0000') then
     begin
          Application.MessageBox('Silahkan tambahkan antrian terlebih dahulu.','Antrian Kosong', MB_OK + MB_ICONWARNING);
     end
     else
     begin
          Kumpulan_Fungsi.panggil_suara(bilang_saja(TextMeja2.Text, bahasa), '2', bahasa);
     end;
end;

procedure TForm_Main.CmdShowHideClick(Sender: TObject);
begin
     if (CmdShowHide.Caption = 'Show') then
     begin
          CmdShowHide.Caption := 'Hide';
          Form_Main.Height := 437;
     end
     else if (CmdShowHide.Caption = 'Hide') then
     begin
          CmdShowHide.Caption := 'Show';
          Form_Main.Height := 290;
     end
     else
     begin
          //Injection found
     end;
end;

procedure TForm_Main.FormCreate(Sender: TObject);

begin
     if (run_once = false) then
     begin
          Form_Main.Hide;
          with TForm_Splash.Create(nil) do
          begin
               try
                  ShowModal;
               finally
                  Free;
               end;
          end;
     end;
     Kumpulan_Fungsi.inisialisasi_heap(root, posisi, no);
     RadioButton_Bisnis.Checked := true;
     ComboBoxBahasa.ItemIndex := 0;
end;

procedure TForm_Main.CmdTambahAntrianClick(Sender: TObject);

begin
     if (Kumpulan_Fungsi.heap_penuh(posisi)) then
     begin
          Application.MessageBox(PChar('Antrian sudah mencapai batas maksimum ' + IntToStr(posisi) + ' antrian.'),'Antrian Penuh', MB_OK + MB_ICONASTERISK);
          if (Application.MessageBox('Reset antrian ke posisi awal?','Reset Antrian', MB_YESNO or MB_ICONQUESTION) = ID_YES) then
          begin
               Kumpulan_Fungsi.reset_antrian(antrian, posisi, root, no);
               TextMeja1.Text := 'B-0000';
               TextMeja2.Text := 'P-0000';
               TextSisaAntrian.Text := IntToStr(posisi);
               Application.MessageBox('Berhasil me-reset data antrian.', 'Berhasil Reset Antrian', MB_OK + MB_ICONASTERISK);
          end;
     end
     else
     begin
          if (Application.MessageBox('Tambah data antrian?', 'Tambah Data Antrian', MB_YESNO + MB_ICONQUESTION) = ID_YES) then
          begin
               if (RadioButton_Bisnis.Checked) then
               begin
                    Kumpulan_Fungsi.tambah_antrian(antrian, posisi, no, 'B');
               end
               else if (RadioButton_Personal.Checked) then
               begin
                    Kumpulan_Fungsi.tambah_antrian(antrian, posisi, no, 'P');
               end;
               TextSisaAntrian.Text := IntToStr(posisi);
               Application.MessageBox('Berhasil menambah data antrian', 'Berhasil Menambah Data Antrian', MB_OK + MB_ICONASTERISK);
          end;
     end;
end;

procedure TForm_Main.CmdPanggil_Meja1Click(Sender: TObject);
begin
     if (Kumpulan_Fungsi.heap_kosong(posisi)) then
     begin
          Application.MessageBox('Silahkan tambahkan antrian terlebih dahulu.','Antrian Kosong', MB_OK + MB_ICONWARNING);
     end
     else
     begin
          if (Application.MessageBox('Panggil antrian di Meja 1?', 'Panggil Antrian', MB_YESNO + MB_ICONQUESTION) = ID_YES) then
          begin
               TextMeja1.Text := hapus_antrian(root, antrian, posisi);
               TextSisaAntrian.Text := IntToStr(posisi);
               Kumpulan_Fungsi.panggil_suara(bilang_saja(TextMeja1.Text, bahasa), '1', bahasa);
          end;
     end;
end;

procedure TForm_Main.CmdPanggil_Meja2Click(Sender: TObject);
begin
     if (Kumpulan_Fungsi.heap_kosong(posisi)) then
     begin
          Application.MessageBox('Silahkan tambahkan antrian terlebih dahulu.','Antrian Kosong', MB_OK + MB_ICONWARNING);
     end
     else
     begin
          if (Application.MessageBox('Panggil antrian di Meja 2?', 'Panggil Antrian', MB_YESNO + MB_ICONQUESTION) = ID_YES) then
          begin
               TextMeja2.Text := hapus_antrian(root, antrian, posisi);
               TextSisaAntrian.Text := IntToStr(posisi);
               Kumpulan_Fungsi.panggil_suara(bilang_saja(TextMeja2.Text, bahasa), '2', bahasa);
          end;
     end;
end;

procedure TForm_Main.CmdSimpanBahasaClick(Sender: TObject);

begin
     if (Application.MessageBox('Ubah suara panggilan?','Ubah Bahasa', MB_YESNO or MB_ICONQUESTION) = ID_YES) then
     begin
          Kumpulan_Fungsi.pilih_bahasa(ComboBoxBahasa.Items[ComboBoxBahasa.ItemIndex]);
          Application.MessageBox(PChar('Berhasil mengubah suara sesuai dengan bahasa ' + ComboBoxBahasa.Items[ComboBoxBahasa.ItemIndex]), 'Berhasil Mengubah Bahasa', MB_OK + MB_ICONASTERISK);
     end;
end;

procedure TForm_Main.Menu_ResetClick(Sender: TObject);

begin
     if (Kumpulan_Fungsi.heap_kosong(posisi)) then
     begin
          Application.MessageBox('Data antrian kosong, tidak ada yang di-reset.', 'Data Antrian Kosong', MB_OK + MB_ICONEXCLAMATION);
     end
     else
     begin
     if (Application.MessageBox('Reset data antrian?', 'Reset Data Antrian', MB_YESNO + MB_ICONQUESTION) = ID_YES) then
     begin
          Kumpulan_Fungsi.reset_antrian(antrian, posisi, root, no);
          TextMeja1.Text := 'B-0000';
          TextMeja2.Text := 'P-0000';
          TextSisaAntrian.Text := IntToStr(posisi);
          Application.MessageBox('Berhasil me-reset data antrian.', 'Berhasil Reset Antrian', MB_OK + MB_ICONASTERISK);
     end;
     end;
end;

end.

