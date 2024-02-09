unit adAppUtils;

interface

uses System.SysUtils, Windows, System.Classes, Winapi.ShlObj, Vcl.Menus,
  Vcl.Forms;


/// <summary> Возвращает рабочий каталог приложения.</summary>
function GetSpecialPath(APath:string):string;

implementation


function GetSpecialPath(APath:string):string;
begin
  if Copy(APath, Length(APath) - 1, 1) <> '\' then
    APath := APath+ '\';
  Result:=APath;
end;
end.
