## Prog 3 - Part 4

rankall <- function(out, num ="best") {
 
  ## Read outcome data
  
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  validoutcomes <- c("heart attack", "heart failure", "pneumonia")
  
  states <- outcome$State
  validstates <- unique(states)
  ##print(validstates)
  
  ## Check that outcome and ranking are valid
  
    
    if (any(validoutcomes == out)){
       ##print ("outcome is valid")
    }
    else {
        stop ("invalid outcome")
    }
    
    validnum<- 1:nrow(outcome)
    if (num == "best" | num == "worst" | any(validnum == num)){
       ##print ("num is valid rank")
    }
    else{
      ##print (paste (num, " : not a valid number", sep = ""))
    }
  
    
  
  ## All parameters are good -- let's get started
  ## get specifiec ranking for each state
  
  savesplit <- split(outcome, outcome$State)    ## split data by states
  numstates <- length(validstates)
  ##print (numstates)
  numtimes <- 0
  for (i in 1:numstates){
      numtimes <- numtimes + 1
      ##print(numtimes)
      state <- validstates[i]
  
      stateoutcome <- savesplit[[state]]   ## hardcode for now
      ##print(state)
      numhospitals <- nrow(stateoutcome)
      ##print(numhospitals)
      ## print(stateoutcome)
  
     ## if (out == "pneumonia"){
     ## if (out == "heart attack"){
     if (out == "heart failure"){
        ##mortalityPn <- stateoutcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
        ##mortalityHA <- stateoutcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
       ##mortalityHF <- stateoutcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
       orderedlist <- stateoutcome[order(stateoutcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure,stateoutcome$Hospital.Name), ]
      if (state == "AL") {
        print(orderedlist[1:10,5:20])
      }
        
     if ( num == "best"){
        index <- which.min(mortalityPn)
        hospital <- stateoutcome$"Hospital.Name"[index]
        if (numtimes == 1){
            hospitalandstate <- c(hospital, state)
            
        }
        else {
            ##hospitalandstate <- rbind.data.frame(hospitalandstate, c(hospital, state))
          hospitalandstate <- rbind.data.frame(hospitalandstate, c(hospital, state))
            
        }
    }
    else if (num == "worst"){
      index <- which.max(mortalityPn)
      hospital <- stateoutcome$"Hospital.Name"[index]
      if (numtimes == 1){
        hospitalandstate <- c(hospital, state)
        ##print(hospitalandstate)
              
      }
      else if (numtimes > 1){
        hospitalandstate <- rbind(hospitalandstate, c(hospital, state))
        colnames(hospitalandstate) <- c( "hospital", "state")
        
      } 
    }
    else{
      if (num <=  numhospitals){
          index <- num
          hospital <- orderedlist$"Hospital.Name"[index]
          if (numtimes == 1){
            hospitalandstate <- c(hospital, state)
            ##print(hospitalandstate)
            
          }
          else if (numtimes > 1){
            hospitalandstate <- rbind(hospitalandstate, c(hospital, state))
            colnames(hospitalandstate) <- c( "hospital", "state")
            ##print(hospitalandstate)
            
          }
      
      }
      else{
          ## exclude state
        ##print("number of hospitals less than rank")
        ##print(state)
      }
    }
  }
}
dframe<-data.frame(hospitalandstate)
return(dframe)

  ## Return hospital name in that state with lowest 30-day death
  ## rate
  
##  hospital <- orderedlist$"Hospital.Name"[index]
##  hospital
##  hospitalandstate <- c(hospital, state)
  
} 
  
  
  
## rankall ("pneumonia", "worst")
