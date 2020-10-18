# LTValuation
A sample project of valuation for level term policies.

## Objective

The objective of this project is to demonstrate how to create a valuation project and run valuation using policy premium method for a block of level term policies.

This block consists of 200 policies with 20-year level term insurance and 200 policies with level term to age 65 insurance

## Prerequisite

You must install `Rgogo` package and Canadian mortality table package `MortTables.CA` before using this sample project.  You can download these packages with the following commands if you have not done so:

```R
library(devtools)
install_github(repo = "ActPersp/Rgogo")
install_github(repo = "ActPersp/MortTables.CA")
```

## Modifying Model

You can make changes to the model by modifying any R script files under "R" subfolers.  

Each R script file under "R" subfolder represents a model component:

| File Name | Model Component |
| --- | --- |
| Plan.LT20.R | 20-year level term product features |
| Plan.LT65.R | Level term to age 65 product features |
| MortAssump.R | Mortality assumption |
| LapseAssump.R | Lapse assumption |
| IntrAssump.R | Interest rate assumption |
| ExpnsAssump.R | Expense assumption |
| Model.R| Model for policy premium method valuation |

## Deploying Model

Every time you make any change to the above files, you must deploy the project by executing the following commands before running the model.

```R
Rgogo::DeployProject("LTPricing", overwrite = TRUE)
```

## Running Model

To build the package, click RStudio menu items: Build > Install and Restart.

There are three scrip files under "batch" subfolder:
#### 1. Step_1_Import_Data.R

The scripts import seriatim policy data from an Excel file under "data-raw" subfolder, and save them to a valuation database.

You do not have to run this every time.  The scripts will encounter error if the database file "db/LTValuation.db" already exists.  If you want to re-create database, you need to manually delete the database file before running the scripts.

#### 2. Step_2_Run_Valuation.R

The scripts carry out valuation calculation and save seriatim reserves and cash flows to valuation database.

#### 3. Step_3_Summarize_Results.R

The scripts summarize reserves and cash flows, and export to an Excel file under "export" subfolder.




