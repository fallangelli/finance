object ConnectForm: TConnectForm
  Left = 368
  Top = 255
  ActiveControl = edUsername
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Connect'
  ClientHeight = 175
  ClientWidth = 291
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel: TPanel
    Left = 8
    Top = 8
    Width = 273
    Height = 121
    BevelInner = bvRaised
    BevelOuter = bvLowered
    FullRepaint = False
    TabOrder = 0
    object lbUsername: TLabel
      Left = 16
      Top = 20
      Width = 73
      Height = 13
      AutoSize = False
      Caption = 'Username'
      Layout = tlCenter
    end
    object lbPassword: TLabel
      Left = 16
      Top = 54
      Width = 73
      Height = 13
      AutoSize = False
      Caption = 'Password'
      Layout = tlCenter
    end
    object lbServer: TLabel
      Left = 16
      Top = 88
      Width = 73
      Height = 13
      AutoSize = False
      Caption = 'Server'
      Layout = tlCenter
    end
    object edUsername: TEdit
      Left = 104
      Top = 16
      Width = 153
      Height = 21
      MaxLength = 32767
      TabOrder = 0
    end
    object edPassword: TEdit
      Left = 104
      Top = 50
      Width = 153
      Height = 21
      MaxLength = 32767
      PasswordChar = '*'
      TabOrder = 1
    end
    object edServer: TComboBox
      Left = 104
      Top = 84
      Width = 153
      Height = 21
      DropDownCount = 10
      ItemHeight = 13
      TabOrder = 2
    end
  end
  object btConnect: TButton
    Left = 52
    Top = 141
    Width = 89
    Height = 25
    Caption = 'Connect'
    Default = True
    TabOrder = 1
    OnClick = btConnectClick
  end
  object btCancel: TButton
    Left = 148
    Top = 141
    Width = 89
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 2
  end
end
