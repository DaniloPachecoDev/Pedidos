object DAOFDConn: TDAOFDConn
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 338
  Width = 405
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    LoginPrompt = False
    Transaction = FDTransaction
    UpdateTransaction = FDTransaction
    Left = 152
    Top = 80
  end
  object FDQuery: TFDQuery
    Connection = FDConnection
    Left = 152
    Top = 144
  end
  object FDTransaction: TFDTransaction
    Connection = FDConnection
    Left = 144
    Top = 216
  end
end
