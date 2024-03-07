unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.AppEvnts,
  System.ImageList, Vcl.ImgList, cxImageList, cxGraphics, Vcl.ComCtrls,


  Settings_U;

type
  TMainForm = class(TForm)
    ApplicationEvents: TApplicationEvents;
    TrayIcon: TTrayIcon;
    MainPage: TPageControl;
    tsLog: TTabSheet;
    tsSettings: TTabSheet;
    procedure TrayIconClick(Sender: TObject);
    procedure tsSettingsShow(Sender: TObject);
    procedure tsLogShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ApplicationEventsMinimize(Sender: TObject);
  private
    { Private declarations }

    procedure TaskLogFormLoad();
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses uUtilsRegistry, TaskLog_U;


procedure TMainForm.ApplicationEventsMinimize(Sender: TObject);
begin
 // if regLoad('OnTray')='True' then
  begin
    TrayIcon.Visible := True;
    Application.ShowMainForm:=False;
    ShowWindow(Handle, SW_HIDE);
  end;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageDlg('DHL-Invoice wird geschlossen?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes
  then
  begin
    TrayIcon.Visible := True;
    Application.ShowMainForm:=False;
    ShowWindow(Handle, SW_HIDE);
    CanClose :=False;
  end

end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  tsLog.Visible:=False;
  tsLog.Visible:=true;
end;

procedure TMainForm.TaskLogFormLoad;
begin
  // форма Лога выполнения задачи
  if Assigned(TaskLog_F) then
  begin
    TaskLog_F.BorderStyle := bsNone;
    TaskLog_F.Parent := tsLog;
    TaskLog_F.Align := alClient;
    TaskLog_F.Show;
  end;
end;

procedure TMainForm.TrayIconClick(Sender: TObject);
begin
  TrayIcon.ShowBalloonHint;
  ShowWindow(Handle,SW_RESTORE);
  SetForegroundWindow(Handle);
  TrayIcon.Visible:=False;
end;

procedure TMainForm.tsLogShow(Sender: TObject);
begin
  TaskLogFormLoad();
end;

procedure TMainForm.tsSettingsShow(Sender: TObject);
begin
  // форма настройки
  if Assigned(Settings_F) then
  begin
    Settings_F.BorderStyle := bsNone;
    Settings_F.Parent := tsSettings;
    Settings_F.Align := alClient;
    Settings_F.Show;
  end;
end;

end.
