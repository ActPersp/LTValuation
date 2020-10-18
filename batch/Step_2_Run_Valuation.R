# Before running the script below, make sure to click RStudio menu items: Build > Install and Restart
# The scripts below run seriatim valuation.

library(Rgogo)
library(MortTables.CA)
library(LTValuation)

rm(list = ls())
dbDrvr <- packageDescription(pkg = "LTValuation", fields = "RGG_DbConnDriver")
dbConnArgs <- packageDescription(pkg = "LTValuation", fields = "RGG_DbConnArgs")

# Read coverage data from valuation database
conn <- ConnectDb(dbDrvr, dbConnArgs)
df <- ReadTable.Cov(conn)
DisconnectDb(conn)
covList <- as.CovList(df)

# Create valuation batch job
job <- Job.Valuation(
   inpVars = covList,
   dispatcher = function(inpVar) {
      return(Model.LTValu)
   },
   dbDrvr,
   dbConnArgs,
   maxProjYears = 20,
   dbAppend = FALSE,
   id = "Demo"
)

# Run valuation job: choose from one of the following run mode:
RunParallel(job)    # Run with multiple cores
#Run(job)    # Run with single cores

