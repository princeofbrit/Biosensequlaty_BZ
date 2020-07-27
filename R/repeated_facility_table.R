#' Write NSSP BioSense Platform Data Quality Summary Reports for One Facility
#'
#' @description
#' This function is a lightweight version of the `write_reports` function. It will generate summary and example workbooks, but only for
#' one specified facility. The first summary workbook shows percents and counts of nulls and invalids, while the examples workbook
#' generates de tailed information on records and visits that are null or invalid.
#'
#' @param username Your BioSense username, as a string. This is the same username you may use to log into RStudio or Adminer.
#' @param password Your BioSense password, as a string. This is the same password you may use to log into RStudio or Adminer.
#' @param table The table that you want to retrieve the data from, as a string.
#' @param mft The MFT (master facilities table) from where the facility name will be retrieved, as a string.
#' @param start The start date time that you wish to begin pulling data from, as a string.
#' @param end The end data time that you wish to stop pulling data from, as a string.
#' @param facility The C_Biosense_Facility_ID for the facility that you wish to generate and write the report for.
#' @param directory The directory where you would like to write the reports to (i.e., "~/Documents/MyReports"), as a string.
#' @param nexamples An integer number of examples you would like for each type of invalid or null field in the examples workbooks for each facility.
#' This defaults to 0, which will not generate these example workbooks.

#' @export
repeated_facility_table<-function(contact,table, mft, username,password,start, end,directory,field=NA,exclude=NA,optional=T,email=F, sender,email_password,personname=NA,title=NA, phone=NA){
niter= nrow(contact)
success=NA
for (i in 1:niter){
success[i]=write_facility_report(username=username, password=password, 
                      table=table, mft=mft,
                      start=start, 
                      end=end,
                      facility=contact$facility[i],
                      directory=directory,field=field,exclude=exclude,
                      email =email, sender=sender,receiver=as.character(contact$receiver[i]),
                      email_password=email_password,personname=presonname,title=title, phone=phone)

  }
  return(cbind(contact,success))
}
