New.MortAssump.LTValu <- function() {
   object <- MortAssump(
      mortTable = c(M = "Mort.CIA8692L.M", F = "Mort.CIA8692L.F"),
      mortTableMult = 0.9,
      mortPfad = 10
   )
   return(object)
}