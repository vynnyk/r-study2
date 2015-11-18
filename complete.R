complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  l_all_files<-list.files(directory,full.names = TRUE)
  ##l_select_files<-l_all_files[id]
  l_data<-data.frame(id=integer(),nobs=integer())
  for (i in id) {
    l_file<-read.csv(l_all_files[i])
    l_tmp <-data.frame(id=i,nobs=nrow(l_file[which(!is.na(l_file$sulfate) & !is.na(l_file$nitrate)),]))
    l_data<-rbind(l_data,l_tmp)
  }
  l_data
  
}