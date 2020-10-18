New.ArgSet.LTValu <- function() {
   object <- ArgSet.PPM(
      valuDate = as.Date("2020-12-31"),
      mortAssump = "MortAssump.LTValu",
      lapseAssump = "LapseAssump.LTValu",
      expnsAssump = "ExpnsAssump.LTValu",
      intrAssump = "IntrAssump.LTValu",
      applyMortMargin = TRUE,
      applyLapseMargin = TRUE,
      applyExpnsMargin = TRUE,
      applyIntrMargin = TRUE
   )
}

New.Model.LTValu <- function() {
   object <- Model.PPM(args = "ArgSet.LTValu")
   return(object)
}