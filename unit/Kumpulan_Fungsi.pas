{
ABank Versi 1.0

Dibuat untuk memenuhi tugas mata kuliah Struktur Data.

Dibuat oleh :
- Raka Suryaardi Widjaja / 10115253
- Resa Saeful Wafa / 10115501
- Endang Maulana / 10115461
- Agung Budi Pangestu / 10115412

Kelas : Struktur Data - 5
Dosen : Andri Heryandi, S.T., M.T.
}

unit Kumpulan_Fungsi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Controls, Forms,
  Dialogs, StdCtrls, Menus, MMSystem;

const
   max_antrian = 9999;

type
   larik = array[0..max_antrian] of string;

var
   nomor_bilang, no, posisi, root:integer;
   bilang_teks, input_antrian, output_antrian, bahasa, Combo_Box:string;
   run_once:boolean;
   antrian:larik;

   function bilang_saja(bilang_teks, bahasa:string):string;
   function app_path():string;
   procedure split_string(input_string:string; const pemisah:Char; const output_string:Tstrings);
   procedure panggil_suara(bilang_saja:string; meja:char; bahasa:string);
   procedure inisialisasi_heap(var root, posisi, no:integer);
   procedure tambah_antrian(var antrian:larik; var posisi, no:integer; input_antrian:string);
   function hapus_antrian(root:integer; var antrian:larik; var posisi:integer):string;
   function heap_kosong(posisi:integer):boolean;
   function heap_penuh(posisi:integer):boolean;
   procedure pilih_bahasa(Combo_Box:string);
   procedure reset_antrian(var antrian:larik; var posisi, root, no:integer);

implementation

  function app_path():string;

  begin
       app_path := PChar(ExtractFilePath(ParamStr(0)));
  end;

  function terbilang_id(nomor_bilang:integer):string;
      function bilang_id(nomor_bilang:integer):string;
      begin
           case (nomor_bilang) of
               0  : bilang_id := '';
               1  : bilang_id := 'satu';
               2  : bilang_id := 'dua';
               3  : bilang_id := 'tiga';
               4  : bilang_id := 'empat';
               5  : bilang_id := 'lima';
               6  : bilang_id := 'enam';
               7  : bilang_id := 'tujuh';
               8  : bilang_id := 'delapan';
               9  : bilang_id := 'sembilan';
               10 : bilang_id := 'sepuluh';
               11 : bilang_id := 'sebelas';
           end;
      end;
  begin
       if (nomor_bilang < 12) then
       begin
            terbilang_id := ' ' + bilang_id(nomor_bilang)
       end
       else if (nomor_bilang < 20) then
       begin
            terbilang_id := terbilang_id(nomor_bilang - 10) + ' belas'
       end
       else if (nomor_bilang < 100) then
       begin
            terbilang_id := terbilang_id(nomor_bilang div 10) + ' puluh' + terbilang_id(nomor_bilang mod 10)
       end
       else if (nomor_bilang < 200) then
       begin
            terbilang_id := ' seratus' + terbilang_id(nomor_bilang - 100)
       end
       else if (nomor_bilang < 1000) then
       begin
            terbilang_id := terbilang_id(nomor_bilang div 100) + ' ratus' + terbilang_id(nomor_bilang mod 100)
       end
       else if (nomor_bilang < 2000) then
       begin
            terbilang_id := ' seribu' + terbilang_id(nomor_bilang - 1000)
       end
       else if (nomor_bilang < 1000000) then
       begin
            terbilang_id := terbilang_id(nomor_bilang div 1000) + ' ribu' + terbilang_id(nomor_bilang mod 1000)
       end;
  end;

  function bilang_en(nomor_bilang:integer):string;

  begin
       case (nomor_bilang) of
            0  : bilang_en := '';
            1  : bilang_en := 'one';
            2  : bilang_en := 'two';
            3  : bilang_en := 'three';
            4  : bilang_en := 'four';
            5  : bilang_en := 'five';
            6  : bilang_en := 'six';
            7  : bilang_en := 'seven';
            8  : bilang_en := 'eight';
            9  : bilang_en := 'nine';
            10 : bilang_en := 'ten';
            11 : bilang_en := 'eleven';
            12 : bilang_en := 'twelve';
            13 : bilang_en := 'thirteen';
            20 : bilang_en := 'twenty';
            30 : bilang_en := 'thirty';
            40 : bilang_en := 'fourty';
            50 : bilang_en := 'fivety';
            60 : bilang_en := 'sixty';
            70 : bilang_en := 'seventy';
            80 : bilang_en := 'eighty';
            90 : bilang_en := 'ninety';
       end;
  end;

  function terbilang_en(nomor_bilang:integer):string;

  begin
        if (nomor_bilang > 0) and (nomor_bilang < 14) then
        begin
             terbilang_en := bilang_en(nomor_bilang);
        end
        else if (nomor_bilang > 13) and (nomor_bilang < 20) then
        begin
             terbilang_en :=  bilang_en(nomor_bilang mod 10) + ' teen';
        end
        else if (nomor_bilang > 19) and (nomor_bilang < 100) then
        begin
             terbilang_en := bilang_en(nomor_bilang - nomor_bilang mod 10) + ' ' + bilang_en(nomor_bilang mod 10);
        end
        else if (nomor_bilang > 99) and (nomor_bilang < 114) then
        begin
             terbilang_en := bilang_en(nomor_bilang div 100) + ' hundred ' + bilang_en(nomor_bilang mod 100);
        end
        else if (nomor_bilang > 113) and (nomor_bilang < 120) then
        begin
             terbilang_en := bilang_en(nomor_bilang div 100) + ' hundred ' + bilang_en(nomor_bilang mod 10) + ' teen';
        end
        else if (nomor_bilang > 119) and (nomor_bilang < 1000) then
        begin
             terbilang_en := bilang_en(nomor_bilang div 100) + ' hundred ' +  terbilang_en(nomor_bilang mod 100);
        end
        else if (nomor_bilang = 1000) then
        begin
             terbilang_en := bilang_en(nomor_bilang div 1000) + ' thousand ';
        end
        else if (nomor_bilang > 1000) and (nomor_bilang < 1014) then
        begin
             terbilang_en := bilang_en(nomor_bilang div 1000) + ' thousand ' + bilang_en(nomor_bilang mod 1000);
        end
        else if (nomor_bilang > 1013) and (nomor_bilang < 10000) then
        begin
             terbilang_en := bilang_en(nomor_bilang div 1000) + ' thousand ' + terbilang_en(nomor_bilang mod 1000);
        end;
  end;

  function terbilang_jp(nomor_bilang:integer):string;
      function bilang_jp(nomor_bilang:integer):string;
      begin
           case (nomor_bilang) of
               0  : bilang_jp := '';
               1  : bilang_jp := 'satu';
               2  : bilang_jp := 'dua';
               3  : bilang_jp := 'tiga';
               4  : bilang_jp := 'empat';
               5  : bilang_jp := 'lima';
               6  : bilang_jp := 'enam';
               7  : bilang_jp := 'tujuh';
               8  : bilang_jp := 'delapan';
               9  : bilang_jp := 'sembilan';
               10 : bilang_jp := 'sepuluh';
           end;
      end;
  begin
       if (nomor_bilang < 11) then
       begin
            terbilang_jp := ' ' + bilang_jp(nomor_bilang)
       end
       else if (nomor_bilang < 20) then
       begin
            terbilang_jp := 'puluh ' + terbilang_jp(nomor_bilang - 10)
       end
       else if (nomor_bilang < 100) then
       begin
            terbilang_jp := terbilang_jp(nomor_bilang div 10) + ' puluh ' + terbilang_jp(nomor_bilang mod 10)
       end
       else if (nomor_bilang < 1000) then
       begin
            terbilang_jp := terbilang_jp(nomor_bilang div 100) + ' ratus ' + terbilang_jp(nomor_bilang mod 100)
       end
       else if (nomor_bilang < 1000000) then
       begin
            if (nomor_bilang div 1000 = 1) then
            begin
                 terbilang_jp := 'ribu ' + terbilang_jp(nomor_bilang mod 1000)
            end
            else
            begin
                 terbilang_jp := terbilang_jp(nomor_bilang div 1000) + ' ribu ' + terbilang_jp(nomor_bilang mod 1000)
            end;
       end;
  end;

    function terbilang_ch(nomor_bilang:integer):string;
      function bilang_ch(nomor_bilang:integer):string;
      begin
           case (nomor_bilang) of
               0  : bilang_ch := '';
               1  : bilang_ch := 'satu';
               2  : bilang_ch := 'dua';
               3  : bilang_ch := 'tiga';
               4  : bilang_ch := 'empat';
               5  : bilang_ch := 'lima';
               6  : bilang_ch := 'enam';
               7  : bilang_ch := 'tujuh';
               8  : bilang_ch := 'delapan';
               9  : bilang_ch := 'sembilan';
               10 : bilang_ch := 'sepuluh';
           end;
      end;
  begin
       if (nomor_bilang < 11) then
       begin
            terbilang_ch := ' ' + bilang_ch(nomor_bilang)
       end
       else if (nomor_bilang < 20) then
       begin
            terbilang_ch := 'puluh ' + terbilang_ch(nomor_bilang - 10)
       end
       else if (nomor_bilang < 100) then
       begin
            terbilang_ch := terbilang_ch(nomor_bilang div 10) + ' puluh ' + terbilang_ch(nomor_bilang mod 10)
       end
       else if (nomor_bilang < 200) then
       begin
            terbilang_ch := 'seratus ' + terbilang_ch(nomor_bilang - 100)
       end
       else if (nomor_bilang < 300) then
       begin
            terbilang_ch := 'duaratus ' + terbilang_ch(nomor_bilang - 200)
       end
       else if (nomor_bilang < 1000) then
       begin
            terbilang_ch := terbilang_ch(nomor_bilang div 100) + ' ratus ' + terbilang_ch(nomor_bilang mod 100)
       end
       else if (nomor_bilang < 2000) then
       begin
            terbilang_ch := 'seribu ' + terbilang_ch(nomor_bilang - 1000)
       end
       else if (nomor_bilang < 3000) then
       begin
            terbilang_ch := 'duaribu ' + terbilang_ch(nomor_bilang - 2000)
       end
       else if (nomor_bilang < 1000000) then
       begin
            terbilang_ch := terbilang_ch(nomor_bilang div 1000) + ' ribu ' + terbilang_ch(nomor_bilang mod 1000)
       end;
  end;

  function bilang_saja(bilang_teks, bahasa:string):string;

  var
      kode_eror:integer;
      
  begin
       delete(bilang_teks, 1, 2);
       val(bilang_teks, nomor_bilang, kode_eror);
       if (kode_eror = 0) and (nomor_bilang <= 9999) then
       begin
            if (bahasa = 'indonesian') then
                bilang_saja := terbilang_id(nomor_bilang)
            else if (bahasa = 'english') then
                bilang_saja := terbilang_en(nomor_bilang)
            else if (bahasa = 'japanese') then
                bilang_saja := terbilang_jp(nomor_bilang)
            else if (bahasa = 'chinese') then
                bilang_saja := terbilang_ch(nomor_bilang)
            else
                bilang_saja := terbilang_id(nomor_bilang)
       end;
  end;

  procedure pilih_bahasa(Combo_Box:string);

  begin
       if (Combo_Box = 'Indonesia') then
       begin
            bahasa := 'indonesian';
       end
       else if (Combo_Box = 'Inggris') then
       begin
            bahasa := 'english';
       end
       else if (Combo_Box = 'Jepang') then
       begin
            bahasa := 'japanese';
       end
       else if (Combo_Box = 'Mandarin') then
       begin
            bahasa := 'chinese';
       end
       else
       begin
            bahasa := 'indonesian';
       end;
  end;

  procedure split_string(input_string:string; const pemisah:Char; const output_string:Tstrings);

  begin
       assert(assigned(output_string));
       output_string.Clear;
       output_string.Delimiter := pemisah;
       output_string.DelimitedText := input_string;
  end;

  procedure panggil_suara(bilang_saja:string; meja:char; bahasa:string);

  var
     list:TStringList;
     i:integer;

  begin
       list := TStringList.Create;
       try
          split_string(bilang_saja,' ',list);
          if (list.Count > 0) then
          begin
               sndPlaySound(PChar(Kumpulan_Fungsi.app_path() + ('\sounds\bell-in.wav')), snd_Async and snd_NoDefault);
               sndPlaySound(PChar(Kumpulan_Fungsi.app_path() + ('\sounds\' + bahasa + '\nomor-antrian.wav')), snd_Async and snd_NoDefault);

               for i:= 0 to list.Count - 1 do
               begin
                    sndPlaySound(PChar(Kumpulan_Fungsi.app_path() + ('\sounds\'+ bahasa + '\' + list[i] + '.wav')), snd_Async and snd_NoDefault);
               end;
               
               sleep(300);
               sndPlaySound(PChar(app_path() + ('\sounds\' + bahasa + '\di-meja.wav')), snd_Async and snd_NoDefault);
               case (meja) of
                    '1' : begin
                               if (bahasa = 'english') then
                               begin
                                    sndPlaySound(PChar(app_path() + ('\sounds\' + bahasa + '\one.wav')), snd_Async and snd_NoDefault);
                               end
                               else
                               begin
                                    sndPlaySound(PChar(app_path() + ('\sounds\' + bahasa + '\satu.wav')), snd_Async and snd_NoDefault);
                               end;
                          end;
                    '2' : begin
                               if (bahasa = 'english') then
                               begin
                                    sndPlaySound(PChar(app_path() + ('\sounds\' + bahasa + '\two.wav')), snd_Async and snd_NoDefault);
                               end
                               else
                               begin
                                    sndPlaySound(PChar(app_path() + ('\sounds\' + bahasa + '\dua.wav')), snd_Async and snd_NoDefault);
                               end;
                          end;
               end;
               sndPlaySound(PChar(Kumpulan_Fungsi.app_path() + ('\sounds\bell-out.wav')), snd_Async and snd_NoDefault);
          end;
       finally
          list.Free;
       end;
  end;

  //* Engine *//

  procedure inisialisasi_heap(var root, posisi, no:integer);

  begin
       root := 1;
       posisi := 0;
       no := 0;
  end;

  function parent(antrian:larik; posisi:integer):integer;

  begin
       parent := posisi div 2;
  end;
  
  function left_child(antrian:larik; posisi:integer):integer;

  begin
       left_child := 2 * posisi;
  end;

  function right_child(antrian:larik; posisi:integer):integer;

  begin
       right_child := (2 * posisi) + 1
  end;

  function heap_kosong(posisi:integer):boolean;

  begin
       heap_kosong := posisi = 0;
  end;

  function heap_penuh(posisi:integer):boolean;

  begin
       heap_penuh := posisi = max_antrian;
  end;

  procedure swap_data(var a, b:string);

  var
     tmp:string;

  begin
       tmp := a;
       a := b;
       b := tmp;
  end;

  procedure shift_down(var antrian:larik; start, akhir: integer);

  var
     root, child:integer;

  begin
        root := start;
        while (right_child(antrian, root) <= akhir) do
        begin
            child := right_child(antrian, root);
            if (child < akhir) and (antrian[child] < antrian[child + 1]) then
            begin
                child := child + 1;
            end;
            if (antrian[root] < antrian[child]) then
            begin
                 swap_data(antrian[root], antrian[child]);
                 root := child;
            end
            else
            begin
                 break;
            end;
        end;
  end;

  procedure heapify(var antrian:larik; posisi:integer);

  var
     start:integer;

  begin
        start := (posisi - 1) div 2;
        while (start >= 0 ) do
        begin
             shift_down(antrian, start, posisi - 1);
             start := start - 1;
        end;
  end;

  procedure heap_sort(var antrian:larik; posisi:integer);

  var
     akhir:integer;

  begin
        heapify(antrian, posisi);
        akhir := posisi - 1;

        while (akhir > 0) do
        begin
             swap_data(antrian[akhir], antrian[0]);
             akhir := akhir - 1;
             shift_down(antrian, 0, akhir);
        end;
  end;

  procedure reset_antrian(var antrian:larik; var posisi, root, no:integer);

  var
     i:integer;

  begin
       for i := root to max_antrian do
       begin
            antrian[i] := '';
       end;
       posisi := 0;
       no := 0;
       root := 1;
  end;

  procedure tambah_antrian(var antrian:larik; var posisi, no:integer; input_antrian:string);

  begin
       posisi := posisi + 1;
       no := no + 1;

       if (no < 10) then
       begin
            antrian[posisi] := input_antrian + '-' + '000' + IntToStr(no);
       end
       else if (no > 9) and (no < 99) then
       begin
            antrian[posisi] := input_antrian + '-' + '00' + IntToStr(no);
       end
       else if (no > 99) and (no < 999) then
       begin
            antrian[posisi] := input_antrian + '-' + '0' + IntToStr(no);
       end
       else if (no > 999) and (no < 9999) then
       begin
            antrian[posisi] := input_antrian + '-' + IntToStr(no);
       end;

       while (antrian[posisi] <= antrian[parent(antrian, posisi)]) and (parent(antrian, posisi) <> 0) do
       begin
            swap_data(antrian[posisi], antrian[parent(antrian, posisi)]);
       end;
       heap_sort(antrian, posisi);
  end;

  function hapus_antrian(root:integer; var antrian:larik; var posisi:integer):string;

  begin
       hapus_antrian := antrian[root];
       antrian[root] := antrian[posisi];
       posisi := posisi - 1;

       if (posisi > root) then
       begin
            while (antrian[root] > antrian[left_child(antrian, root)]) or (antrian[root] > antrian[right_child(antrian, root)]) do
            begin
                 if (antrian[left_child(antrian, root)] > antrian[right_child(antrian, root)]) then
                 begin
                      swap_data(antrian[root], antrian[right_child(antrian, root)]);
                 end
                 else
                 begin
                      swap_data(antrian[root], antrian[left_child(antrian, root)]);
                 end;
            end;
            heap_sort(antrian, posisi);
       end;
  end;

end.
