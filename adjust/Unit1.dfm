object Form1: TForm1
  Left = 243
  Top = 171
  Width = 1373
  Height = 683
  Caption = #20892#20449#31038#20998#36134
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 56
    Top = 271
    Width = 97
    Height = 16
    AutoSize = False
    Caption = #35831#36873#25321#24180#65306
  end
  object Label2: TLabel
    Left = 56
    Top = 319
    Width = 89
    Height = 16
    AutoSize = False
    Caption = #35831#36873#25321#26376#65306
  end
  object lbl_result: TLabel
    Left = 336
    Top = 264
    Width = 137
    Height = 16
    AutoSize = False
    Caption = #26816#26597#32467#26524
  end
  object lbl_log: TLabel
    Left = 336
    Top = 56
    Width = 153
    Height = 16
    AutoSize = False
    Caption = #36816#34892#26085#24535
  end
  object lbl_status: TLabel
    Left = 40
    Top = 544
    Width = 273
    Height = 33
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ComboBox1: TComboBox
    Left = 193
    Top = 271
    Width = 80
    Height = 24
    ItemHeight = 16
    TabOrder = 0
    Text = '2010'
    Items.Strings = (
      '2009'
      '2010'
      '2011'
      '2012'
      '2013'
      '2014'
      '2015'
      '2016'
      '2017'
      '2018'
      '2019'
      '2020'
      '2021'
      '2022'
      '2023'
      '2024'
      '2025'
      '2026'
      '2027'
      '2028'
      '2029'
      '2030')
  end
  object ComboBox2: TComboBox
    Left = 193
    Top = 319
    Width = 80
    Height = 24
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 1
    Text = '1'
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12')
  end
  object Memo1: TMemo
    Left = 336
    Top = 80
    Width = 1009
    Height = 169
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 39
    Top = 99
    Width = 274
    Height = 46
    Caption = #23548#20837#21407#22987'DMP'#25991#20214
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn1: TBitBtn
    Left = 31
    Top = 356
    Width = 130
    Height = 45
    Caption = #25286#20998'DMP'#25991#20214
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn3: TBitBtn
    Left = 39
    Top = 156
    Width = 274
    Height = 45
    Caption = #29983#25104#26426#26500#26641
    TabOrder = 5
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 39
    Top = 49
    Width = 274
    Height = 40
    Caption = #21024#38500#26426#26500#34920
    TabOrder = 6
    OnClick = BitBtn4Click
  end
  object btn_showpro: TBitBtn
    Left = 39
    Top = 212
    Width = 274
    Height = 45
    Caption = #26597#30475#37197#32622#25991#20214
    TabOrder = 7
    OnClick = btn_showproClick
  end
  object btn_merge: TButton
    Left = 31
    Top = 408
    Width = 130
    Height = 57
    Caption = #26356#26032'('#35831#25163#21160#26356#26032'feeorg'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    WordWrap = True
    OnClick = btn_mergeClick
  end
  object dbgrd_result: TDBGrid
    Left = 336
    Top = 288
    Width = 1009
    Height = 313
    DataSource = ds_result
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object btn_check_split: TButton
    Left = 184
    Top = 352
    Width = 129
    Height = 113
    Caption = #26816#26597#25286#20998#32467#26524
    TabOrder = 10
    OnClick = btn_check_splitClick
  end
  object btnExport: TBitBtn
    Left = 31
    Top = 476
    Width = 282
    Height = 45
    Caption = #23548#20986'DMP'#25991#20214
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = btnExportClick
  end
  object OraSession1: TOraSession
    Options.Direct = True
    Username = 'fpro'
    Password = '123456'
    Server = 'localhost:1521:orcl'
  end
  object ConnectDialog1: TConnectDialog
    Caption = 'Connect'
    UsernameLabel = 'User Name'
    PasswordLabel = 'Password'
    ServerLabel = 'Server'
    ConnectButton = 'Connect'
    CancelButton = 'Cancel'
    Left = 40
  end
  object OraQuery5: TOraQuery
    SQL.Strings = (
      'create table &rural_feelog_ec_temp2 as'
      'select * from &rural_feelog_ec_temp1 f'
      'where f.headquarter_orgcode in'
      '(select  ec_orgcode from fee_org'
      ')'
      ''
      '')
    Left = 616
    MacroData = <
      item
        Name = 'rural_feelog_ec_temp2'
      end
      item
        Name = 'rural_feelog_ec_temp1'
      end>
  end
  object OpenDialog1: TOpenDialog
    OnShow = OpenDialog1Show
    Left = 80
  end
  object OraQuery1: TOraQuery
    SQL.Strings = (
      'CREATE TABLE &rural_feelog_ec_temp1'
      'AS'
      'SELECT f.*'
      '  FROM &feelog_ec f'
      
        '       INNER JOIN ec_org_temp o ON f.headquarter_orgcode = o.org' +
        'code'
      ' WHERE     f.headquarter_orgcode <> f.branch_orgcode'
      '       AND (o.orgattr IN ('#39'M'#39','
      '                         '#39'N'#39','
      '                         '#39'P'#39','
      '                         '#39'R'#39','
      '                         '#39'U'#39','
      '                         '#39'T'#39','
      '                         '#39'7'#39')'
      '       OR (1 = 0 &condition)'
      '       )')
    Left = 568
    MacroData = <
      item
        Name = 'rural_feelog_ec_temp1'
        Value = 'rural_feelog_ec_temp1_201604'
      end
      item
        Name = 'feelog_ec'
        Value = 'feelog_ec_201604'
      end
      item
        Name = 'condition'
      end>
  end
  object OraQuery2: TOraQuery
    SQL.Strings = (
      'CREATE TABLE &rural_feelog_pc_temp1'
      'AS'
      'SELECT f.*'
      '  FROM &feelog_pc f'
      
        '       INNER JOIN pc_org_temp o ON f.headquarter_orgcode = o.org' +
        'code'
      ' WHERE (o.orgattr IN ('#39'104'#39','
      '                     '#39'105'#39','
      '                     '#39'110'#39','
      '                     '#39'103'#39','
      '                     '#39'P00'#39')'
      '        OR ('
      
        '          f.headquarter_orgcode <> f.branch_orgcode AND (1 = 0 &' +
        'condition)'
      '         )'
      '  )')
    Left = 944
    MacroData = <
      item
        Name = 'rural_feelog_pc_temp1'
      end
      item
        Name = 'feelog_pc'
      end
      item
        Name = 'condition'
      end>
  end
  object OraScript1: TOraScript
    SQL.Strings = (
      'CREATE TABLE pc_org_temp'
      'AS'
      '   SELECT CAST (t.orgcode AS VARCHAR2 (200)) AS orgcode,'
      '          CAST (t.orgname AS VARCHAR2 (200)) AS orgname,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS toporgcode,'
      '          CAST (t.uporgcode AS VARCHAR2 (200)) AS uporgcode,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS orglevel,'
      '          CAST (t.provid AS CHAR (4)) AS provid,'
      '          CAST (t.attrid AS VARCHAR2 (200)) AS orgattr,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l1code,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l1name,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l2code,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l2name,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l3code,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l3name,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l4code,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l4name,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l5code,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l5name,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l6code,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l6name'
      '     FROM ( SELECT m.orgcode,'
      '       m.orgname,'
      '       p.orgcode AS uporgcode,'
      '       m.provid,'
      '       a.attrid'
      '  FROM pc_org m,'
      '       pc_org_relation n,'
      '       pc_org p,'
      '       pc_org_attr a'
      ' WHERE     m.orgid = n.orgid'
      '       AND p.orgid = n.orgrelaid'
      '       AND m.orgid = a.orgid'
      '       AND a.begindate < SYSDATE'
      '       AND a.enddate > SYSDATE'
      '       AND a.attrid IN ('#39'101'#39','
      '                            '#39'102'#39','
      '                            '#39'103'#39','
      '                            '#39'104'#39','
      '                            '#39'105'#39','
      '                            '#39'106'#39','
      '                            '#39'107'#39','
      '                            '#39'108'#39','
      '                            '#39'109'#39','
      '                            '#39'110'#39','
      '                            '#39'P00'#39'))t;'
      ''
      ''
      'CREATE INDEX INDEX_ON_ORGCODE_pc_org_temp'
      '   ON pc_org_temp (ORGCODE);'
      ''
      'CREATE INDEX INDEX_ON_UPORGCODE_pc_org_temp'
      '   ON pc_org_temp (UPORGCODE);'
      ''
      'CREATE INDEX INDEX_ON_ORGLEVEL_pc_org_temp'
      '   ON pc_org_temp (ORGLEVEL);'
      ''
      ''
      'CREATE TABLE pc_org_temp_tree'
      'AS'
      '   (    SELECT t.orgcode,'
      '               t.orgname,'
      '               t.toporgcode,'
      '               t.uporgcode,'
      '               LEVEL orglevel,'
      '               t.provid,'
      '               t.orgattr,'
      '               t.l1code,'
      '               t.l1name,'
      '               t.l2code,'
      '               t.l2name,'
      '               t.l3code,'
      '               t.l3name,'
      '               t.l4code,'
      '               t.l4name,'
      '               t.l5code,'
      '               t.l5name,'
      '               t.l6code,'
      '               t.l6name'
      '          FROM pc_org_temp t'
      '    START WITH    (t.uporgcode = t.orgcode)'
      '               OR (t.uporgcode IS NULL)'
      '               OR (t.uporgcode = '#39'0'#39')'
      '    CONNECT BY PRIOR t.orgcode = t.uporgcode);'
      ''
      ''
      ''
      'CREATE INDEX INDEX_ORGCODE_pc_org_tree_temp'
      '   ON pc_org_temp_tree (ORGCODE);'
      ''
      ''
      'UPDATE pc_org_temp t'
      '   SET t.orglevel ='
      '          (SELECT s.orglevel'
      '             FROM pc_org_temp_tree s'
      '            WHERE t.orgcode = s.orgcode);'
      ''
      ''
      'UPDATE pc_org_temp t'
      
        '   SET t.l1code = CASE WHEN orglevel = '#39'1'#39' THEN orgcode ELSE NUL' +
        'L END,'
      
        '       t.l2code = CASE WHEN orglevel = '#39'2'#39' THEN orgcode ELSE NUL' +
        'L END,'
      
        '       t.l3code = CASE WHEN orglevel = '#39'3'#39' THEN orgcode ELSE NUL' +
        'L END,'
      
        '       t.l4code = CASE WHEN orglevel = '#39'4'#39' THEN orgcode ELSE NUL' +
        'L END,'
      
        '       t.l5code = CASE WHEN orglevel = '#39'5'#39' THEN orgcode ELSE NUL' +
        'L END,'
      
        '       t.l6code = CASE WHEN orglevel = '#39'6'#39' THEN orgcode ELSE NUL' +
        'L END,'
      
        '       t.l1name = CASE WHEN orglevel = '#39'1'#39' THEN orgname ELSE NUL' +
        'L END,'
      
        '       t.l2name = CASE WHEN orglevel = '#39'2'#39' THEN orgname ELSE NUL' +
        'L END,'
      
        '       t.l3name = CASE WHEN orglevel = '#39'3'#39' THEN orgname ELSE NUL' +
        'L END,'
      
        '       t.l4name = CASE WHEN orglevel = '#39'4'#39' THEN orgname ELSE NUL' +
        'L END,'
      
        '       t.l5name = CASE WHEN orglevel = '#39'5'#39' THEN orgname ELSE NUL' +
        'L END,'
      
        '       t.l6name = CASE WHEN orglevel = '#39'6'#39' THEN orgname ELSE NUL' +
        'L END;'
      ''
      ''
      'UPDATE pc_org_temp t'
      '   SET t.l5code ='
      '          (SELECT s.uporgcode'
      '             FROM pc_org_temp s'
      '            WHERE t.l6code = s.orgcode)'
      ' WHERE t.l6code IS NOT NULL;'
      ''
      'UPDATE pc_org_temp t'
      '   SET t.l4code ='
      '          (SELECT s.uporgcode'
      '             FROM pc_org_temp s'
      '            WHERE t.l5code = s.orgcode)'
      ' WHERE t.l5code IS NOT NULL;'
      ''
      'UPDATE pc_org_temp t'
      '   SET t.l3code ='
      '          (SELECT s.uporgcode'
      '             FROM pc_org_temp s'
      '            WHERE t.l4code = s.orgcode)'
      ' WHERE t.l4code IS NOT NULL;'
      ''
      'UPDATE pc_org_temp t'
      '   SET t.l2code ='
      '          (SELECT s.uporgcode'
      '             FROM pc_org_temp s'
      '            WHERE t.l3code = s.orgcode)'
      ' WHERE t.l3code IS NOT NULL;'
      ''
      'UPDATE pc_org_temp t'
      '   SET t.l1code ='
      '          (SELECT s.uporgcode'
      '             FROM pc_org_temp s'
      '            WHERE t.l2code = s.orgcode)'
      ' WHERE t.l2code IS NOT NULL;'
      ''
      'UPDATE pc_org_temp t'
      '   SET t.l6name ='
      '          (SELECT s.orgname'
      '             FROM pc_org_temp s'
      '            WHERE t.l6code = s.orgcode);'
      ''
      'UPDATE pc_org_temp t'
      '   SET t.l5name ='
      '          (SELECT s.orgname'
      '             FROM pc_org_temp s'
      '            WHERE t.l5code = s.orgcode);'
      ''
      'UPDATE pc_org_temp t'
      '   SET t.l4name ='
      '          (SELECT s.orgname'
      '             FROM pc_org_temp s'
      '            WHERE t.l4code = s.orgcode);'
      ''
      'UPDATE pc_org_temp t'
      '   SET t.l3name ='
      '          (SELECT s.orgname'
      '             FROM pc_org_temp s'
      '            WHERE t.l3code = s.orgcode);'
      ''
      'UPDATE pc_org_temp t'
      '   SET t.l2name ='
      '          (SELECT s.orgname'
      '             FROM pc_org_temp s'
      '            WHERE t.l2code = s.orgcode);'
      ''
      'UPDATE pc_org_temp t'
      '   SET t.l1name ='
      '          (SELECT s.orgname'
      '             FROM pc_org_temp s'
      '            WHERE t.l1code = s.orgcode);'
      ''
      ''
      ''
      'UPDATE pc_org_temp t'
      '   SET toporgcode = l1code;'
      ''
      ''
      'DROP TABLE pc_org_temp_tree;'
      ''
      'commit;')
    Left = 120
  end
  object OraScript2: TOraScript
    SQL.Strings = (
      'CREATE TABLE ec_org_temp'
      'AS'
      '   SELECT CAST (t.orgcode AS VARCHAR2 (200)) AS orgcode,'
      '          CAST (t.orgname AS VARCHAR2 (200)) AS orgname,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS toporgcode,'
      '          CAST (t.uporg AS VARCHAR2 (200)) AS uporgcode,'
      '          CAST (t.areacode AS CHAR (6)) AS areacode,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS orglevel,'
      '          CAST (t.orgtype AS VARCHAR2 (200)) AS orgattr,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l1code,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l1name,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l2code,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l2name,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l3code,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l3name,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l4code,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l4name,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l5code,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l5name,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l6code,'
      '          CAST ('#39#39' AS VARCHAR2 (200)) AS l6name'
      '     FROM ec_tm_org t;'
      ''
      ''
      'CREATE INDEX INDEX_ON_ORGCODE_ec_org_temp'
      '   ON ec_org_temp (ORGCODE);'
      ''
      'CREATE INDEX INDEX_ON_UPORGCODE_ec_org_temp'
      '   ON ec_org_temp (UPORGCODE);'
      ''
      'CREATE INDEX INDEX_ON_ORGLEVEL_ec_org_temp'
      '   ON ec_org_temp (ORGLEVEL);'
      ''
      'CREATE TABLE ec_org_temp_tree'
      ''
      'AS'
      '   (    SELECT t.orgcode,'
      '               t.orgname,'
      '               t.toporgcode,'
      '               t.uporgcode,'
      '               LEVEL orglevel,'
      '               t.areacode,'
      '               t.orgattr,'
      '               t.l1code,'
      '               t.l1name,'
      '               t.l2code,'
      '               t.l2name,'
      '               t.l3code,'
      '               t.l3name,'
      '               t.l4code,'
      '               t.l4name,'
      '               t.l5code,'
      '               t.l5name,'
      '               t.l6code,'
      '               t.l6name'
      '          FROM ec_org_temp t'
      '    START WITH    (t.uporgcode = t.orgcode)'
      '               OR (t.uporgcode IS NULL)'
      '               OR (t.uporgcode = '#39'0'#39')'
      '    CONNECT BY PRIOR t.orgcode = t.uporgcode);'
      ''
      ''
      ''
      'CREATE INDEX INDEX_ORGCODE_ec_org_tree_temp'
      '   ON ec_org_temp_tree (ORGCODE);'
      ''
      ''
      'UPDATE ec_org_temp t'
      '   SET t.orglevel ='
      '          (SELECT s.orglevel'
      '             FROM ec_org_temp_tree s'
      '            WHERE t.orgcode = s.orgcode);'
      ''
      ''
      'UPDATE ec_org_temp t'
      
        '   SET t.l1code = CASE WHEN orglevel = '#39'1'#39' THEN orgcode ELSE NUL' +
        'L END,'
      
        '       t.l2code = CASE WHEN orglevel = '#39'2'#39' THEN orgcode ELSE NUL' +
        'L END,'
      
        '       t.l3code = CASE WHEN orglevel = '#39'3'#39' THEN orgcode ELSE NUL' +
        'L END,'
      
        '       t.l4code = CASE WHEN orglevel = '#39'4'#39' THEN orgcode ELSE NUL' +
        'L END,'
      
        '       t.l5code = CASE WHEN orglevel = '#39'5'#39' THEN orgcode ELSE NUL' +
        'L END,'
      
        '       t.l6code = CASE WHEN orglevel = '#39'6'#39' THEN orgcode ELSE NUL' +
        'L END,'
      
        '       t.l1name = CASE WHEN orglevel = '#39'1'#39' THEN orgname ELSE NUL' +
        'L END,'
      
        '       t.l2name = CASE WHEN orglevel = '#39'2'#39' THEN orgname ELSE NUL' +
        'L END,'
      
        '       t.l3name = CASE WHEN orglevel = '#39'3'#39' THEN orgname ELSE NUL' +
        'L END,'
      
        '       t.l4name = CASE WHEN orglevel = '#39'4'#39' THEN orgname ELSE NUL' +
        'L END,'
      
        '       t.l5name = CASE WHEN orglevel = '#39'5'#39' THEN orgname ELSE NUL' +
        'L END,'
      
        '       t.l6name = CASE WHEN orglevel = '#39'6'#39' THEN orgname ELSE NUL' +
        'L END;'
      ''
      ''
      'UPDATE ec_org_temp t'
      '   SET t.l5code ='
      '          (SELECT s.uporgcode'
      '             FROM ec_org_temp s'
      '            WHERE t.l6code = s.orgcode)'
      ' WHERE t.l6code IS NOT NULL;'
      ''
      'UPDATE ec_org_temp t'
      '   SET t.l4code ='
      '          (SELECT s.uporgcode'
      '             FROM ec_org_temp s'
      '            WHERE t.l5code = s.orgcode)'
      ' WHERE t.l5code IS NOT NULL;'
      ''
      'UPDATE ec_org_temp t'
      '   SET t.l3code ='
      '          (SELECT s.uporgcode'
      '             FROM ec_org_temp s'
      '            WHERE t.l4code = s.orgcode)'
      ' WHERE t.l4code IS NOT NULL;'
      ''
      'UPDATE ec_org_temp t'
      '   SET t.l2code ='
      '          (SELECT s.uporgcode'
      '             FROM ec_org_temp s'
      '            WHERE t.l3code = s.orgcode)'
      ' WHERE t.l3code IS NOT NULL;'
      ''
      'UPDATE ec_org_temp t'
      '   SET t.l1code ='
      '          (SELECT s.uporgcode'
      '             FROM ec_org_temp s'
      '            WHERE t.l2code = s.orgcode)'
      ' WHERE t.l2code IS NOT NULL;'
      ''
      'UPDATE ec_org_temp t'
      '   SET t.l6name ='
      '          (SELECT s.orgname'
      '             FROM ec_org_temp s'
      '            WHERE t.l6code = s.orgcode);'
      ''
      'UPDATE ec_org_temp t'
      '   SET t.l5name ='
      '          (SELECT s.orgname'
      '             FROM ec_org_temp s'
      '            WHERE t.l5code = s.orgcode);'
      ''
      'UPDATE ec_org_temp t'
      '   SET t.l4name ='
      '          (SELECT s.orgname'
      '             FROM ec_org_temp s'
      '            WHERE t.l4code = s.orgcode);'
      ''
      'UPDATE ec_org_temp t'
      '   SET t.l3name ='
      '          (SELECT s.orgname'
      '             FROM ec_org_temp s'
      '            WHERE t.l3code = s.orgcode);'
      ''
      'UPDATE ec_org_temp t'
      '   SET t.l2name ='
      '          (SELECT s.orgname'
      '             FROM ec_org_temp s'
      '            WHERE t.l2code = s.orgcode);'
      ''
      'UPDATE ec_org_temp t'
      '   SET t.l1name ='
      '          (SELECT s.orgname'
      '             FROM ec_org_temp s'
      '            WHERE t.l1code = s.orgcode);'
      ''
      ''
      ''
      'UPDATE ec_org_temp t'
      '   SET toporgcode = l1code;'
      ''
      ''
      'DROP TABLE ec_org_temp_tree;'
      ''
      'COMMIT;')
    Left = 160
  end
  object OraQuery3: TOraQuery
    SQL.Strings = (
      'create table &rural_feelog_pc_temp2 as'
      'select * from &rural_feelog_pc_temp1 f'
      'where f.headquarter_orgcode in'
      '(select  pc_orgcode from fee_org'
      ')'
      ''
      '')
    Left = 1288
    MacroData = <
      item
        Name = 'rural_feelog_pc_temp2'
      end
      item
        Name = 'rural_feelog_pc_temp1'
      end>
  end
  object OraQuery4: TOraQuery
    SQL.Strings = (
      'update &rural_feelog_ec_temp2'
      '   set headquarter_orgname    = level2name,'
      '      level1name              = level2name,  '
      '      level2name              = level3name,  '
      '      level3name              = level4name,  '
      '      level4name              = level5name,  '
      '      level5name              = level6name,  '
      '      level6name              = '#39'1'#39'         '
      '     where transaction_no in (select'
      '                              transaction_no'
      '                                from (select t.*,'
      '                                      o.l1code,'
      '                                      o.l2code,'
      '                                      o.l3code,'
      '                                      o.l4code,'
      '                                      o.l5code,'
      '                                      o.l6code'
      '                                from &rural_feelog_ec_temp2 t,'
      '                                      ec_org_temp     o'
      
        '                                where t.headquarter_orgcode <> t' +
        '.branch_orgcode'
      
        '                                      and t.branch_orgcode=o.org' +
        'code)'
      '                             where '
      
        '                               l2code in (select  p.ec_orgcode f' +
        'rom fee_org p) or'
      
        '                               l3code in (select  p.ec_orgcode f' +
        'rom fee_org p) or'
      
        '                               l4code in (select  p.ec_orgcode f' +
        'rom fee_org p) or'
      
        '                               l5code in (select  p.ec_orgcode f' +
        'rom fee_org p) or'
      
        '                               l6code in (select  p.ec_orgcode f' +
        'rom fee_org p) )'
      '  ')
    Left = 664
    MacroData = <
      item
        Name = 'rural_feelog_ec_temp2'
      end>
  end
  object OraQuery6: TOraQuery
    SQL.Strings = (
      'update &rural_feelog_ec_temp2  t'
      'set headquarter_orgcode = '
      '(select'
      '       l2code'
      ' from ec_org_temp   o'
      ' where t.branch_orgcode =o.orgcode'
      '       and t.headquarter_orgcode<>t.branch_orgcode'
      '       and '
      '        ('
      '         l2code  in (select p.ec_orgcode from fee_org p)'
      '      or l3code  in (select p.ec_orgcode from fee_org p)'
      '      or l4code  in (select p.ec_orgcode from fee_org p)'
      '      or l5code  in (select p.ec_orgcode from fee_org p) '
      '      or l6code  in (select p.ec_orgcode from fee_org p)'
      '         )'
      ' ) '
      
        'where t.headquarter_orgcode<>t.branch_orgcode and t.level6name =' +
        #39'1'#39
      'and '
      '('
      ' t.level1name in'
      
        ' (select e.orgname from fee_org p,ec_org_temp e where p.ec_orgco' +
        'de=e.orgcode)'
      'or '
      ' t.level2name in'
      
        ' (select e.orgname from fee_org p,ec_org_temp e where p.ec_orgco' +
        'de=e.orgcode)'
      ')     '
      '')
    Left = 704
    MacroData = <
      item
        Name = 'rural_feelog_ec_temp2'
      end>
  end
  object OraQuery7: TOraQuery
    SQL.Strings = (
      ''
      'update &rural_feelog_ec_temp2 '
      '   set'
      '      headquarter_orgname = level2name,'
      '      level1name              = level2name,  '
      '      level2name              = level3name,  '
      '      level3name              = level4name,  '
      '      level4name              = level5name,  '
      '      level5name              = level6name,  '
      '      level6name              = '#39'1'#39'         '
      '     where transaction_no in ( select'
      '                              transaction_no'
      '                                from (select t.*,'
      '                                      o.l1code,'
      '                                      o.l2code,'
      '                                      o.l3code,'
      '                                      o.l4code,'
      '                                      o.l5code,'
      '                                      o.l6code'
      '                                 from &rural_feelog_ec_temp2 t,'
      
        '                                      ec_org_temp               ' +
        '        o'
      '                                where t.headquarter_orgcode <>'
      '                                      t.branch_orgcode'
      
        '                                      and t.branch_orgcode=o.org' +
        'code)'
      '                             where '
      
        '                               l3code in (select  p.ec_orgcode f' +
        'rom fee_org p)   or'
      
        '                                 l4code in (select  p.ec_orgcode' +
        ' from fee_org p) or'
      
        '                                l5code in (select  p.ec_orgcode ' +
        'from fee_org p)or'
      
        '                                l6code in (select  p.ec_orgcode ' +
        'from fee_org p))')
    Left = 760
    MacroData = <
      item
        Name = 'rural_feelog_ec_temp2'
      end>
  end
  object OraQuery8: TOraQuery
    SQL.Strings = (
      'update &rural_feelog_ec_temp2 t'
      ''
      'set headquarter_orgcode = '
      '('
      'select'
      '         l3code'
      '  from  ec_org_temp   o'
      '       where '
      '       t.branch_orgcode =o.orgcode'
      '       and t.headquarter_orgcode<>t.branch_orgcode'
      '      -- and l2code not in  (select p.ec_orgcode from fee_org p)'
      '       and (l2code  in (select p.ec_orgcode from fee_org p)'
      '      or l3code  in (select p.ec_orgcode from fee_org p)'
      '      or l4code  in (select p.ec_orgcode from fee_org p)'
      '      or l5code  in (select p.ec_orgcode from fee_org p)'
      '      or l6code  in (select p.ec_orgcode from fee_org p))'
      ') '
      'where t.headquarter_orgcode<>t.branch_orgcode'
      
        '--and t.headquarter_orgcode not in (select p.ec_orgcode from fee' +
        '_org p)'
      'and t.level1name in'
      
        ' (select e.orgname from fee_org p,ec_org_temp e where p.ec_orgco' +
        'de=e.orgcode)'
      'and t.level6name ='#39'1'#39)
    Left = 792
    MacroData = <
      item
        Name = 'rural_feelog_ec_temp2'
      end>
  end
  object OraScript3: TOraScript
    SQL.Strings = (
      'insert into  &feelog_ec_normal '
      'select '
      '*'
      'from &rural_feelog_ec_temp2 ;'
      'commit;')
    Left = 256
    MacroData = <
      item
        Name = 'feelog_ec_normal'
      end
      item
        Name = 'rural_feelog_ec_temp2'
      end>
  end
  object OraScript5: TOraScript
    SQL.Strings = (
      'rename &feelog_ec to &feelog_ec_normal ;'
      ''
      'rename ec_feelog_temp  to &feelog_ec ;')
    Left = 304
    MacroData = <
      item
        Name = 'feelog_ec'
      end
      item
        Name = 'feelog_ec_normal'
      end>
  end
  object OraQuery9: TOraQuery
    SQL.Strings = (
      'update &rural_feelog_pc_temp2'
      '   set headquarter_orgname    = level2name,'
      '      level1name              = level2name,  '
      '      level2name              = level3name,  '
      '      level3name              = level4name,  '
      '      level4name              = level5name,  '
      '      level5name              = level6name,  '
      '      level6name              = '#39'1'#39'         '
      '     where transaction_no in (select'
      '                              transaction_no'
      '                                from (select t.*,'
      '                                      o.l1code,'
      '                                      o.l2code,'
      '                                      o.l3code,'
      '                                      o.l4code,'
      '                                      o.l5code,'
      '                                      o.l6code'
      
        '                                from &rural_feelog_pc_temp2 t,pc' +
        '_org_temp o'
      
        '                                where t.headquarter_orgcode <> t' +
        '.branch_orgcode'
      
        '                                      and t.branch_orgcode=o.org' +
        'code)'
      '                             where '
      
        '                               l2code in (select  p.pc_orgcode f' +
        'rom fee_org p) or'
      
        '                               l3code in (select  p.pc_orgcode f' +
        'rom fee_org p) or'
      
        '                               l4code in (select  p.pc_orgcode f' +
        'rom fee_org p) or'
      
        '                               l5code in (select  p.pc_orgcode f' +
        'rom fee_org p) or'
      
        '                               l6code in (select  p.pc_orgcode f' +
        'rom fee_org p) )'
      '  ')
    Left = 984
    MacroData = <
      item
        Name = 'rural_feelog_pc_temp2'
      end>
  end
  object OraQuery10: TOraQuery
    SQL.Strings = (
      'update &rural_feelog_pc_temp2 t'
      'set headquarter_orgcode = '
      '('
      'select'
      '         l2code'
      '  from pc_org_temp   o'
      '       where '
      '       t.branch_orgcode =o.orgcode'
      '       and t.headquarter_orgcode<>t.branch_orgcode'
      '       and '
      '       ('
      '         l2code  in (select p.pc_orgcode from fee_org p)'
      '      or l3code  in (select p.pc_orgcode from fee_org p)'
      '      or l4code  in (select p.pc_orgcode from fee_org p)'
      '      or l5code  in (select p.pc_orgcode from fee_org p) '
      '      or l6code  in (select p.pc_orgcode from fee_org p)'
      '       )'
      ') '
      
        'where t.headquarter_orgcode<>t.branch_orgcode and t.level6name =' +
        #39'1'#39
      'and ('
      '  t.level1name in'
      
        ' (select e.orgname from fee_org p,pc_org_temp e where p.pc_orgco' +
        'de=e.orgcode)'
      ' or'
      '  t.level2name in'
      
        ' (select e.orgname from fee_org p,pc_org_temp e where p.pc_orgco' +
        'de=e.orgcode)'
      ')'
      '')
    Left = 1024
    MacroData = <
      item
        Name = 'rural_feelog_pc_temp2'
      end>
  end
  object OraQuery11: TOraQuery
    SQL.Strings = (
      ''
      'update &rural_feelog_pc_temp2 '
      '   set'
      '      headquarter_orgname = level2name,'
      '      level1name              = level2name,  '
      '      level2name              = level3name,  '
      '      level3name              = level4name,  '
      '      level4name              = level5name,  '
      '      level5name              = level6name,  '
      '      level6name              = '#39'1'#39'         '
      '     where transaction_no in ( select'
      '                              transaction_no'
      '                                from (select t.*,'
      '                                      o.l1code,'
      '                                      o.l2code,'
      '                                      o.l3code,'
      '                                      o.l4code,'
      '                                      o.l5code,'
      '                                      o.l6code'
      '                                 from &rural_feelog_pc_temp2 t,'
      
        '                                      pc_org_temp               ' +
        '        o'
      '                                where t.headquarter_orgcode <>'
      '                                      t.branch_orgcode'
      
        '                                      and t.branch_orgcode=o.org' +
        'code)'
      '                             where '
      
        '                               l3code in (select  p.pc_orgcode f' +
        'rom fee_org p)   or'
      
        '                                 l4code in (select  p.pc_orgcode' +
        ' from fee_org p) or'
      
        '                                l5code in (select  p.pc_orgcode ' +
        'from fee_org p)or'
      
        '                                l6code in (select  p.pc_orgcode ' +
        'from fee_org p))')
    Left = 1096
    MacroData = <
      item
        Name = 'rural_feelog_pc_temp2'
      end>
  end
  object OraScript7: TOraScript
    SQL.Strings = (
      'insert into  &feelog_pc_normal '
      'select '
      '*'
      'from &rural_feelog_pc_temp2 ;'
      'commit;')
    Left = 344
    MacroData = <
      item
        Name = 'feelog_pc_normal'
      end
      item
        Name = 'rural_feelog_pc_temp2'
      end>
  end
  object OraScript9: TOraScript
    SQL.Strings = (
      'rename &feelog_pc to &feelog_pc_normal ;'
      'rename pc_feelog_temp  to &feelog_pc ;')
    Left = 432
    MacroData = <
      item
        Name = 'feelog_pc'
      end
      item
        Name = 'feelog_pc_normal'
      end>
  end
  object OraQuery12: TOraQuery
    SQL.Strings = (
      ''
      'update &rural_feelog_pc_temp2 t'
      'set headquarter_orgcode = '
      '('
      'select'
      '         l3code'
      '  from    pc_org_temp   o'
      '       where '
      '       t.branch_orgcode =o.orgcode'
      '       and t.headquarter_orgcode<>t.branch_orgcode'
      '       --and l2code not in  (select p.pc_orgcode from fee_org p)'
      '       and (l2code  in (select p.pc_orgcode from fee_org p)'
      '      or l3code  in (select p.pc_orgcode from fee_org p)'
      '      or l4code  in (select p.pc_orgcode from fee_org p)'
      '      or l5code  in (select p.pc_orgcode from fee_org p)'
      '      or l6code  in (select p.pc_orgcode from fee_org p))'
      ') '
      'where t.headquarter_orgcode<>t.branch_orgcode'
      
        '-- and t.headquarter_orgcode not in (select p.pc_orgcode from fe' +
        'e_org p)'
      'and t.level1name in'
      
        ' (select e.orgname from fee_org p,pc_org_temp e where p.pc_orgco' +
        'de=e.orgcode)'
      'and t.level6name ='#39'1'#39)
    Left = 1128
    MacroData = <
      item
        Name = 'rural_feelog_pc_temp2'
      end>
  end
  object OraQuery13: TOraQuery
    SQL.Strings = (
      'update &rural_feelog_ec_temp2 t set t.level6name = '#39#39' ')
    Left = 728
    MacroData = <
      item
        Name = 'rural_feelog_ec_temp2'
      end>
  end
  object OraQuery14: TOraQuery
    SQL.Strings = (
      'update &rural_feelog_pc_temp2 t set t.level6name = '#39#39' ')
    Left = 1064
    MacroData = <
      item
        Name = 'rural_feelog_pc_temp2'
      end>
  end
  object OraQuery15: TOraQuery
    SQL.Strings = (
      'update &rural_feelog_ec_temp2 t set t.level6name = '#39#39' ')
    Left = 824
    MacroData = <
      item
        Name = 'rural_feelog_ec_temp2'
      end>
  end
  object OraQuery16: TOraQuery
    SQL.Strings = (
      'update &rural_feelog_pc_temp2 t set t.level6name = '#39#39' ')
    Left = 1168
    MacroData = <
      item
        Name = 'rural_feelog_pc_temp2'
      end>
  end
  object OraQuery17: TOraQuery
    SQL.Strings = (
      
        'update &rural_feelog_ec_temp2 t set t.headquarter_orgcode =t.bra' +
        'nch_orgcode'
      
        'where  t.headquarter_orgcode<>t.branch_orgcode and t.headquarter' +
        '_orgname=t.branch_orgname'
      'and'
      't.level2name is null'
      '')
    Left = 864
    MacroData = <
      item
        Name = 'rural_feelog_ec_temp2'
      end>
  end
  object OraQuery18: TOraQuery
    SQL.Strings = (
      
        'update &rural_feelog_pc_temp2 t set t.headquarter_orgcode =t.bra' +
        'nch_orgcode'
      
        'where  t.headquarter_orgcode<>t.branch_orgcode and t.headquarter' +
        '_orgname=t.branch_orgname'
      'and'
      ''
      't.level2name  is null'
      '')
    Left = 1208
    MacroData = <
      item
        Name = 'rural_feelog_pc_temp2'
      end>
  end
  object OraQuery19: TOraQuery
    SQL.Strings = (
      'update &rural_feelog_ec_temp2 t set t.headquarter_orgcode='
      '('
      'select '
      'e.uporgcode'
      'from ec_org_temp e'
      'where e.orgcode=t.branch_orgcode'
      '--and e.uporgcode in (select p.ec_orgcode from fee_org p)'
      ')'
      'where'
      't.level2name is not null '
      ' and t.branch_orgcode in'
      '(select t.branch_orgcode'
      'from '
      'ec_org_temp  e'
      'where t.branch_orgcode=e.orgcode'
      'and e.uporgcode in (select p.ec_orgcode from fee_org p)'
      ')'
      ''
      ''
      '')
    Left = 904
    MacroData = <
      item
        Name = 'rural_feelog_ec_temp2'
      end>
  end
  object OraQuery20: TOraQuery
    SQL.Strings = (
      'update &rural_feelog_pc_temp2 t set t.headquarter_orgcode='
      '('
      'select '
      'e.uporgcode'
      'from pc_org_temp e'
      'where e.orgcode=t.branch_orgcode'
      '--and e.uporgcode in (select p.pc_orgcode from fee_org p)'
      ')'
      'where'
      't.level2name is not null '
      ' and '
      't.branch_orgcode in'
      '(select t.branch_orgcode'
      'from '
      'pc_org_temp  e'
      'where t.branch_orgcode=e.orgcode'
      'and e.uporgcode in (select p.pc_orgcode from fee_org p)'
      ')'
      ''
      '')
    Left = 1248
    MacroData = <
      item
        Name = 'rural_feelog_pc_temp2'
      end>
  end
  object OraScript6: TOraScript
    SQL.Strings = (
      'create table &feelog_ec_normal as'
      'select'
      '* '
      'from &feelog_ec'
      'minus'
      'select '
      '*'
      'from &rural_feelog_ec_temp1;'
      ''
      ''
      'insert into &feelog_ec_normal '
      'select * from &rural_feelog_ec_temp1'
      'minus '
      'select * from &rural_feelog_ec_temp2;'
      'commit;')
    Left = 208
    MacroData = <
      item
        Name = 'feelog_ec_normal'
      end
      item
        Name = 'feelog_ec'
      end
      item
        Name = 'rural_feelog_ec_temp1'
      end
      item
        Name = 'rural_feelog_ec_temp2'
      end>
  end
  object OraScript10: TOraScript
    SQL.Strings = (
      'create table &feelog_pc_normal as'
      'select'
      '* '
      'from &feelog_pc'
      'minus'
      'select '
      '*'
      'from &rural_feelog_pc_temp1;'
      ''
      ''
      'insert into &feelog_pc_normal '
      'select * from &rural_feelog_pc_temp1'
      'minus '
      'select * from &rural_feelog_pc_temp2;'
      'commit;')
    Left = 384
    MacroData = <
      item
        Name = 'feelog_pc_normal'
      end
      item
        Name = 'feelog_pc'
      end
      item
        Name = 'rural_feelog_pc_temp1'
      end
      item
        Name = 'rural_feelog_pc_temp2'
      end>
  end
  object orscrpt_merge_pc: TOraScript
    SQL.Strings = (
      'update &feelog_pc_normal t'
      '   set t.headquarter_orgname = t.branch_orgname,'
      '       t.headquarter_orgcode = t.branch_orgcode,'
      '       t.level1name          = t.level2name,'
      '       t.level2name          = null'
      ' where t.transaction_no in'
      ' ('
      ' select transaction_no from &feelog_pc_normal f'
      'where f.headquarter_orgcode <> f.branch_orgcode'
      ' and (1=0 &condition)'
      ' );'
      ''
      'COMMIT;')
    Left = 32
    Top = 608
    MacroData = <
      item
        Name = 'feelog_pc_normal'
      end
      item
        Name = 'condition'
      end>
  end
  object orscrpt_update_headquarter_orgcode_pc: TOraScript
    SQL.Strings = (
      'CREATE TABLE headcode_l2code_tmp'
      'AS'
      '   SELECT T.TRANSACTION_NO, T.HEADQUARTER_ORGCODE, o.l2code'
      '     FROM rural_feelog_pc_temp2_201604 t'
      
        '          INNER JOIN pc_org_temp o ON t.branch_orgcode = o.orgco' +
        'de'
      '    WHERE     t.headquarter_orgcode <> t.branch_orgcode'
      '          AND (   o.l2code IN (SELECT p.pc_orgcode'
      '                                 FROM fee_org p)'
      '               OR l3code IN (SELECT p.pc_orgcode'
      '                               FROM fee_org p)'
      '               OR l4code IN (SELECT p.pc_orgcode'
      '                               FROM fee_org p)'
      '               OR l5code IN (SELECT p.pc_orgcode'
      '                               FROM fee_org p)'
      '               OR l6code IN (SELECT p.pc_orgcode'
      '                               FROM fee_org p))'
      '          AND t.level6name = '#39'1'#39';'
      ''
      ''
      'CREATE INDEX INDEX_ON_headcode_l2code_tmp'
      '   ON headcode_l2code_tmp (TRANSACTION_NO);'
      '   '
      'update &rural_feelog_pc_temp2 d '
      'set headquarter_orgcode='
      
        '(select b.l2code from headcode_l2code_tmp b where b.TRANSACTION_' +
        'NO=d.TRANSACTION_NO)'
      'where exists (select 1'
      'from headcode_l2code_tmp b'
      'where b.TRANSACTION_NO=d.TRANSACTION_NO'
      ');'
      ''
      'commit;')
    Left = 144
    Top = 608
    MacroData = <
      item
        Name = 'rural_feelog_pc_temp2'
      end>
  end
  object orscrpt_merge_ec: TOraScript
    SQL.Strings = (
      'update &feelog_ec_normal t'
      '   set t.headquarter_orgname = t.branch_orgname,'
      '       t.headquarter_orgcode = t.branch_orgcode,'
      '       t.level1name          = t.level2name,'
      '       t.level2name          = null'
      ' where t.transaction_no in'
      ' ('
      ' select transaction_no from &feelog_ec_normal f'
      'where f.headquarter_orgcode <> f.branch_orgcode'
      ' and (1=0 &condition)'
      ' );'
      ''
      'commit;')
    Left = 72
    Top = 608
    MacroData = <
      item
        Name = 'feelog_ec_normal'
      end
      item
        Name = 'condition'
      end>
  end
  object orscrpt_update_headquarter_orgcode_ec: TOraScript
    SQL.Strings = (
      'CREATE TABLE headcode_l2code_ec_tmp'
      'AS'
      '   SELECT T.TRANSACTION_NO, T.HEADQUARTER_ORGCODE, o.l2code'
      '     FROM &rural_feelog_ec_temp2 t'
      
        '          INNER JOIN pc_org_temp o ON t.branch_orgcode = o.orgco' +
        'de'
      '    WHERE     t.headquarter_orgcode <> t.branch_orgcode'
      '          AND (   o.l2code IN (SELECT p.ec_orgcode'
      '                                 FROM fee_org p)'
      '               OR l3code IN (SELECT p.ec_orgcode'
      '                               FROM fee_org p)'
      '               OR l4code IN (SELECT p.ec_orgcode'
      '                               FROM fee_org p)'
      '               OR l5code IN (SELECT p.ec_orgcode'
      '                               FROM fee_org p)'
      '               OR l6code IN (SELECT p.ec_orgcode'
      '                               FROM fee_org p))'
      '          AND t.level6name = '#39'1'#39';'
      ''
      ''
      'CREATE INDEX INDEX_ON_headcode_l2code_ec_tmp'
      '   ON headcode_l2code_ec_tmp (TRANSACTION_NO);'
      '   '
      'update &rural_feelog_ec_temp2 d '
      'set headquarter_orgcode='
      
        '(select b.l2code from headcode_l2code_tmp b where b.TRANSACTION_' +
        'NO=d.TRANSACTION_NO)'
      'where exists (select 1'
      'from headcode_l2code_ec_tmp b'
      'where b.TRANSACTION_NO=d.TRANSACTION_NO'
      ');'
      ''
      'commit;')
    Left = 184
    Top = 608
    MacroData = <
      item
        Name = 'rural_feelog_ec_temp2'
      end>
  end
  object ds_result: TDataSource
    AutoEdit = False
    Left = 288
    Top = 608
  end
  object orqry_check_split_result: TOraQuery
    SQL.Strings = (
      'select * from &feelog_ec_normal f'
      'where f.headquarter_orgcode <> f.branch_orgcode'
      ' and (1=0 &condition)'
      'union'
      'select * from &feelog_pc_normal f'
      'where f.headquarter_orgcode <> f.branch_orgcode'
      ' and (1=0 &condition)')
    Left = 248
    Top = 608
    MacroData = <
      item
        Name = 'feelog_ec_normal'
      end
      item
        Name = 'condition'
      end
      item
        Name = 'feelog_pc_normal'
      end>
  end
  object OraScript8: TOraScript
    SQL.Strings = (
      'rename &feelog_pc to pc_feelog_temp;'
      'rename &feelog_pc_normal to &feelog_pc;')
    Left = 344
    MacroData = <
      item
        Name = 'feelog_pc'
      end
      item
        Name = 'feelog_pc_normal'
      end>
  end
  object OraScript4: TOraScript
    SQL.Strings = (
      'rename &feelog_ec to ec_feelog_temp;'
      'rename &feelog_ec_normal to &feelog_ec ;')
    Left = 472
    MacroData = <
      item
        Name = 'feelog_ec'
      end
      item
        Name = 'feelog_ec_normal'
      end>
  end
end
