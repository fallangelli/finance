object Form1: TForm1
  Left = 255
  Top = 211
  Width = 667
  Height = 518
  Caption = #20225#19994#24449#20449#31995#32479'--'#35745#36153#27169#22359
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
    Left = 20
    Top = 59
    Width = 54
    Height = 16
    Caption = #35831#36873#25321#24180'  '
  end
  object Label2: TLabel
    Left = 20
    Top = 98
    Width = 54
    Height = 16
    Caption = #35831#36873#25321#26376'  '
  end
  object Button2: TButton
    Left = 443
    Top = 30
    Width = 179
    Height = 60
    Caption = #25277#21462#26597#35810#35760#24405
    TabOrder = 1
    Visible = False
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 236
    Top = 20
    Width = 189
    Height = 50
    Caption = #25277#21462#26426#26500#20449#24687
    TabOrder = 2
    Visible = False
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 453
    Top = 197
    Width = 178
    Height = 60
    Caption = #29983#25104#35745#36153#26126#32454
    TabOrder = 3
    Visible = False
    OnClick = Button4Click
  end
  object ComboBox1: TComboBox
    Left = 108
    Top = 49
    Width = 90
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
    Left = 108
    Top = 89
    Width = 90
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
    Top = 10
    Width = 405
    Height = 444
    ScrollBars = ssVertical
    TabOrder = 6
  end
  object Button6: TButton
    Left = 30
    Top = 158
    Width = 178
    Height = 60
    Caption = #20840#37096#25191#34892
    Default = True
    TabOrder = 0
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 236
    Top = 266
    Width = 179
    Height = 50
    Caption = #23548#20986#25991#20214
    TabOrder = 7
    Visible = False
    OnClick = Button7Click
  end
  object Button5: TButton
    Left = 235
    Top = 14
    Width = 179
    Height = 60
    Caption = #25277#21462#20511#27454#20154#20449#24687
    TabOrder = 8
    Visible = False
    OnClick = Button5Click
  end
  object BitBtn1: TBitBtn
    Left = 236
    Top = 79
    Width = 189
    Height = 50
    Caption = #35831#36873#25321#26426#26500#22788#29702#25991#20214
    TabOrder = 9
    Visible = False
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 236
    Top = 197
    Width = 189
    Height = 50
    Caption = #24320#22987#35843#25972#26426#26500#20851#31995
    Enabled = False
    TabOrder = 10
    Visible = False
    OnClick = BitBtn2Click
  end
  object Edit1: TEdit
    Left = 236
    Top = 158
    Width = 189
    Height = 24
    TabOrder = 11
    Text = #36873#25321#25110#36755#20837#25991#20214#21517
    Visible = False
    OnChange = Edit1Change
  end
  object BitBtn3: TBitBtn
    Left = 246
    Top = 335
    Width = 169
    Height = 50
    Caption = 'BitBtn3'
    TabOrder = 12
    Visible = False
    OnClick = BitBtn3Click
  end
  object Edit2: TEdit
    Left = 246
    Top = 404
    Width = 169
    Height = 24
    TabOrder = 13
    Text = 'Edit2'
    Visible = False
  end
  object OraSession1: TOraSession
    Options.Direct = True
    Username = 'fpro'
    Password = '123456'
    Server = 'localhost:1521:orcl'
    Left = 416
    Top = 8
  end
  object OraQuery4: TOraQuery
    SQL.Strings = (
      'insert into &Feelog_TableName'
      '  select '
      '   USERID,               '
      '   FINANCECODE,'
      '   IP, '
      '   SUBMITDATE,'
      '   PRODUCTTYPE,'
      '   RESLUT,        '
      '   QUERYBEGINDATE,'
      '   QUERYENDDATE,     '
      '   QUERYAREACODE,       '
      '   QUERYFINANCECODE,'
      '   QUERYLOANCARDCODE,     '
      '   QUERYINVECORPBORRCODE,'
      '   QUERYCOUNTRYCODE,'
      '   QUERYREGISTRATIONNO,'
      '   QUERYGSREGISTRATIONNO,'
      '   QUERYDSREGISTRATIONNO, '
      '   QUERYCERTTYPE,'
      '   QUERYCERTNO,       '
      '   QUERYBORROWNAME,'
      '   QUERYOTHER,      '
      '   REQID,          '
      '   SEQID   '
      '    from tp_feelog@dblink_ec_query t'
      '   where t.submitdate >= :StartTime'
      '     and t.submitdate < :EndTime')
    Left = 440
    Top = 32
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
        Name = 'Feelog_TableName'
      end>
  end
  object OraQuery25: TOraQuery
    SQL.Strings = (
      '  create table EC_TP_FEELOG_TEMP5 as'
      '  select transaction_no,'
      '        transaction_time,'
      '         headquarter_orgcode,'
      '        headquarter_orgname,'
      '          branch_orgcode,'
      '         branch_orgname,'
      '         branch_province,'
      '        operator_username,'
      '         '#39'EC_CR_A001'#39' as ProductCode,'
      '         product_memo_1,'
      '         product_memo_2,'
      '         product_memo_3,'
      '         product_memo_4,'
      '         l1name,'
      '         l2name,'
      '         l3name,'
      '         l4name,'
      '         l5name,'
      '         l6name'
      ''
      '    from ec_tp_feelog_temp4 t')
    Left = 504
    Top = 192
  end
  object OraQuery24: TOraQuery
    SQL.Strings = (
      ' create table EC_TP_FEELOG_TEMP4 as '
      
        'select '#39'TSNB'#39'||to_char(s.transaction_time, '#39'YYYYMMDD'#39') || lpad(t' +
        'o_char(s.num), 10, '#39'0'#39') as transaction_no,'
      '       s.*'
      
        '  from (select rownum as num, t.* from ec_tp_feelog_temp3 t wher' +
        'e t.product_memo_3 is not null) s')
    Left = 456
    Top = 192
  end
  object OraScript1: TOraScript
    SQL.Strings = (
      
        'create index IDX_LOANCARDCODE on ec_td_enterpriseinfo  (LOANCARD' +
        'CODE);'
      
        'create index IDX_GSREGISTRATIONNO on ec_td_enterpriseinfo  (GSRE' +
        'GISTRATIONNO);'
      
        'create index IDX_INVECORPBORRCODE on ec_td_enterpriseinfo  (INVE' +
        'CORPBORRCODE);'
      
        'create index IDX_REGISTRATIONNO on ec_td_enterpriseinfo  (REGIST' +
        'RATIONNO);'
      
        'create index IDX_DSREGISTRATIONNO on ec_td_enterpriseinfo  (DSRE' +
        'GISTRATIONNO);')
    Left = 448
    Top = 96
  end
  object ConnectDialog1: TConnectDialog
    Caption = 'Connect'
    UsernameLabel = 'User Name'
    PasswordLabel = 'Password'
    ServerLabel = 'Server'
    ConnectButton = 'Connect'
    CancelButton = 'Cancel'
    Left = 448
    Top = 8
  end
  object OraQuery10: TOraQuery
    SQL.Strings = (
      'declare'
      '     i integer:=0;'
      'begin '
      
        'while i< last_day(trunc(:startTime) )-trunc(:startTime,'#39'mm'#39')+1 l' +
        'oop '
      '    insert into EC_TP_FEELOG_TEMP7'
      '    select'
      '     c.transaction_no,'
      '     c.transaction_time, '
      '     c.headquarter_orgcode,'
      '     c.headquarter_orgname,'
      '     c.branch_orgcode,'
      '     c.branch_orgname,'
      '     c.branch_province,'
      '     c.operator_username,'
      '     c.productcode,'
      '      1,'
      '     c.product_memo_1,'
      '     c.product_memo_2,'
      '     c.product_memo_3,'
      '     c.product_memo_4,'
      '     c.l1name,'
      '     c.l2name,'
      '     c.l3name,'
      '     c.l4name,'
      '     c.l5name,'
      '     c.l6name'
      '    from'
      '    ('
      '    select '
      '    a.*,'
      '    b.product_memo_1 flag '
      '    from '
      '    ('
      '    select '
      '      * '
      '      from ec_tp_feelog_temp5'
      
        '     where to_date(to_char(transaction_time,'#39'yyyy-mm-dd'#39'),'#39'yyyy-' +
        'mm-dd'#39')=to_date(to_char(:startTime,'#39'yyyy-mm-dd'#39'),'#39'yyyy-mm-dd'#39')+i'
      '    )  a,ec_tp_feelog_temp6 b'
      '      where a.product_memo_1=b.product_memo_1(+) '
      '      and a.branch_orgcode=b.branch_orgcode(+) '
      '      and a.operator_username=b.operator_username(+) ) c'
      '       where c.flag is null ; '
      ''
      '   delete from ec_tp_feelog_temp6 '
      '   where  transaction_time <:startTime+i-30;'
      '    commit;'
      ''
      'insert into ec_tp_feelog_temp6'
      '   select '
      'branch_orgcode ,'
      'operator_username,'
      'product_memo_1,'
      'transaction_time'
      'from EC_TP_FEELOG_TEMP7'
      
        'where  to_date(to_char(transaction_time,'#39'yyyy-mm-dd'#39'),'#39'yyyy-mm-d' +
        'd'#39')=to_date(to_char(:startTime,'#39'yyyy-mm-dd'#39'),'#39'yyyy-mm-dd'#39')+i;'
      'commit;'
      ''
      ''
      'i:=i+1;'
      'end loop;'
      'end;')
    Left = 488
    Top = 232
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'startTime'
        ParamType = ptInput
      end>
  end
  object OraQuery19: TOraQuery
    SQL.Strings = (
      'create table  EC_TP_FEELOG_TEMP1 as '
      '  select t.userid,'
      '         t.financecode,'
      '         t.submitdate,'
      '         t.producttype,'
      '         cast(t.queryloancardcode as varchar2(20)) as code,'
      '         cast('#39#36151#27454#21345#32534#30721#39' as varchar2(20)) as codetype'
      '    from &feelog_tablename t'
      '   where t.reslut = '#39'1'#39
      '     and t.queryloancardcode is not null')
    Left = 344
    Top = 160
    MacroData = <
      item
        Name = 'feelog_tablename'
      end>
  end
  object OraQuery12: TOraQuery
    SQL.Strings = (
      'insert into EC_TP_FEELOG_TEMP1'
      '  select t.userid,'
      '         t.financecode,'
      '         t.submitdate,'
      '         t.producttype,'
      '         cast(t.queryinvecorpborrcode as varchar2(20)) as code,'
      '         cast('#39#32452#32455#26426#26500#20195#30721#39' as varchar2(20)) as codetype'
      '    from &feelog_tablename t'
      '   where t.reslut = '#39'1'#39
      '     and t.queryloancardcode is null'
      '     and t.queryinvecorpborrcode is not null')
    Left = 376
    Top = 160
    MacroData = <
      item
        Name = 'feelog_tablename'
      end>
  end
  object OraQuery1: TOraQuery
    SQL.Strings = (
      '   insert into EC_TP_FEELOG_TEMP1'
      '     select t.userid,'
      '            t.financecode,'
      '            t.submitdate,'
      '            t.producttype,'
      '            cast(t.queryregistrationno as varchar2(20)) as code,'
      '            cast('#39#24037#21830#27880#20876#21495#39' as varchar2(20)) as codetype'
      '       from &feelog_tablename t'
      '      where t.reslut = '#39'1'#39
      '        and t.queryloancardcode is null'
      '        and t.queryinvecorpborrcode is null'
      '        and t.queryregistrationno is not null')
    Left = 408
    Top = 160
    MacroData = <
      item
        Name = 'feelog_tablename'
      end>
  end
  object OraQuery2: TOraQuery
    SQL.Strings = (
      '   insert into EC_TP_FEELOG_TEMP1'
      '     select t.userid,'
      '            t.financecode,'
      '            t.submitdate,'
      '            t.producttype,'
      
        '            cast(t.querygsregistrationno as varchar2(20)) as  co' +
        'de,'
      '           cast('#39#22269#31246#21495#39' as varchar2(20)) as codetype'
      '       from &feelog_tablename t'
      '      where t.reslut = '#39'1'#39
      '        and t.queryloancardcode is null'
      '        and t.queryinvecorpborrcode is null'
      '        and t.queryregistrationno is null'
      '        and t.querygsregistrationno is not null')
    Left = 432
    Top = 160
    MacroData = <
      item
        Name = 'feelog_tablename'
      end>
  end
  object OraQuery8: TOraQuery
    SQL.Strings = (
      'insert into EC_TP_FEELOG_TEMP1'
      '  select t.userid,'
      '         t.financecode,'
      '         t.submitdate,'
      '         t.producttype,'
      '         cast(t.querydsregistrationno as varchar2(20)) as code,'
      '         cast('#39#22320#31246#21495#39' as varchar2(20)) as codetype'
      '    from &feelog_tablename t'
      '   where t.reslut = '#39'1'#39
      '     and t.queryloancardcode is null'
      '     and t.queryinvecorpborrcode is null'
      '     and t.queryregistrationno is null'
      '     and t.querygsregistrationno is null'
      '     and t.querydsregistrationno is not null')
    Left = 464
    Top = 160
    MacroData = <
      item
        Name = 'feelog_tablename'
      end>
  end
  object OraQuery3: TOraQuery
    SQL.Strings = (
      '   create table &feelog_ec_tablename'
      '     ( TRANSACTION_NO      VARCHAR2(22),'
      '       TRANSACTION_TIME    DATE,'
      '       HEADQUARTER_ORGCODE VARCHAR2(200),'
      '       HEADQUARTER_ORGNAME VARCHAR2(200),'
      '       BRANCH_ORGCODE      VARCHAR2(200),'
      '       BRANCH_ORGNAME      VARCHAR2(200),'
      '       BRANCH_PROVINCE     VARCHAR2(100),'
      '       OPERATOR_USERNAME   VARCHAR2(100),'
      '       PRODUCT_CODE        VARCHAR2(10),'
      '       PRODUCT_MULTIPLIER  NUMBER(10),'
      '       PRODUCT_MEMO_1      VARCHAR2(200),'
      '       PRODUCT_MEMO_2      VARCHAR2(200),'
      '       PRODUCT_MEMO_3      VARCHAR2(200),'
      '       PRODUCT_MEMO_4      VARCHAR2(200),'
      '       LEVEL1NAME          VARCHAR2(200),'
      '       LEVEL2NAME          VARCHAR2(200),'
      '       LEVEL3NAME          VARCHAR2(200),'
      '       LEVEL4NAME          VARCHAR2(200),'
      '       LEVEL5NAME          VARCHAR2(200),'
      '       LEVEL6NAME          VARCHAR2(200)'
      '     )')
    Left = 456
    Top = 232
    MacroData = <
      item
        Name = 'feelog_ec_tablename'
      end>
  end
  object OraQuery20: TOraQuery
    SQL.Strings = (
      'insert into EC_TP_FEELOG_TEMP6 '
      'select * from'
      '('
      'select '
      ' branch_orgcode ,'
      ' operator_username,'
      ' product_memo_1,'
      ' transaction_time '
      ' from  &tablename1'
      ' union all '
      ' select'
      '   branch_orgcode ,'
      '   operator_username,'
      '   product_memo_1,'
      '   transaction_time '
      '   from &tablename2'
      '   ) ff'
      'where ff.transaction_time>=:StartTime-30')
    Left = 392
    Top = 232
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'StartTime'
        ParamType = ptInput
      end>
    MacroData = <
      item
        Name = 'tablename1'
      end
      item
        Name = 'tablename2'
      end>
  end
  object OpenDialog1: TOpenDialog
    Left = 208
    Top = 104
  end
  object OraQuery28: TOraQuery
    SQL.Strings = (
      'create table &Feelog_TableName'
      '  (    USERID                VARCHAR2(32),'
      '       FINANCECODE           VARCHAR2(14),'
      '       IP                    VARCHAR2(32),'
      '       SUBMITDATE            DATE,'
      '       PRODUCTTYPE           VARCHAR2(9),'
      '       RESLUT                VARCHAR2(1),'
      '       QUERYBEGINDATE        DATE,'
      '       QUERYENDDATE          DATE,'
      '       QUERYAREACODE         VARCHAR2(6),'
      '       QUERYFINANCECODE      VARCHAR2(14),'
      '       QUERYLOANCARDCODE     VARCHAR2(16),'
      '       QUERYINVECORPBORRCODE VARCHAR2(18),'
      '       QUERYCOUNTRYCODE      VARCHAR2(5),'
      '       QUERYREGISTRATIONNO   VARCHAR2(32),'
      '       QUERYGSREGISTRATIONNO VARCHAR2(60),'
      '       QUERYDSREGISTRATIONNO VARCHAR2(60),'
      '       QUERYCERTTYPE         VARCHAR2(1),'
      '       QUERYCERTNO           VARCHAR2(18),'
      '       QUERYBORROWNAME       VARCHAR2(100),'
      '       QUERYOTHER            VARCHAR2(1000),'
      '       REQID                 NUMBER(16),'
      '       SEQID                 NUMBER(16) not null'
      '   )')
    Left = 392
    Top = 32
    MacroData = <
      item
        Name = 'Feelog_TableName'
      end>
  end
  object OraScript2: TOraScript
    SQL.Strings = (
      ''
      'create table EC_TM_ORG'
      '('
      '  ORGCODE         VARCHAR2(14) not null,'
      '  ORGNAME         VARCHAR2(80) not null,'
      '  UPORG           VARCHAR2(14),'
      '  ORGTYPE         CHAR(1),'
      '  AREACODE        CHAR(6)'
      '  );'
      'insert into ec_tm_org '
      
        'select    ORGCODE,  ORGNAME,   UPORG,ORGTYPE,AREACODE  from tm_o' +
        'rg@dblink_ec_manage t  where t.recordstopflag=0;'
      ''
      'create table EC_AREACODE'
      '('
      '  AREACODE        CHAR(6) not null,'
      '  AREALEVEL       CHAR(1),'
      '  AREANAME        VARCHAR2(50),'
      '  RECORDSTARTTIME DATE,'
      '  RECORDSTOPFLAG  CHAR(1) not null,'
      '  RECORDSTOPTIME  DATE,'
      '  REMARK          VARCHAR2(500)'
      ');'
      ''
      'insert into  EC_AREACODE '
      
        'select areacode, arealevel, areaname, recordstarttime, recordsto' +
        'pflag, recordstoptime, remark'
      '  from TM_DD_AREACODE@dblink_ec_manage t'
      'where t.recordstopflag=0;'
      ''
      ''
      'create index IDX_ORGCODE on ec_tm_org  (ORGCODE);'
      'create index IDX_UPORG on ec_tm_org  (UPORG);'
      ''
      
        'update ec_tm_org t set t.uporg = null where t.uporg = '#39'6530K0100' +
        '05'#39';'
      ''
      'commit;')
    Left = 208
    Top = 24
  end
  object OpenDialog2: TOpenDialog
    Left = 208
    Top = 280
  end
  object OraQuery31: TOraQuery
    Left = 304
    Top = 280
  end
  object OraScript3: TOraScript
    SQL.Strings = (
      'create table EC_TD_ENTERPRISEINFO'
      '('
      '  LOANCARDCODE     VARCHAR2(16),'
      '  BORROWERNAMECN   VARCHAR2(128),'
      '  BORROWERNAMEEN   VARCHAR2(128),'
      '  INVECORPBORRCODE VARCHAR2(18),'
      '  REGISTRATIONNO   VARCHAR2(32),'
      '  GSREGISTRATIONNO VARCHAR2(60),'
      '  DSREGISTRATIONNO VARCHAR2(60)'
      ');'
      ''
      'INSERT INTO EC_TD_ENTERPRISEINFO'
      '   SELECT LOANCARDCODE loancardcode,'
      '          SDEPNAMEC borrowernamecn,'
      '          SDEPNAMEE borrowernameen,'
      '          SDEPORGCODE invecorpborrcode,'
      '          REGISTERCODE registrationno,'
      '          SDEPNATIONALTAXCODE gsregistrationno,'
      '          SDEPLANDTAXCODE dsregistrationno'
      '     FROM (SELECT b.LOANCARDCODE,'
      '                  b.SDEPNAMEC,'
      '                  b.SDEPNAMEE,'
      '                  b.SDEPORGCODE,'
      '                  b.REGISTERCODE,'
      '                  b.SDEPNATIONALTAXCODE,'
      '                  b.SDEPLANDTAXCODE,'
      '                    RANK ()'
      
        '                       OVER (PARTITION BY SDEPORGCODE ORDER BY O' +
        'PERATIONTIME DESC)  mm'
      '             FROM ECCS_QUERY.EC_IDENTITY@dblink_ec_eccsqy b'
      
        '            WHERE b.ABOLISHFLAG = 0 and (VALIDITYFLAG=0 or VALID' +
        'ITYFLAG=1)'
      
        '             and (b.SDEPNAMEC is not null or (b.SDEPNAMEC is nul' +
        'l and b.SDEPNAMEE is not null )))'
      '    WHERE mm = 1;'
      ''
      'UPDATE ec_td_enterpriseinfo'
      '   set borrowernamecn = borrowernameen'
      ' where borrowernamecn is null;'
      ''
      'commit;')
    Left = 384
    Top = 104
  end
  object OraScript4: TOraScript
    SQL.Strings = (
      'create table org_temp as'
      'select cast(t.orgcode as varchar2(200))  as orgcode,'
      '       cast(t.orgname as varchar2(200)) as orgname,'
      '       cast('#39#39' as varchar2(200)) as toporgcode,'
      '       cast(t.uporg  as varchar2(200))  as uporgcode,'
      '       cast(t.areacode as char(6)) as areacode,'
      '       cast('#39#39' as varchar2(200)) as orglevel,'
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
      '  from ec_tm_org t;'
      ''
      ''
      'create index INDEX_ON_ORGCODE_OF_ORG_TEMP on ORG_TEMP (ORGCODE);'
      
        'create index INDEX_ON_ORGLEVEL_OF_ORG_TEMP on ORG_TEMP (ORGLEVEL' +
        ');'
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
    Left = 248
    Top = 24
  end
  object OraScript5: TOraScript
    SQL.Strings = (
      'create table ec_tp_feelog_temp2 as'
      '  select '
      '         submitdate,'
      '         financecode,'
      '         userid,'
      '         code ,'
      '         codetype,'
      '         borrowernamecn'
      '    from '
      '         (select dd.financecode,'
      '                 dd.userid,'
      '                 dd.submitdate,'
      '                 dd.code,'
      '                 dd.codetype,'
      '                 b.borrowernamecn'
      '            from (select t.financecode,'
      '                         t.userid,'
      '                         t.code,'
      '                         t.codetype,'
      
        '                        to_date(to_char(t.submitdate,'#39'yyyymmdd'#39')' +
        ','#39'yyyymmdd'#39') day,'
      '                         min(t.submitdate) as submitdate'
      '                    from ec_product e, ec_tp_feelog_temp1 t'
      '                   where e.feeflag = '#39'1'#39
      '                     and e.validflag = '#39'1'#39
      '                     and e.product3code = t.producttype'
      '                     and t.code is not null'
      
        '                  group by t.financecode, t.userid, t.code,t.cod' +
        'etype,to_date(to_char(t.submitdate,'#39'yyyymmdd'#39'),'#39'yyyymmdd'#39') ) dd,'
      
        '                 (select  loancardcode, min(borrowernamecn) borr' +
        'owernamecn from '
      '                 ec_td_enterpriseinfo group by loancardcode)b'
      '           where b.loancardcode(+) = dd.code);'
      ''
      ''
      'update ec_tp_feelog_temp2  t set t.borrowernamecn= ('
      '              select    b.borrowernamecn'
      
        '            from  (select  invecorpborrcode, min(borrowernamecn)' +
        ' borrowernamecn from '
      
        '                 ec_td_enterpriseinfo group by invecorpborrcode ' +
        ')b'
      '           where (b.invecorpborrcode = t.code ))'
      'where t.borrowernamecn  is null;'
      ''
      ''
      'update ec_tp_feelog_temp2  t set t.borrowernamecn= ('
      '              select    b.borrowernamecn'
      
        '            from  (select  registrationno , min(borrowernamecn) ' +
        'borrowernamecn from '
      
        '                 ec_td_enterpriseinfo group by registrationno  )' +
        'b'
      '           where (b.registrationno  = t.code ))'
      'where t.borrowernamecn  is null;'
      ''
      ''
      'update ec_tp_feelog_temp2  t set t.borrowernamecn= ('
      '              select    b.borrowernamecn'
      
        '            from  (select  gsregistrationno , min(borrowernamecn' +
        ') borrowernamecn from '
      
        '                 ec_td_enterpriseinfo group by gsregistrationno ' +
        ')b'
      '           where (b.gsregistrationno   = t.code ))'
      'where t.borrowernamecn  is null;'
      ''
      ''
      'update ec_tp_feelog_temp2  t set t.borrowernamecn= ('
      '              select    b.borrowernamecn'
      
        '            from  (select  dsregistrationno , min(borrowernamecn' +
        ') borrowernamecn from '
      
        '                 ec_td_enterpriseinfo group by dsregistrationno ' +
        ')b'
      '           where (b.dsregistrationno   = t.code ))'
      'where t.borrowernamecn  is null;'
      ''
      ''
      'commit;')
    Left = 360
    Top = 192
  end
  object OraScript6: TOraScript
    SQL.Strings = (
      ' create table ec_tp_feelog_temp3 as'
      ' select '
      ' dd.submitdate transaction_time,'
      ' dd.toporgcode headquarter_orgcode,'
      ' m.orgname headquarter_orgname, '
      ' dd.orgcode branch_orgcode,'
      ' dd.orgname branch_orgname,'
      ' dd.areaname branch_province,'
      ' dd.userid operator_username,'
      ' dd.code product_memo_1,'
      ' dd.codetype product_memo_2,'
      ' dd.borrowernamecn product_memo_3,'
      ' cast('#39#39'as varchar2(200))product_memo_4,'
      'dd.l1name,'
      'dd.l2name,'
      'dd.l3name,'
      'dd.l4name,'
      'dd.l5name,'
      'dd.l6name'
      ' from'
      ' ( select'
      ' t.submitdate,'
      ' o.toporgcode,'
      ' o.orgcode,'
      ' o.orgname,'
      ' o.areaname,'
      ' t.userid,'
      ' t.code,'
      ' t.codetype,'
      ' t.borrowernamecn,'
      'o.l1name,'
      'o.l2name,'
      'o.l3name,'
      'o.l4name,'
      'o.l5name,'
      'o.l6name'
      ' from'
      
        ' ( select * from ec_tp_feelog_temp2  where borrowernamecn is not' +
        ' null and length(borrowernamecn)>3 and '
      
        'borrowernamecn  not like '#39'%'#25285#20445#65289'%'#39' and borrowernamecn not like '#39'%'#33258 +
        #28982#20154'%'#39' and borrowernamecn not like '#39'%'#25285#20445')%'#39' and borrowernamecn not ' +
        'like '#39'%'#34394#25311'%'#39' and borrowernamecn not like '#39'%'#20010#20154'%'#39' ) t,'
      '  (select b.*,a.areaname'
      'from ec_areacode a ,org_temp b'
      'where a.areacode=substr(b.areacode,1,2)||'#39'0000'#39
      'and a.recordstopflag ='#39'0'#39
      '  )'
      '   o'
      '  where t.financecode=o.orgcode(+))dd,'
      ' org_temp m'
      '  where '
      '  dd.toporgcode=m.orgcode(+) '
      '  and instr(m.orgname,'#39#20013#22269#20154#27665#38134#34892#39')=0'
      '  and m.toporgcode is not null '
      '  and m.uporgcode is null;'
      ''
      
        'create index IDX_PRODUCT_MEMO on ec_tp_feelog_temp3 (product_mem' +
        'o_1);'
      ''
      'commit;')
    Left = 408
    Top = 192
  end
  object OraQuery5: TOraQuery
    SQL.Strings = (
      ' create table EC_TP_FEELOG_TEMP6'
      '     ('
      '      BRANCH_ORGCODE      VARCHAR2(200),'
      '      OPERATOR_USERNAME   VARCHAR2(100),'
      '      PRODUCT_MEMO_1      VARCHAR2(200),'
      '      TRANSACTION_TIME    DATE    '
      '     )')
    Left = 360
    Top = 232
  end
  object OraQuery6: TOraQuery
    Left = 304
    Top = 168
  end
  object OraQuery7: TOraQuery
    SQL.Strings = (
      '   create table EC_TP_FEELOG_TEMP7'
      '     ( TRANSACTION_NO      VARCHAR2(22),'
      '       TRANSACTION_TIME    DATE,'
      '       HEADQUARTER_ORGCODE VARCHAR2(200),'
      '       HEADQUARTER_ORGNAME VARCHAR2(200),'
      '       BRANCH_ORGCODE      VARCHAR2(200),'
      '       BRANCH_ORGNAME      VARCHAR2(200),'
      '       BRANCH_PROVINCE     VARCHAR2(100),'
      '       OPERATOR_USERNAME   VARCHAR2(100),'
      '       PRODUCT_CODE        VARCHAR2(10),'
      '       PRODUCT_MULTIPLIER  NUMBER(10),'
      '       PRODUCT_MEMO_1      VARCHAR2(200),'
      '       PRODUCT_MEMO_2      VARCHAR2(200),'
      '       PRODUCT_MEMO_3      VARCHAR2(200),'
      '       PRODUCT_MEMO_4      VARCHAR2(200),'
      '       LEVEL1NAME          VARCHAR2(200),'
      '       LEVEL2NAME          VARCHAR2(200),'
      '       LEVEL3NAME          VARCHAR2(200),'
      '       LEVEL4NAME          VARCHAR2(200),'
      '       LEVEL5NAME          VARCHAR2(200),'
      '       LEVEL6NAME          VARCHAR2(200)'
      '     )')
    Left = 424
    Top = 232
  end
  object OraQuery9: TOraQuery
    SQL.Strings = (
      'insert into &feelog_ec_tablename'
      'select '
      'TRANSACTION_NO,'
      'TRANSACTION_TIME,'
      'HEADQUARTER_ORGCODE,'
      'HEADQUARTER_ORGNAME,'
      'BRANCH_ORGCODE,'
      'BRANCH_ORGNAME,'
      'BRANCH_PROVINCE,'
      'OPERATOR_USERNAME,'
      'PRODUCT_CODE,'
      'PRODUCT_MULTIPLIER,'
      'PRODUCT_MEMO_1,'
      'PRODUCT_MEMO_2,'
      'PRODUCT_MEMO_3,'
      'PRODUCT_MEMO_4,'
      'LEVEL1NAME,'
      'LEVEL2NAME,'
      'LEVEL3NAME,'
      'LEVEL4NAME,'
      'LEVEL5NAME,'
      'LEVEL6NAME'
      'from'
      '('
      'select'
      'TRANSACTION_NO,'
      'TRANSACTION_TIME,'
      'HEADQUARTER_ORGCODE,'
      'HEADQUARTER_ORGNAME,'
      'BRANCH_ORGCODE,'
      'BRANCH_ORGNAME,'
      'BRANCH_PROVINCE,'
      'OPERATOR_USERNAME,'
      'PRODUCT_CODE,'
      'PRODUCT_MULTIPLIER,'
      'PRODUCT_MEMO_1,'
      'PRODUCT_MEMO_2,'
      'PRODUCT_MEMO_3,'
      'PRODUCT_MEMO_4,'
      'LEVEL1NAME,'
      'LEVEL2NAME,'
      'LEVEL3NAME,'
      'LEVEL4NAME,'
      'LEVEL5NAME,'
      'LEVEL6NAME,'
      
        'row_number() over(partition by headquarter_orgcode,product_memo_' +
        '3 order by transaction_time) rank'
      'from '
      '(select *'
      'from ec_tp_feelog_temp7'
      'union all'
      'select '
      '*'
      'from &tablename1)'
      ''
      ')'
      'where rank=1  and TRANSACTION_TIME>:StartTime')
    Left = 360
    Top = 272
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'StartTime'
        ParamType = ptInput
      end>
    MacroData = <
      item
        Name = 'feelog_ec_tablename'
      end
      item
        Name = 'tablename1'
      end>
  end
end
