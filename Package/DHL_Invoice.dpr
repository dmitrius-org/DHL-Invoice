program DHL_Invoice;



{$R *.dres}

uses
  Vcl.Forms,
  uDataModule in '..\Source\uDataModule.pas' {DataModule1: TDataModule},
  uConnectionParam in '..\Source\uConnectionParam.pas',
  uUtilsRegistry in '..\Source\uUtilsRegistry.pas',
  MTLogger in '..\Source\logger\MTLogger.pas',
  MTUtils in '..\Source\logger\MTUtils.pas',
  TimeIntervals in '..\Source\logger\TimeIntervals.pas',
  uSqlList in '..\Source\dbStructure\uSqlList.pas',
  uUtilsTask in '..\Source\uUtilsTask.pas',
  uMainForm in '..\Source\uMainForm.pas' {MainForm},
  Settings_U in '..\Source\Settings_U.pas' {Settings_F},
  TaskLog_U in '..\Source\TaskLog_U.pas' {TaskLog_F},
  adAppUtils in '..\Source\adAppUtils.pas',
  tgputtylib in '..\Source\TGPuttyLib\tgputtylib.pas',
  tgputtysftp in '..\Source\TGPuttyLib\tgputtysftp.pas',
  csvparser in '..\Source\csvparser.pas';

{$R *.res}

begin
 // ReportMemoryLeaksOnShutdown:=True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSettings_F, Settings_F);
  Application.CreateForm(TTaskLog_F, TaskLog_F);
  Application.Run;
end.
