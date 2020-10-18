library(RSQLite)
library(Rgogo)
library(dplyr)
library(openxlsx)


# Read seriatim valuation results and cash flows from database and save them as data.frame
dbDrvr <- packageDescription(pkg = "LTValuation", fields = "RGG_DbConnDriver")
dbConnArgs <- packageDescription(pkg = "LTValuation", fields = "RGG_DbConnArgs")
conn <- ConnectDb(dbDrvr, dbConnArgs)
dfValuSumm <- dbReadTable(conn, "ValuSumm")
dfCf <- dbReadTable(conn, "Cf")
DisconnectDb(conn)


# Summary valuation results by PlanId
dfResSummary <- dfValuSumm %>% 
   group_by(PlanId) %>%
   summarise(
      PolCount = n(),
      GrossRes = sum(GrossRes),
      NetRes = sum(NetRes),
      PVPrem = sum(PVPrem),
      PVComm = sum(PVComm),
      PVOvrd = sum(PVCommOvrd),
      PVBenDth = sum(PVBenDth),
      PVExpnsMnt = sum(PVExpnsMnt)
   )


# Summarize cash flows
dfCfSummary <- dfCf %>% 
   group_by(Timeline) %>%
   summarise(
      Prem = sum(Prem),
      Comm = sum(Comm),
      Ovrd = sum(CommOvrd),
      BenDth = sum(BenDth),
      ExpnsMnt = sum(ExpnsMnt),
      TotalNet = sum(TotalNet)
   )


# Export reserve and cash flow summaries to Excel file
library(openxlsx)
wb <- createWorkbook()
sht <- addWorksheet(wb, "ResSummary")
writeDataTable(wb, sht, dfResSummary)
sht <- addWorksheet(wb, "CfSummary")
writeDataTable(wb, sht, dfCfSummary)
saveWorkbook(wb, "export/LTValuation.xlsx", overwrite = TRUE)




