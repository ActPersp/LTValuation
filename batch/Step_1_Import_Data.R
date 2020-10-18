# The scripts below do the following two things:
#     1. Create valuation database;
#     2. Import valuation data from Excel and store them in valuation database.
# You do not have to run this every time when you re-run valuation.
# If you want to re-create database by re-run the scripts below, manually delete the database file under "db" subfolder first.

# Create valuation database
library(Rgogo)
conn <- ConnectDb(
   object = packageDescription(pkg = "LTValuation", fields = "RGG_DbConnDriver"),
   args = packageDescription(pkg = "LTValuation", fields = "RGG_DbConnArgs")
)
CreateTable.Cov(conn)
CreateTable.ValuSumm(conn)
CreateTable.Cf(conn)


# Import valuation data and save them to database.
covData <- readxl::read_excel(path = "data-raw/CovData.xlsx", sheet = "Sheet1")
WriteTable.Cov(conn, covData, colExpandable = TRUE)


# Close database connection
DisconnectDb(conn)

