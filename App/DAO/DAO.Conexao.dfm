object DM: TDM
  Height = 480
  Width = 640
  object Cnn: TFDConnection
    Params.Strings = (
      'Database=DexianDB'
      'User_Name=dexian_usr'
      'Password=Dexian123!'
      'Server=DESKTOP-D7HQNVE\SQLEXPRESS'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 40
    Top = 32
  end
  object MSSQLDriver: TFDPhysMSSQLDriverLink
    Left = 128
    Top = 32
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = Cnn
    Left = 264
    Top = 184
  end
end
