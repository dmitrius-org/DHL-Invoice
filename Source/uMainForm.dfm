object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'DHL-Invoice'
  ClientHeight = 594
  ClientWidth = 965
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  TextHeight = 15
  object MainPage: TPageControl
    Left = 0
    Top = 0
    Width = 965
    Height = 594
    ActivePage = tsLog
    Align = alClient
    TabOrder = 0
    object tsLog: TTabSheet
      Caption = 'DHL-Invoice'
      ImageIndex = 1
      OnShow = tsLogShow
    end
    object tsSettings: TTabSheet
      Caption = 'Settings'
      OnShow = tsSettingsShow
    end
  end
  object ApplicationEvents: TApplicationEvents
    OnMinimize = ApplicationEventsMinimize
    Left = 44
    Top = 356
  end
  object TrayIcon: TTrayIcon
    OnClick = TrayIconClick
    Left = 41
    Top = 424
  end
end
