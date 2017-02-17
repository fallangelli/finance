object Form1: TForm1
  Left = 193
  Top = 131
  Width = 547
  Height = 422
  Caption = #20010#20154#24449#20449#31995#32479'--'#35745#36153#27169#22359
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 30
    Top = 69
    Width = 60
    Height = 16
    Caption = #35831#36873#25321#24180'    '
  end
  object Label2: TLabel
    Left = 30
    Top = 108
    Width = 57
    Height = 16
    Caption = #35831#36873#25321#26376'   '
  end
  object Button2: TButton
    Left = 433
    Top = 39
    Width = 179
    Height = 61
    Caption = #25277#21462#26597#35810#35760#24405
    TabOrder = 1
    Visible = False
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 236
    Top = 39
    Width = 179
    Height = 61
    Caption = #25277#21462#26426#26500#20449#24687
    TabOrder = 2
    Visible = False
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 433
    Top = 207
    Width = 179
    Height = 60
    Caption = #29983#25104#35745#36153#26126#32454
    TabOrder = 3
    Visible = False
    OnClick = Button4Click
  end
  object ComboBox1: TComboBox
    Left = 128
    Top = 59
    Width = 80
    Height = 24
    ItemHeight = 16
    TabOrder = 4
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
    Left = 128
    Top = 108
    Width = 80
    Height = 24
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 5
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
    Left = 226
    Top = 20
    Width = 405
    Height = 444
    ScrollBars = ssVertical
    TabOrder = 6
  end
  object Button5: TButton
    Left = 433
    Top = 118
    Width = 179
    Height = 60
    Caption = #25277#21462#20154#21592#20449#24687
    TabOrder = 7
    Visible = False
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 30
    Top = 167
    Width = 178
    Height = 61
    Caption = #20840#37096#25191#34892
    Default = True
    TabOrder = 0
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 236
    Top = 315
    Width = 179
    Height = 60
    Caption = #23548#20986#25991#20214
    TabOrder = 8
    Visible = False
    OnClick = Button7Click
  end
  object BitBtn1: TBitBtn
    Left = 236
    Top = 118
    Width = 179
    Height = 60
    Caption = #36873#25321#26426#26500#22788#29702#25991#20214
    TabOrder = 9
    Visible = False
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 236
    Top = 246
    Width = 179
    Height = 51
    Caption = #24320#22987#35843#25972#26426#26500#20851#31995
    Enabled = False
    TabOrder = 10
    Visible = False
    OnClick = BitBtn2Click
  end
  object Edit1: TEdit
    Left = 236
    Top = 197
    Width = 179
    Height = 24
    TabOrder = 11
    Text = #25991#20214#21517
    Visible = False
    OnChange = Edit1Change
  end
  object OraSession1: TOraSession
    Options.Direct = True
    Username = 'fee'
    Password = 'fee'
    Server = '127.0.0.1:1521:jifei'
    Left = 24
    Top = 16
  end
  object OraQuery19: TOraQuery
    SQL.Strings = (
      'insert into  FEELOG_PC_TEMP1 '
      'select t.queryorgno, '
      't.usercode,'
      ' t.pin,'
      '  min(t.querydate) as OrderTime '
      '  '
      '  from &pc_queryrecord_tablename t'
      'where t.queryorgno <> '#39'0'#39' '
      'and t.queryorgno is not null'
      ' and t.querydate is not null'
      '  and t.usercode is not null'
      
        '   and (t.queryreasoncode in('#39'01'#39','#39'02'#39','#39'03'#39','#39'08'#39','#39'16'#39','#39'20'#39','#39'21'#39',' +
        #39'22'#39','#39'23'#39','#39'24'#39','#39'25'#39')  ) '
      'and t.querydate >=:StartTime'
      'and t.querydate <:EndTime'
      'group by t.queryorgno, t.usercode, t.pin')
    Left = 424
    Top = 160
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'StartTime'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'EndTime'
        ParamType = ptInput
      end>
    MacroData = <
      item
        Name = 'pc_queryrecord_tablename'
      end>
  end
  object OraQuery25: TOraQuery
    SQL.Strings = (
      'create table FEELOG_PC_TEMP4 as'
      
        'select s.*, t.rootorgcode,t.rootorgname,l1name,l2name,l3name,l4n' +
        'ame,l5name,l6name'
      'from FEELOG_PC_TEMP3  s, '
      '('
      'select m.orgcode as BranchOrgCode, n.orgcode as RootOrgCode,'
      
        'n.orgname as RootOrgName,m.l1name,m.l2name,m.l3name,m.l4name,m.l' +
        '5name,m.l6name'
      'from org_temp m, org_temp n'
      'where m.toporgcode = n.orgcode'
      ' ) t'
      'WHERE s.queryorgno = t.branchorgcode')
    Left = 352
    Top = 192
  end
  object OraQuery28: TOraQuery
    SQL.Strings = (
      'create table FEELOG_PC_TEMP5 as '
      
        'select '#39'TSNA'#39'||to_char(s.ordertime, '#39'YYYYMMDD'#39') || lpad(to_char(' +
        's.num), 10, '#39'0'#39') as OrderSerialNumber,'
      's.queryorgno, '
      's.usercode, '
      's.ordertime, '
      's.productlabel, '
      's.certtype, '
      's.rootorgcode, '
      's.rootorgname, '
      's.l1name, '
      's.l2name, '
      's.l3name, '
      's.l4name, '
      's.l5name, '
      's.l6name       '
      '  from (select rownum as num, t.* from feelog_pc_temp4 t) s')
    Left = 392
    Top = 192
  end
  object OraQuery29: TOraQuery
    SQL.Strings = (
      'create table feelog_pc_temp6 as'
      'select t.*, s.orgname as BranchOrgName,s.provname BranchProvince'
      
        '  from feelog_pc_temp5 t, (select a.*,b.provname from org_temp a' +
        ',pc_province b where a.provid =b.provid(+)) s'
      ' where t.queryorgno = s.orgcode(+)')
    Left = 432
    Top = 192
  end
  object OraScript1: TOraScript
    SQL.Strings = (
      'alter session force parallel query parallel 4;'
      'alter session force parallel dml parallel 4;'
      ''
      
        'create /*+ append nologging parallel 4 */ table FEELOG_PC_TEMP2 ' +
        'as'
      'select /*+ use_nl(s) */s.*, t.certno as ProductLabel,t.certtype'
      'from FEELOG_PC_TEMP1  s, pc_certificate t'
      'WHERE s.pin = t.pin;'
      ''
      'create table FEELOG_PC_TEMP3 as'
      'select '
      '*'
      'from '
      '('
      'select m.queryorgno,'
      '       m.usercode,'
      '       m.OrderTime,'
      '       m.ProductLabel,'
      '       m.certtype,'
      
        '       row_number() over(partition by m.queryorgno,m.usercode,m.' +
        'productlabel order by m.OrderTime asc) rank '
      '      from FEELOG_PC_TEMP2 m'
      ' where m.queryorgno <> '#39'B0000000000001'#39
      ' )'
      ' where rank=1;')
    Left = 456
    Top = 160
  end
  object OraQuery30: TOraQuery
    SQL.Strings = (
      'insert into &feelog_pc_tablename'
      'select '
      'TRANSACTION_NO,'
      '  TRANSACTION_TIME ,'
      '  HEADQUARTER_ORGCODE,'
      '  HEADQUARTER_ORGNAME,'
      '  BRANCH_ORGCODE,'
      '  BRANCH_ORGNAME,'
      '  BRANCH_PROVINCE,'
      '  OPERATOR_USERNAME,'
      '  PRODUCT_CODE,'
      '  PRODUCT_MULTIPLIER,'
      '  PRODUCT_MEMO_1,'
      '  PRODUCT_MEMO_2,'
      '  PRODUCT_MEMO_3,'
      '  PRODUCT_MEMO_4,'
      '  LEVEL1NAME,'
      '  LEVEL2NAME,'
      '  LEVEL3NAME,'
      '  LEVEL4NAME,'
      '  LEVEL5NAME,'
      '  LEVEL6NAME'
      'from '
      '(select'
      'distinct'
      '  TRANSACTION_NO,'
      '  TRANSACTION_TIME ,'
      '  HEADQUARTER_ORGCODE,'
      '  HEADQUARTER_ORGNAME,'
      '  BRANCH_ORGCODE,'
      '  BRANCH_ORGNAME,'
      '  BRANCH_PROVINCE,'
      '  OPERATOR_USERNAME,'
      '  PRODUCT_CODE,'
      '  PRODUCT_MULTIPLIER,'
      '  PRODUCT_MEMO_1,'
      '  PRODUCT_MEMO_2,'
      '  PRODUCT_MEMO_3,'
      '  PRODUCT_MEMO_4,'
      '  LEVEL1NAME,'
      '  LEVEL2NAME,'
      '  LEVEL3NAME,'
      '  LEVEL4NAME,'
      '  LEVEL5NAME,'
      '  LEVEL6NAME,'
      '  row_number()  over (partition by HEADQUARTER_ORGCODE,to_char'
      
        '  (TRANSACTION_TIME,'#39'yyyymmdd'#39'),PRODUCT_MEMO_1 order by  TRANSAC' +
        'TION_TIME asc)  rank '
      ' from feelog_pc_temp9 t'
      ''
      ''
      ' ) where rank =1 ')
    Left = 360
    Top = 272
    MacroData = <
      item
        Name = 'feelog_pc_tablename'
      end>
  end
  object ConnectDialog1: TConnectDialog
    Caption = 'Connect'
    UsernameLabel = 'User Name'
    PasswordLabel = 'Password'
    ServerLabel = 'Server'
    ConnectButton = 'Connect'
    CancelButton = 'Cancel'
    Left = 56
    Top = 16
  end
  object OraQuery1: TOraQuery
    SQL.Strings = (
      'create table &FEELOG_PC_TABLENAME'
      '('
      '  TRANSACTION_NO      VARCHAR2(22) not null,'
      '  TRANSACTION_TIME    DATE,'
      '  HEADQUARTER_ORGCODE VARCHAR2(200),'
      '  HEADQUARTER_ORGNAME VARCHAR2(200),'
      '  BRANCH_ORGCODE      VARCHAR2(200),'
      '  BRANCH_ORGNAME      VARCHAR2(200),'
      '  BRANCH_PROVINCE     VARCHAR2(100),'
      '  OPERATOR_USERNAME   VARCHAR2(100),'
      '  PRODUCT_CODE        VARCHAR2(10),'
      '  PRODUCT_MULTIPLIER  NUMBER(10),'
      '  PRODUCT_MEMO_1      VARCHAR2(200),'
      '  PRODUCT_MEMO_2      VARCHAR2(200),'
      '  PRODUCT_MEMO_3      VARCHAR2(200),'
      '  PRODUCT_MEMO_4      VARCHAR2(200),'
      '  LEVEL1NAME          VARCHAR2(200),'
      '  LEVEL2NAME          VARCHAR2(200),'
      '  LEVEL3NAME          VARCHAR2(200),'
      '  LEVEL4NAME          VARCHAR2(200),'
      '  LEVEL5NAME          VARCHAR2(200),'
      '  LEVEL6NAME          VARCHAR2(200)'
      ')')
    Left = 336
    Top = 160
    MacroData = <
      item
        Name = 'FEELOG_PC_TABLENAME'
      end>
  end
  object OpenDialog1: TOpenDialog
    Left = 216
    Top = 104
  end
  object OraQuery2: TOraQuery
    Left = 296
    Top = 104
  end
  object OraQuery5: TOraQuery
    SQL.Strings = (
      'create table feelog_pc_temp7 as'
      'select t.*, o.deptname'
      '  from feelog_pc_temp6 t, pc_outeruser o'
      ' where t.usercode = o.userid(+)')
    Left = 360
    Top = 232
  end
  object OraQuery18: TOraQuery
    SQL.Strings = (
      'create table feelog_pc_temp8 as'
      'select t.*, p.certname'
      '  from feelog_pc_temp7 t, pc_dd_certificate p'
      ' where t.certtype = p.certcode')
    Left = 400
    Top = 232
  end
  object OraScript2: TOraScript
    SQL.Strings = (
      'create table pc_org_relation as'
      'select t.org_relation_id, t.orgid, t.orgrelaid'
      '  from org_relation@dblink_pc_manage t'
      ' where relaid = 1'
      '   and begindate <= sysdate'
      '   and sysdate < enddate;'
      ''
      ''
      
        'create index pc_orgid_index_on_org_relation on pc_org_relation (' +
        'orgid);'
      ''
      ''
      'create table pc_org as'
      'select t.orgid,'
      '       t.orgcode,'
      '       t.orgname,'
      '       t.orglevel,'
      '       t.address,'
      '       t.provid,'
      '       t.orgid as rootid,'
      '       t.orgid as toporgid'
      '  from org@dblink_pc_manage t'
      ' where t.del = 0;'
      'create table pc_province as'
      'select *   from province@dblink_pc_manage t;'
      ''
      'create table pc_outeruser as'
      'select *   from outeruser@dblink_pc_manage;'
      ''
      'create table pc_org_attr as'
      'select * from org_attr@dblink_pc_manage;'
      ''
      ''
      'create index pc_orgid_index_on_org on pc_org (orgid);'
      'create index pc_orgcode_index_on_org on pc_org (orgcode);'
      ''
      ''
      ''
      'update pc_org_relation r'
      '   set r.orgrelaid = '#39'99999999'#39
      ' where r.orgid in (select t.orgid'
      '                     from pc_org t, pc_org_relation s'
      '                    where t.orglevel = '#39'1'#39
      '                      and substr(t.orgcode, 1, 4) = '#39'E333'#39
      '                      and t.orgid = s.orgid);'
      ''
      'insert into pc_org_relation t'
      '  (t.org_relation_id, t.orgid, t.orgrelaid)'
      'values'
      '  ('#39'99999999'#39', '#39'99999999'#39', '#39'0'#39');'
      ''
      
        'update pc_org_relation t set t.orgrelaid='#39'6435'#39' where t.orgid='#39'1' +
        '33765'#39';'
      ''
      
        'update  pc_org_relation t set t.orgrelaid=0 where t.orgrelaid='#39'1' +
        '39202'#39';'
      ''
      ''
      'commit;')
    Left = 224
    Top = 40
  end
  object OraScript3: TOraScript
    SQL.Strings = (
      'create table org_temp as'
      'select cast(t.orgcode as varchar2(200)) as orgcode,'
      '       cast(t.orgname as varchar2(200)) as orgname,'
      '       cast('#39#39' as varchar2(200)) as toporgcode,'
      '       cast(t.uporgcode as varchar2(200)) as uporgcode,'
      '       cast('#39#39' as varchar2(200)) as orglevel,       '
      '       cast(t.provid as char(4)) as provid,       '
      '       cast('#39#39' as varchar2(200)) as l1code,'
      '       cast('#39#39' as varchar2(200)) as l1name,'
      '       cast('#39#39' as varchar2(200)) as l2code,'
      '       cast('#39#39' as varchar2(200)) as l2name,'
      '       cast('#39#39' as varchar2(200)) as l3code,'
      '       cast('#39#39' as varchar2(200)) as l3name,'
      '       cast('#39#39' as varchar2(200)) as l4code,'
      '       cast('#39#39' as varchar2(200)) as l4name,'
      '       cast('#39#39' as varchar2(200)) as l5code,'
      '       cast('#39#39' as varchar2(200)) as l5name,'
      '       cast('#39#39' as varchar2(200)) as l6code,'
      '       cast('#39#39' as varchar2(200)) as l6name'
      
        'from (select m.orgcode, m.orgname, p.orgcode as uporgcode,m.prov' +
        'id'
      '          from pc_org m, pc_org_relation n, pc_org p'
      '         where m.orgid = n.orgid'
      '           and p.orgid = n.orgrelaid) t;'
      ''
      ''
      ''
      'create index INDEX_ON_ORGCODE_OF_ORG_TEMP on ORG_TEMP (ORGCODE);'
      
        'create index INDEX_ON_ORGLEVEL_OF_ORG_TEMP on ORG_TEMP (ORGLEVEL' +
        ');'
      ''
      ''
      ''
      'update org_temp s'
      '   set s.toporgcode = (select t.orgcode'
      '                         from org_temp t'
      '                        where (t.uporgcode = t.orgcode)'
      '                           or (t.uporgcode is null)'
      '                           or (t.uporgcode = '#39'0'#39')'
      '                        start with t.orgcode = s.orgcode'
      
        '                       connect by prior t.uporgcode = t.orgcode)' +
        ';'
      ''
      ''
      ''
      ''
      'update org_temp t'
      '   set t.orglevel = '#39'1'#39
      
        ' where t.orgcode in (select distinct (s.toporgcode) from org_tem' +
        'p s);'
      ''
      ''
      'update org_temp t set t.l1code=t.orgcode where t.orglevel='#39'1'#39';'
      ''
      'update org_temp t'
      '   set t.orglevel = '#39'2'#39
      ' where t.uporgcode in'
      
        '       (select s.orgcode from org_temp s where s.orglevel = '#39'1'#39')' +
        ';'
      'update org_temp t'
      '   set t.orglevel = '#39'3'#39
      ' where t.uporgcode in'
      
        '       (select s.orgcode from org_temp s where s.orglevel = '#39'2'#39')' +
        ';'
      'update org_temp t'
      '   set t.orglevel = '#39'4'#39
      ' where t.uporgcode in'
      
        '       (select s.orgcode from org_temp s where s.orglevel = '#39'3'#39')' +
        ';'
      'update org_temp t'
      '   set t.orglevel = '#39'5'#39
      ' where t.uporgcode in'
      
        '       (select s.orgcode from org_temp s where s.orglevel = '#39'4'#39')' +
        ';'
      'update org_temp t'
      '   set t.orglevel = '#39'6'#39
      ' where t.uporgcode in'
      
        '       (select s.orgcode from org_temp s where s.orglevel = '#39'5'#39')' +
        ';'
      ''
      ''
      'update org_temp t set t.l6code=t.orgcode where t.orglevel='#39'6'#39';'
      ''
      'update org_temp t set t.l5code=t.orgcode where t.orglevel='#39'5'#39';'
      ''
      'update org_temp t set t.l4code=t.orgcode where t.orglevel='#39'4'#39';'
      ''
      'update org_temp t set t.l3code=t.orgcode where t.orglevel='#39'3'#39';'
      ''
      'update org_temp t set t.l2code=t.orgcode where t.orglevel='#39'2'#39';'
      ''
      'update org_temp t set t.l1code=t.orgcode where t.orglevel='#39'1'#39';'
      ''
      'update org_temp t'
      
        '   set t.l5code = (select s.uporgcode from org_temp s where t.l6' +
        'code = s.orgcode)'
      ' where t.l6code is not null;'
      ''
      'update org_temp t'
      
        '   set t.l4code = (select s.uporgcode from org_temp s where t.l5' +
        'code = s.orgcode)'
      ' where t.l5code is not null;'
      ''
      'update org_temp t'
      
        '   set t.l3code = (select s.uporgcode from org_temp s where t.l4' +
        'code = s.orgcode)'
      ' where t.l4code is not null;'
      ''
      'update org_temp t'
      
        '   set t.l2code = (select s.uporgcode from org_temp s where t.l3' +
        'code = s.orgcode)'
      ' where t.l3code is not null;'
      ''
      'update org_temp t'
      
        '   set t.l1code = (select s.uporgcode from org_temp s where t.l2' +
        'code = s.orgcode)'
      ' where t.l2code is not null;'
      ''
      ''
      'update org_temp t'
      
        '   set t.l6name = (select s.orgname from org_temp s where t.l6co' +
        'de = s.orgcode);'
      'update org_temp t'
      
        '   set t.l5name = (select s.orgname from org_temp s where t.l5co' +
        'de = s.orgcode);'
      'update org_temp t'
      
        '   set t.l4name = (select s.orgname from org_temp s where t.l4co' +
        'de = s.orgcode);'
      'update org_temp t'
      
        '   set t.l3name = (select s.orgname from org_temp s where t.l3co' +
        'de = s.orgcode);'
      'update org_temp t'
      
        '   set t.l2name = (select s.orgname from org_temp s where t.l2co' +
        'de = s.orgcode);'
      'update org_temp t'
      
        '   set t.l1name = (select s.orgname from org_temp s where t.l1co' +
        'de = s.orgcode);'
      ''
      ''
      'commit;')
    Left = 264
    Top = 40
  end
  object OraQuery4: TOraQuery
    SQL.Strings = (
      'insert into   &pc_queryrecord_tablename '
      'select'
      't.PERSONID,'
      't.PIN,'
      't.QUERYREASONCODE,'
      't.QUERYFORMATCODE,'
      't.QUERYTYPECODE,'
      't.QUERYSEGMENT,'
      't.QUERYDATE,'
      't.REPTIME,'
      't.REPNO,'
      't.USERCODE,'
      't.USERNAME,'
      'nvl(t.operorgcode, t.QUERYORGNO) as QUERYORGNO,'
      't.QUERYPIN,'
      't.REPORTURL,'
      't.RESERVED,'
      't.QUERYTYPE,'
      't.ACTUALNAME,'
      't.POLICETYPE '
      'from queryrecord@dblink_pc_manage t   '
      'where t.querydate >=:StartTime'
      'and t.querydate <:EndTime')
    Left = 432
    Top = 48
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'StartTime'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'EndTime'
        ParamType = ptInput
      end>
    MacroData = <
      item
        Name = 'pc_queryrecord_tablename'
      end>
  end
  object OraQuery6: TOraQuery
    SQL.Strings = (
      'create table &pc_queryrecord_tablename'
      '('
      '  PERSONID        NUMBER(16) not null,'
      '  PIN             NUMBER(16) not null,'
      '  QUERYREASONCODE CHAR(4) not null,'
      '  QUERYFORMATCODE NUMBER(2),'
      '  QUERYTYPECODE   NUMBER(1) not null,'
      '  QUERYSEGMENT    VARCHAR2(200),'
      '  QUERYDATE       DATE not null,'
      '  REPTIME         DATE,'
      '  REPNO           VARCHAR2(48),'
      '  USERCODE        VARCHAR2(128),'
      '  USERNAME        VARCHAR2(200),'
      '  QUERYORGNO      VARCHAR2(28),'
      '  QUERYPIN        NUMBER(16),'
      '  REPORTURL       VARCHAR2(200),'
      '  RESERVED        VARCHAR2(30),'
      '  QUERYTYPE       CHAR(2),'
      '  ACTUALNAME      VARCHAR2(60),'
      '  POLICETYPE      CHAR(2)'
      ')')
    Left = 400
    Top = 48
    MacroData = <
      item
        Name = 'PC_QUERYRECORD_tablename'
      end>
  end
  object OraScript4: TOraScript
    SQL.Strings = (
      'create table pc_certificate as'
      
        'select t.pin,t.certtype,t.certno from certificate@dblink_pc_quer' +
        'y t;'
      ''
      'create table pc_dd_certificate as'
      'select * from DD_CERTIFICATE@dblink_pc_query t;'
      ''
      ''
      
        'create index pc_certificate_index_on_pin on pc_certificate (pin)' +
        ';'
      ''
      'commit;')
    Left = 424
    Top = 112
  end
  object OraQuery3: TOraQuery
    SQL.Strings = (
      'create table FEELOG_PC_TEMP1'
      'as select t.queryorgno,'
      ' t.usercode, '
      ' t.pin, '
      ' min(t.querydate) as OrderTime '
      ' from &pc_queryrecord_tablename t'
      'where 1=0'
      'group by t.queryorgno, t.usercode, t.pin')
    Left = 392
    Top = 160
    MacroData = <
      item
        Name = 'pc_queryrecord_tablename'
      end>
  end
  object OraQuery7: TOraQuery
    SQL.Strings = (
      'insert into   feelog_pc_temp9               '
      ' select'
      ' t.orderserialnumber  as transaction_no,'
      ' t.ordertime as transaction_time,'
      ' t.rootorgcode as headquarter_orgcode,'
      't.rootorgname as headquarter_orgname,'
      't.queryorgno as branch_orgcode,'
      't.branchorgname  as branch_orgname,'
      't.branchprovince as branch_province,'
      '  t.usercode as operator_username,'
      '  '#39'PC_CR_A001'#39' as product_code,'
      '   1 as product_multiplier,'
      '    t.productlabel as product_memo_1,'
      '    t.deptname as product_memo_2,'
      't.certname as product_memo_3,'
      'cast('#39#39' as varchar2(200))as  product_memo_4,'
      'l1name,'
      'l2name,'
      'l3name,'
      'l4name,'
      'l5name,'
      'l6name'
      'from feelog_pc_temp8 t'
      '')
    Left = 440
    Top = 232
  end
  object OraQuery8: TOraQuery
    SQL.Strings = (
      'create table feelog_pc_temp9'
      '('
      '  TRANSACTION_NO      VARCHAR2(22) not null,'
      '  TRANSACTION_TIME    DATE,'
      '  HEADQUARTER_ORGCODE VARCHAR2(200),'
      '  HEADQUARTER_ORGNAME VARCHAR2(200),'
      '  BRANCH_ORGCODE      VARCHAR2(200),'
      '  BRANCH_ORGNAME      VARCHAR2(200),'
      '  BRANCH_PROVINCE     VARCHAR2(100),'
      '  OPERATOR_USERNAME   VARCHAR2(100),'
      '  PRODUCT_CODE        VARCHAR2(10),'
      '  PRODUCT_MULTIPLIER  NUMBER(10),'
      '  PRODUCT_MEMO_1      VARCHAR2(200),'
      '  PRODUCT_MEMO_2      VARCHAR2(200),'
      '  PRODUCT_MEMO_3      VARCHAR2(200),'
      '  PRODUCT_MEMO_4      VARCHAR2(200),'
      '  LEVEL1NAME          VARCHAR2(200),'
      '  LEVEL2NAME          VARCHAR2(200),'
      '  LEVEL3NAME          VARCHAR2(200),'
      '  LEVEL4NAME          VARCHAR2(200),'
      '  LEVEL5NAME          VARCHAR2(200),'
      '  LEVEL6NAME          VARCHAR2(200)'
      ')')
    Left = 360
    Top = 160
  end
end
