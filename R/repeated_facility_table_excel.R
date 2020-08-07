#' @description
#' This function uses excel file as input to produce
#' @import dplyr
#' @import tidyr
#' @import readxl

repeated_facility_bo_excel <- function(input, contact){
  Input <- read_excel(input, col_names = FALSE)
  
  username <- as.character(Input[1,2])
  password <- as.character(Input[2,2])
  table <- as.character(Input[3,2])
  mft <- as.character(Input[4,2])
  start <- as.POSIXct(as.numeric(Input[5,2] ) *(60*60*24),origin= '1899-12-30')  
  end <- as.POSIXct(as.numeric(Input[6,2] ) *(60*60*24),origin= '1899-12-30')  

  directory <- as.character(Input[8,2])
  field <- ifelse(is.na(Input[9,2]),NA, as.character(Input[9,2]))
  exclude <- ifelse(is.na(Input[10,2]),NA, as.character(Input[10,2]))
  email <-as.logical (Input[11,2])
  sender<-as.character(Input[12,2])
  email_password <-as.character(Input[13,2])
  
  personname<-as.character(Input[15,2])
  title<- as.character(Input[16,2])
  phone<- as.character(Input[17,2])
  
  repeated_facility_table(contact=contact, username=username, password=password, 
                        table=table, mft=mft,
                        start=start, 
                        end=end,
                        directory=directory,field=field,exclude=exclude,
                        email =email, sender=sender,
                        email_password=email_password,personname=personname,title=title, phone=phone)
}