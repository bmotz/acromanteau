# Acromanteau.R
#
# Function for identifying acromanteaus
# https://github.com/bmotz/acromanteau
#
# Example Usage:
# 
# source('acromanteau.R')
#
# # Words to Test
# testwords <- c('random','word','alloy')
# # Minimum length of matching acromanteaus
# minlength <- 5
# # Restrict order of test words?
# restrict <- FALSE
# 
# output <- acromanteau(testwords,minlength,restrict)
#
# Output is a dataframe where every row is a matching acromanteau
# Note: output is restricted to the first-identified ordering of 
# testwords that fit a match. 

acromanteau <- function(testwords,minlength,restrict){
  
  require(combinat)
  require(words)
  
  # Put testwords in lowercase
  testwords <- tolower(testwords)
  
  if (restrict) {
    permwords <- list(testwords)
  } else {
    # Create all permutations
    permwords <- permn(testwords)
  }
  
  # initialize output
  output <- data.frame(match=character(),
                       matchlength=integer(),
                       testwords=character())
  
  # initialize the progress bar
  pb <- txtProgressBar(min = 0,           # Minimum value of the progress bar
                       max = nrow(words), # Maximum value of the progress bar
                       style = 3,         # Progress bar style (also available style = 1 and style = 2)
                       width = 50,        # Progress bar width. Defaults to getOption("width")
                       char = "=")        # Character used to create the bar
  
  #tic <- Sys.time()
  for (w in 1:nrow(words)) {
    # test word
    test <- words[w,1]
    # if test word is <= 3 letters, don't bother
    if (words[w,2] < minlength) {
      next
    }
    # turn test word into grep pattern
    pattern <- paste(gsub("*","\\\\D*",test))
    pattern <- substr(pattern,4,nchar(pattern))
    # have we got one with this word yet 
    gotone <- FALSE
    for (i in 1:length(permwords)) {
      # collapse this arrangement of words
      collapsed <- paste(permwords[[i]],collapse='')
      # test it
      # first letter must match
      if (substr(pattern,1,1)==substr(collapsed,1,1)) {
        # make sure there's not an identity relationship with any word
        if (!is.element(test,testwords)) {
          # do a pattern match
          if (grepl(pattern=pattern,collapsed)) {
            # store details
            output[nrow(output)+1,] <- c(test,words[w,2],collapsed)
            gotone <- TRUE
          }
        }
      }
      # if we've got one for this word, move on
      if (gotone) {
        break
      }
    }
    setTxtProgressBar(pb, w)
  }
  
  # Format testwords in output so that the acromanteau match is capitalized
  for (r in 1:nrow(output)) {
    match <- output$match[r]
    testwords <- output$testwords[r]
    for (i in 1:nchar(testwords)) {
      if (substr(match,1,1) == substr(testwords,i,i)) {
        testwords <- paste(substr(testwords,1,i-1),toupper(substr(testwords,i,i)),substr(testwords,i+1,nchar(testwords)),sep = "")
        match <- substr(match,2,nchar(match))
      }
    }
    output$testwords[r] <- testwords
  }
  #toc <- Sys.time()
  #difftime(toc,tic)
  
  # Order the output by the acromanteau's length
  output$matchlength <- as.numeric(output$matchlength)
  output <- output[order(-output$matchlength),]
  
  return(output)
}
