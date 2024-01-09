object TaskLog_F: TTaskLog_F
  Left = 0
  Top = 0
  Caption = 'DHL Track&Trace'
  ClientHeight = 462
  ClientWidth = 921
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object logGrid: TcxGrid
    Left = 0
    Top = 0
    Width = 921
    Height = 462
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 917
    ExplicitHeight = 461
    object logGridDBTableView1: TcxGridDBTableView
      PopupMenu = PopupMenu
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = LogDataSource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Images = cxImageList1
      OptionsView.GroupByBox = False
      object _InDate: TcxGridDBColumn
        Caption = 'Erstellt'
        DataBinding.FieldName = 'InDate'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 134
      end
      object _MessageType: TcxGridDBColumn
        Caption = 'Type'
        DataBinding.FieldName = 'MessageType'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Images = cxImageList1
        Properties.Items = <
          item
            Description = 'Information'
            ImageIndex = 0
            Value = 'i'
          end
          item
            Description = 'Ok'
            ImageIndex = 1
            Tag = 1
            Value = 'ok'
          end
          item
            Description = 'Error'
            ImageIndex = 2
            Tag = 2
            Value = 'error'
          end
          item
            Description = 'Stop'
            ImageIndex = 3
            Tag = 3
            Value = 'stop'
          end>
        HeaderAlignmentHorz = taCenter
        Width = 107
      end
      object _MessageText: TcxGridDBColumn
        Caption = 'Message'
        DataBinding.FieldName = 'MessageText'
        HeaderAlignmentHorz = taCenter
        Width = 569
      end
    end
    object logGridLevel: TcxGridLevel
      GridView = logGridDBTableView1
    end
  end
  object LogDataSource: TDataSource
    DataSet = LogQuery
    Left = 856
    Top = 80
  end
  object LogQuery: TFDQuery
    Connection = DataModule1.FDConnection
    SQL.Strings = (
      'select InDate, MessageType, MessageText '
      '  from [tTaskLog] with (nolock)   '
      ' order by ID desc ')
    Left = 856
    Top = 152
    object LogQueryInDate: TSQLTimeStampField
      FieldName = 'InDate'
      Origin = 'InDate'
      ReadOnly = True
    end
    object LogQueryMessageType: TWideStringField
      FieldName = 'MessageType'
      Origin = 'MessageType'
      ReadOnly = True
      Size = 60
    end
    object LogQueryMessageText: TWideStringField
      FieldName = 'MessageText'
      Origin = 'MessageText'
      ReadOnly = True
      Size = 500
    end
  end
  object cxImageList1: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    Left = 856
    Top = 224
    Bitmap = {
      494C010104000800040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000201001A3D21048896530BD5CF7210FBD07210FB98530BD73E22048A0201
      001B000000000000000000000000000000000000000000000000000000000000
      00000001001B0A2C0189186E02D6219602FB219602FB196F02D70A2E018B0002
      001D000000000000000000000000000000000000000000000000000000000000
      00000000021A07073A88131392D51B1BC9FB1B1BCAFB141494D708083C8A0000
      021B000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000190E
      0258C16A0FF2D77610FFD77610FFD77610FFD77610FFD77610FFD77610FFC36B
      0FF31B0F025C0000000000000000000000000000000000000000000000000413
      005A1F8D02F3229C02FF229C02FF229C02FF229C02FF229C02FF229C02FF208E
      02F40415005E0000000000000000000000000000000000000000000000000303
      18581919BCF21B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1919
      BDF303031A5C0000000000000000000000000000000000000000000000000000
      00000000000805052972121288CE1A1AC7F91A1AC9FA12128ACF05052B740000
      0009000000000000000000000000000000000000000000000000180D0257D474
      10FDD77610FFD77610FFD77610FFD77610FFD77610FFD77610FFD77610FFD776
      10FFD57510FE1B0F025C0000000000000000000000000000000004120059229A
      02FE229C02FF229C02FF229C02FF229C02FF229C02FF229C02FF229C02FF229C
      02FF229B02FE0415005E00000000000000000000000000000000030318571B1B
      CEFD1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1B
      D1FF1B1BCFFE03031A5C00000000000000000000000000000000000000000000
      021C12128DD21B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1313
      92D50000031F0000000000000000000000000000000001010018C0690FF1D776
      10FFD77610FFD77610FFD77610FFF6E1CBFFF7E4D0FFD77610FFD77610FFD776
      10FFD77610FFC36C0FF30201001B0000000000000000000100191F8C02F2229C
      02FF229C02FF229C02FF93CE83FF8CCB7AFF229C02FF229C02FF229C02FF229C
      02FF229C02FF208E02F40002001D0000000000000000000001181818BAF11B1B
      D1FF9090E8FF9090E8FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF9090E8FF9090
      E8FF1B1BD1FF1919BDF30000021B000000000000000000000000000000071212
      8CD11B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1B
      D1FF131391D5000000090000000000000000000000003A200485D77610FFD776
      10FFD77610FFD77610FFD77610FFFFFFFFFFFFFFFFFFD77610FFD77610FFD776
      10FFD77610FFD77610FF3E22048A0000000000000000092A0186229C02FF229C
      02FF229C02FF93CE83FFFFFFFFFFFEFFFEFF79C366FF229C02FF229C02FF229C
      02FF229C02FF229C02FF0A2E018B0000000000000000070738851B1BD1FF1B1B
      D1FF8B8BE7FFFFFFFFFF9090E8FF1B1BD1FF1B1BD1FF9090E8FFFFFFFFFF8B8B
      E7FF1B1BD1FF1B1BD1FF08083C8A0000000000000000000000000505276F1B1B
      D1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1B
      D1FF1B1BD1FF05052B7400000000000000000000000090500BD1D77610FFD776
      10FFD77610FFD77610FFD77610FFFFFFFFFFFFFFFFFFD77610FFD77610FFD776
      10FFD77610FFD77610FF98530BD70000000000000000176901D2229C02FF229C
      02FF93CE83FFFFFFFFFFFFFFFFFFFFFFFFFFFCFEFCFF69BC53FF229C02FF229C
      02FF229C02FF229C02FF196F02D7000000000000000012128CD11B1BD1FF1B1B
      D1FF1B1BD1FF8B8BE7FFFFFFFFFF9090E8FF9090E8FFFFFFFFFF8B8BE7FF1B1B
      D1FF1B1BD1FF1B1BD1FF141494D7000000000000000000000000111182CA1B1B
      D1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1B
      D1FF1B1BD1FF12128ACF000000000000000000000000C76D10F6D77610FFD776
      10FFD77610FFD77610FFD77610FFFFFFFFFFFFFFFFFFD77610FFD77610FFD776
      10FFD77610FFD77610FFCF7210FB0000000000000000209102F6229C02FF229C
      02FF8FCC7DFFFFFFFFFF8FCC7DFF99D18AFFFFFFFFFFF9FCF8FF5AB543FF229C
      02FF229C02FF229C02FF219602FB00000000000000001919C2F61B1BD1FF1B1B
      D1FF1B1BD1FF1B1BD1FF8B8BE7FFFFFFFFFFFFFFFFFF8B8BE7FF1B1BD1FF1B1B
      D1FF1B1BD1FF1B1BD1FF1A1ACAFB0000000000000000000000001919C1F51B1B
      D1FF000000000000000000000000000000000000000000000000000000000000
      00001B1BD1FF1A1AC9FA000000000000000000000000C76D0FF5D77610FFD776
      10FFD77610FFD77610FFD77610FFF5DEC6FFF6E1CBFFD77610FFD77610FFD776
      10FFD77610FFD77610FFCF7210FB0000000000000000209002F5229C02FF229C
      02FF229C02FF57B43EFF229C02FF239C03FFB1DCA5FFFFFFFFFFF3FAF1FF4EB0
      34FF229C02FF229C02FF219602FB00000000000000001919C1F51B1BD1FF1B1B
      D1FF1B1BD1FF1B1BD1FF9090E8FFFFFFFFFFFFFFFFFF9090E8FF1B1BD1FF1B1B
      D1FF1B1BD1FF1B1BD1FF1A1AC9FB0000000000000000000000001919BFF41B1B
      D1FF000000000000000000000000000000000000000000000000000000000000
      00001B1BD1FF1A1AC9FA0000000000000000000000008F4E0BD0D77610FFD776
      10FFD77610FFD77610FFD77610FFD77610FFD77610FFD77610FFD77610FFD776
      10FFD77610FFD77610FF96530BD50000000000000000176901D1229C02FF229C
      02FF229C02FF229C02FF229C02FF229C02FF279E08FFC5E5BCFFFFFFFFFFECF6
      E9FF42AA27FF229C02FF186E01D6000000000000000012128AD01B1BD1FF1B1B
      D1FF1B1BD1FF9090E8FFFFFFFFFF8B8BE7FF8B8BE7FFFFFFFFFF9090E8FF1B1B
      D1FF1B1BD1FF1B1BD1FF131392D5000000000000000000000000111181C91B1B
      D1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1B
      D1FF1B1BD1FF121288CE000000000000000000000000381F0483D77610FFD776
      10FFD77610FFD77610FFD77610FFF6E1CBFFF7E4D0FFD77610FFD77610FFD776
      10FFD77610FFD77610FF3C210488000000000000000009290184229C02FF229C
      02FF229C02FF229C02FF229C02FF229C02FF229C02FF2EA110FFD6EDD0FFE2F2
      DEFF3CA820FF229C02FF0A2C01890000000000000000070736831B1BD1FF1B1B
      D1FF9090E8FFFFFFFFFF8B8BE7FF1B1BD1FF1B1BD1FF8B8BE7FFFFFFFFFF9090
      E8FF1B1BD1FF1B1BD1FF07073A880000000000000000000000000505256C1B1B
      D1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1B
      D1FF1B1BD1FF0505297200000000000000000000000001000017BE690FF0D776
      10FFD77610FFD77610FFD77610FFF5DEC6FFF6E1CBFFD77610FFD77610FFD776
      10FFD77610FFC16A0FF20201001A0000000000000000000100181F8B02F1229C
      02FF229C02FF229C02FF229C02FF229C02FF229C02FF229C02FF38A61CFF3CA8
      20FF229C02FF1F8D02F30001001B0000000000000000000001171818B8F01B1B
      D1FF8B8BE7FF8B8BE7FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF8B8BE7FF8B8B
      E7FF1B1BD1FF1919BCF20000021A000000000000000000000000000000061212
      88CE1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1B
      D1FF12128DD20000000800000000000000000000000000000000160C0153D374
      10FDD77610FFD77610FFD77610FFD77610FFD77610FFD77610FFD77610FFD776
      10FFD47410FD190E02580000000000000000000000000000000003110055229A
      02FD229C02FF229C02FF229C02FF229C02FF229C02FF229C02FF229C02FF229C
      02FF229A02FE0413005A00000000000000000000000000000000020216531B1B
      CDFD1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1B
      D1FF1B1BCEFD0303185800000000000000000000000000000000000000000000
      021A121288CE1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1212
      8CD10000021C000000000000000000000000000000000000000000000000160C
      0153BE690FF0D77610FFD77610FFD77610FFD77610FFD77610FFD77610FFC069
      0FF1180D02570000000000000000000000000000000000000000000000000311
      00551F8B02F1229C02FF229C02FF229C02FF229C02FF229C02FF229C02FF1F8C
      02F2041300590000000000000000000000000000000000000000000000000202
      16531818B8F01B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1818
      BAF1030318570000000000000000000000000000000000000000000000000000
      0000000000060505256C111181C91919BFF41919C1F5111183CA0505276F0000
      0007000000000000000000000000000000000000000000000000000000000000
      000001000017381F04838F4E0BD0C76D0FF5C76E0FF692500BD23A2004850101
      0018000000000000000000000000000000000000000000000000000000000000
      00000001001809290184176901D1209002F5209102F6176901D2092A01860001
      0019000000000000000000000000000000000000000000000000000000000000
      0000000001170707368312128AD01919C1F51919C2F612128DD2070738850000
      0118000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
    DesignInfo = 14680920
    ImageInfo = <
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D22D0
          A1D0BBD0BED0B95F312220786D6C6E733D22687474703A2F2F7777772E77332E
          6F72672F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A
          2F2F7777772E77332E6F72672F313939392F786C696E6B2220783D2230707822
          20793D22307078222076696577426F783D223020302033322033322220737479
          6C653D22656E61626C652D6261636B67726F756E643A6E657720302030203332
          2033323B2220786D6C3A73706163653D227072657365727665223E262331333B
          262331303B3C7374796C6520747970653D22746578742F6373732220786D6C3A
          73706163653D227072657365727665223E2E426C75657B66696C6C3A23313137
          3744373B7D262331333B262331303B2623393B2E57686974657B66696C6C3A23
          4646464646463B7D3C2F7374796C653E0D0A3C672069643D22D0A1D0BBD0BED0
          B95F32223E0D0A09093C7061746820636C6173733D22426C75652220643D224D
          31362C3263372E372C302C31342C362E332C31342C3134732D362E332C31342D
          31342C313453322C32332E372C322C313653382E332C322C31362C327A222F3E
          0D0A09093C636972636C6520636C6173733D225768697465222063783D223136
          222063793D2231302220723D2232222F3E0D0A09093C7061746820636C617373
          3D2257686974652220643D224D31362C32344C31362C3234632D312E312C302D
          322D302E392D322D32762D3663302D312E312C302E392D322C322D326C302C30
          63312E312C302C322C302E392C322C3276364331382C32332E312C31372E312C
          32342C31362C32347A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C7376672076657273696F6E3D22312E312220786D6C6E73
          3D22687474703A2F2F7777772E77332E6F72672F323030302F7376672220786D
          6C6E733A786C696E6B3D22687474703A2F2F7777772E77332E6F72672F313939
          392F786C696E6B2220783D223070782220793D22307078222076696577426F78
          3D2230203020333220333222207374796C653D22656E61626C652D6261636B67
          726F756E643A6E6577203020302033322033323B2220786D6C3A73706163653D
          227072657365727665223E262331333B262331303B3C7374796C652074797065
          3D22746578742F6373732220786D6C3A73706163653D22707265736572766522
          3E2E57686974657B66696C6C3A234646464646463B7D262331333B262331303B
          2623393B2E477265656E7B66696C6C3A233033394332333B7D3C2F7374796C65
          3E0D0A3C672069643D22D0A1D0BBD0BED0B95F31223E0D0A09093C672069643D
          22416464223E0D0A0909093C636972636C6520636C6173733D22477265656E22
          2063783D223136222063793D2231362220723D223134222F3E0D0A09093C2F67
          3E0D0A093C2F673E0D0A3C672069643D22D0A1D0BBD0BED0B95F32223E0D0A09
          093C706F6C79676F6E20636C6173733D2257686974652220706F696E74733D22
          382C31382031342C32342032352C31322032322C392031342C31382031312C31
          35202623393B222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D22D0
          A1D0BBD0BED0B95F312220786D6C6E733D22687474703A2F2F7777772E77332E
          6F72672F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A
          2F2F7777772E77332E6F72672F313939392F786C696E6B2220783D2230707822
          20793D22307078222076696577426F783D223020302033322033322220737479
          6C653D22656E61626C652D6261636B67726F756E643A6E657720302030203332
          2033323B2220786D6C3A73706163653D227072657365727665223E262331333B
          262331303B3C7374796C6520747970653D22746578742F6373732220786D6C3A
          73706163653D227072657365727665223E2E57686974657B66696C6C3A234646
          464646463B7D262331333B262331303B2623393B2E5265647B66696C6C3A2344
          31314331433B7D3C2F7374796C653E0D0A3C672069643D22D0A1D0BBD0BED0B9
          5F32223E0D0A09093C7061746820636C6173733D225265642220643D224D3136
          2C3263372E372C302C31342C362E332C31342C313463302C372E372D362E332C
          31342D31342C313453322C32332E372C322C313643322C382E332C382E332C32
          2C31362C327A222F3E0D0A09093C7061746820636C6173733D22576869746522
          20643D224D32342C32326C2D322C326C2D362D366C2D362C366C2D322D326C36
          2D366C2D362D366C322D326C362C366C362D366C322C326C2D362C364C32342C
          32327A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
          617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
          2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
          77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
          22307078222076696577426F783D2230203020333220333222207374796C653D
          22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
          3B2220786D6C3A73706163653D227072657365727665223E262331333B262331
          303B3C7374796C6520747970653D22746578742F6373732220786D6C3A737061
          63653D227072657365727665223E2E426C75657B66696C6C3A23313137374437
          3B7D262331333B262331303B2623393B2E59656C6C6F777B66696C6C3A234646
          423131353B7D262331333B262331303B2623393B2E426C61636B7B66696C6C3A
          233732373237323B7D262331333B262331303B2623393B2E477265656E7B6669
          6C6C3A233033394332333B7D262331333B262331303B2623393B2E5265647B66
          696C6C3A234431314331433B7D262331333B262331303B2623393B2E7374307B
          6F7061636974793A302E37353B7D262331333B262331303B2623393B2E737431
          7B6F7061636974793A302E353B7D3C2F7374796C653E0D0A3C672069643D2252
          656D6F7665436972636C6564223E0D0A09093C7061746820636C6173733D2252
          65642220643D224D31362C3443392E342C342C342C392E342C342C313673352E
          342C31322C31322C31327331322D352E342C31322D31325332322E362C342C31
          362C347A204D32342C31384838762D346831365631387A222F3E0D0A093C2F67
          3E0D0A3C2F7376673E0D0A}
      end>
  end
  object PopupMenu: TPopupMenu
    OnPopup = PopupMenuPopup
    Left = 656
    Top = 40
    object Refresh1: TMenuItem
      Caption = 'Refresh'
      OnClick = Refresh1Click
    end
  end
end