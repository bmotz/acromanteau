# Acromanteau

In [a blog post in 2005](https://github.com/bmotz/acromanteau/blob/main/Zimmer_From_Nabisco_to_NaNoWriMo_2005.pdf), [Ben Zimmer](https://en.wikipedia.org/wiki/Ben_Zimmer) proposed a category of words called "acroblends" which share properties of both acronyms and portmaneaus.  For example, [Terracotta](https://terracotta.education) (for "Tool for Educational Research with RAndomized COnTrolled TriAls") is not _strictly_ an acronym because it uses more than just the initial letter of each constituent word, but it's also not strictly a [portmanteau](https://en.wikipedia.org/wiki/Portmanteau), because "Terracotta" doesn't mean anything about experimental education research (whereas "smog" clearly means smoke+fog).  Later, in [a blog post in 2013](https://github.com/bmotz/acromanteau/blob/main/Zwicky_The_dobro_2013.pdf), Arnold Zwicky proposed the word "acromanteau" to be a better label for this category of words.  I agree, and as best I can tell, Zwicky is the first person to use the word "acromanteau" on the internet, although it was independently invented by [Rick Hullinger](https://rhullinger.psych.indiana.edu/) in an email thread that motivated the current repository.

This repository contains a script for identifying words whose letters are ordered constituents of a larger set of words.  

Here's the script: [acromanteau.R](https://github.com/bmotz/acromanteau/blob/main/acromanteau.R)

Usage:

```R
# Clean-up
rm(list=ls())

# If you've downloaded the script to your local working directory:
# source('acromanteau.R')
# Or source directly from online GitHub repository:
source('https://raw.githubusercontent.com/bmotz/acromanteau/main/acromanteau.R')

# Words to Test
testwords <- c('random','word','alloy')
# Minimum length of matching acromanteaus
minlength <- 5
# Restrict order of test words?
restrict <- FALSE

output <- acromanteau(testwords,minlength,restrict)
```
