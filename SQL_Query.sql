SELECT

--FactGLTran
gl.FactGLTranID,
gl.GLTranAmount,
gl.JournalID,
gl.GLTranDescription,
gl.GLTranDate,

--GL Accounts
acc.AlternateKey 'GLAcctNum',
acc.GLAcctName,
acc.Statement,
acc.Category,
acc.Subcategory,

--Stores
sto.AlternateKey 'StoreNum',
sto.StoreName,
sto.ManagerID,
sto.PreviousManagerID,
sto.ContactTel,
sto.AddressLine1,
sto.AddressLine2,
sto.ZipCode,

--Region
reg.AlternateKey 'RegionNum',
reg.RegionName,
reg.SalesRegionName,

--Last Refresh Date
CONVERT(datetime2, GETDATE() at time zone 'UTC' at time zone 'Central Standard Time') AS 'LastRefreshDate'

FROM FactGLTran AS gl
    INNER JOIN dimGLAcct AS acc ON gl.GLAcctID = acc.GLAcctID
    INNER JOIN dimStore AS sto ON gl.StoreID = sto.StoreID
    INNER JOIN dimRegion AS reg ON sto.RegionID = reg.RegionID