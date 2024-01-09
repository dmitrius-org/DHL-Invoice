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
    Images = cxImageList
    TabOrder = 0
    ExplicitWidth = 861
    ExplicitHeight = 593
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
  object cxImageList: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    Left = 148
    Top = 355
    Bitmap = {
      494C010102000800040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000001000014D77610FFD77610FF01000017000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000140B
      014F03020022000000000E070142D77610FFD77610FF0D070140000000000603
      002E180D02560000000000000000000000000000000000000000717171FF1C1C
      1C7F1C1C1C7F1C1C1C7F1C1C1C7F1C1C1C7F1C1C1C7F1C1C1C7F1C1C1C7F1C1C
      1C7F1C1C1C7F1C1C1C7F1C1C1C7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000150C0151D174
      10FCC0690FF1301A037984480AC8D77610FFD77610FF8D4E0BCF3D220488C96E
      0FF7D37410FD150C0151000000000000000000000000717171FF717171FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000503002AC76D
      0FF5D77610FFD77610FFD77610FFD77610FFD77610FFD77610FFD77610FFD776
      10FFBD680EEF0301001F00000000000000000000000000000000717171FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000381F
      0483D77610FFD77610FFD77610FFD77610FFD77610FFD77610FFD77610FFD776
      10FF2F1A037800000000000000000000000000000000717171FF717171FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010000170D07003F884B
      0BCBD77610FFD77610FF653808AF0100001501000013623507ACD77610FFD776
      10FF874A0BCA100901470201001A000000000000000000000000717171FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D77610FFD77610FFD776
      10FFD77610FFD77610FF01010018000000000000000001000013D77610FFD776
      10FFD77610FFD77610FFD77610FF0000000000000000717171FF717171FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D77610FFD77610FFD776
      10FFD77610FFD77610FF0201001A000000000000000001000015D77610FFD776
      10FFD77610FFD77610FFD77610FF000000000000000000000000717171FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010000140E0701428A4C
      0BCDD77610FFD77610FF6A3A08B30201001A02010019663808B0D77610FFD776
      10FF8A4C0BCD0B06003A010000120000000000000000717171FF717171FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000361E
      0480D77610FFD77610FFD77610FFD77610FFD77610FFD77610FFD77610FFD776
      10FF3E2204890000000000000000000000000000000000000000717171FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000004020026C36C
      0FF3D77610FFD77610FFD77610FFD77610FFD77610FFD77610FFD77610FFD776
      10FFCB7010F807040031000000000000000000000000717171FF717171FF0000
      000000000000C76E0FF6784209BF170D015584480AC881470AC64023048C0000
      00096F3D08B783480AC796530BD5000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000180D0257D474
      10FDC76D0FF5381F048385490AC9D77610FFD77610FF83480AC72A170372BA65
      0EEDD17410FC160C015300000000000000000000000000000000717171FF0000
      0000000000009D560CDA00000000321C037C361E04810000000084480AC8311B
      037A522D069E0F080145BD680EEF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000180D
      025705020028000000000A060039D77610FFD77610FF10090146000000000201
      001C130A014C00000000000000000000000000000000717171FF717171FF0000
      0000000000009D560CDA000000002C180374361E04810000000083480AC72816
      036F5C3207A7050300290D070140000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000011D77610FFD77610FF02010019000000000000
      0000000000000000000000000000000000000000000000000000717171FF0000
      0000000000009D560CDA0000000000000011764009BD81470AC6462605920000
      00024A29059781460AC5613508AB000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
    DesignInfo = 23265428
    ImageInfo = <
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
          63653D227072657365727665223E2E59656C6C6F777B66696C6C3A2346464231
          31353B7D262331333B262331303B2623393B2E5265647B66696C6C3A23443131
          4331433B7D262331333B262331303B2623393B2E426C75657B66696C6C3A2331
          31373744373B7D262331333B262331303B2623393B2E477265656E7B66696C6C
          3A233033394332333B7D262331333B262331303B2623393B2E426C61636B7B66
          696C6C3A233732373237323B7D262331333B262331303B2623393B2E57686974
          657B66696C6C3A234646464646463B7D262331333B262331303B2623393B2E73
          74307B6F7061636974793A302E37353B7D3C2F7374796C653E0D0A3C67206964
          3D2253657474696E6773223E0D0A09093C7061746820636C6173733D22426C75
          652220643D224D33302C3138762D346C2D342E342D302E37632D302E322D302E
          382D302E352D312E352D302E392D322E316C322E362D332E366C2D322E382D32
          2E386C2D332E362C322E36632D302E372D302E342D312E342D302E372D322E31
          2D302E394C31382C32682D3420202623393B2623393B6C2D302E372C342E3463
          2D302E382C302E322D312E352C302E352D322E312C302E394C372E352C342E37
          4C342E372C372E356C322E362C332E36632D302E342C302E372D302E372C312E
          342D302E392C322E314C322C313476346C342E342C302E3763302E322C302E38
          2C302E352C312E352C302E392C322E3120202623393B2623393B6C2D322E362C
          332E366C322E382C322E386C332E362D322E3663302E372C302E342C312E342C
          302E372C322E312C302E394C31342C333068346C302E372D342E3463302E382D
          302E322C312E352D302E352C322E312D302E396C332E362C322E366C322E382D
          322E386C2D322E362D332E3620202623393B2623393B63302E342D302E372C30
          2E372D312E342C302E392D322E314C33302C31387A204D31362C3230632D322E
          322C302D342D312E382D342D3473312E382D342C342D3473342C312E382C342C
          345331382E322C32302C31362C32307A222F3E0D0A093C2F673E0D0A3C2F7376
          673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D2256
          6572746963616C5F417869735F4C6F675F5363616C652220786D6C6E733D2268
          7474703A2F2F7777772E77332E6F72672F323030302F7376672220786D6C6E73
          3A786C696E6B3D22687474703A2F2F7777772E77332E6F72672F313939392F78
          6C696E6B2220783D223070782220793D22307078222076696577426F783D2230
          203020333220333222207374796C653D22656E61626C652D6261636B67726F75
          6E643A6E6577203020302033322033323B2220786D6C3A73706163653D227072
          657365727665223E262331333B262331303B3C7374796C6520747970653D2274
          6578742F6373732220786D6C3A73706163653D227072657365727665223E2E42
          6C61636B7B66696C6C3A233732373237323B7D262331333B262331303B262339
          3B2E426C75657B66696C6C3A233131373744373B7D262331333B262331303B26
          23393B2E7374307B6F7061636974793A302E353B7D3C2F7374796C653E0D0A3C
          6720636C6173733D22737430223E0D0A09093C7265637420783D22342220793D
          2232362220636C6173733D22426C61636B222077696474683D22323622206865
          696768743D2232222F3E0D0A093C2F673E0D0A3C706F6C79676F6E20636C6173
          733D22426C61636B2220706F696E74733D22342C3220342C3420322C3420322C
          3620342C3620342C3820322C3820322C313020342C313020342C313220322C31
          3220322C313420342C313420342C313620322C313620322C313820342C313820
          342C323020322C323020322C32322020202623393B342C323220342C32342032
          2C323420322C323620342C323620342C323820362C323820362C3220222F3E0D
          0A3C7061746820636C6173733D22426C75652220643D224D31342E362C313048
          3130563268312E3776362E3568322E395631307A204D31382E362C3130632D31
          2E312C302D322D302E342D322E372D312E31632D302E372D302E372D312D312E
          372D312D322E3863302D312E322C302E342D322E322C312E312D332020262339
          3B4331362E362C322E342C31372E362C322C31382E372C3263312E312C302C32
          2C302E342C322E372C312E3173312C312E372C312C322E3963302C312E322D30
          2E342C322E322D312E312C322E395331392E372C31302C31382E362C31307A20
          4D31382E372C332E35632D302E362C302D312E312C302E322D312E342C302E37
          20202623393B632D302E342C302E352D302E352C312E312D302E352C312E3863
          302C302E382C302E322C312E342C302E352C312E3863302E342C302E342C302E
          382C302E372C312E342C302E3763302E362C302C312E312D302E322C312E342D
          302E3773302E352D312C302E352D312E3820202623393B63302D302E382D302E
          322D312E342D302E352D312E394331392E372C332E372C31392E332C332E352C
          31382E372C332E357A204D33302C392E33632D302E382C302E342D312E372C30
          2E372D322E382C302E374332362C31302C32352C392E372C32342E332C39732D
          312E312D312E362D312E312D322E3820202623393B63302D312E322C302E342D
          322E322C312E322D335332362E322C322C32372E352C3263302E382C302C312E
          352C302E312C322E322C302E335634632D302E362D302E332D312E332D302E35
          2D322E322D302E35632D302E372C302D312E332C302E322D312E382C302E3743
          32352E332C342E362C32352C352E332C32352C3620202623393B63302C302E38
          2C302E322C312E342C302E362C312E3873312C302E372C312E362C302E376330
          2E342C302C302E372D302E312C312D302E3256362E38682D312E3556352E3548
          333056392E337A222F3E0D0A3C2F7376673E0D0A}
      end>
  end
end
