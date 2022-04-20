# Acromanteau

In [a blog post in 2005](https://github.com/bmotz/acromanteau/blob/main/Zimmer_From_Nabisco_to_NaNoWriMo_2005.pdf), [Ben Zimmer](https://en.wikipedia.org/wiki/Ben_Zimmer) proposed a category of words called "acroblends" which share properties of both acronyms and portmaneaus.  For example, Nabisco (National Biscuit Company) is not _strictly_ an acronym because it uses more than just the initial letter of each constituent word, but it also feels more structured than a [portmanteau](https://en.wikipedia.org/wiki/Portmanteau).  Later, in [a blog post in 2013](https://github.com/bmotz/acromanteau/blob/main/Zwicky_The_dobro_2013.pdf), Arnold Zwicky proposed the word "acromanteau" to be a better label for this category of words.  I agree, and as best I can tell, Zwicky is the first person to use the word "acromanteau" on the internet, although it was independently invented by [Rick Hullinger](https://rhullinger.psych.indiana.edu/) in an email thread that motivated the current repository.

This repository contains a script for identifying words whose letters are ordered constituents of a larger set of words.  For example, I propose that [Terracotta is an acromanteau for Tool for Educational Research with RAndomized COnTrolled TriAls](https://terracotta.education).  

Here's the script: [acromanteau.R](https://github.com/bmotz/acromanteau/blob/main/acromanteau.R)

Usage:

```R
# Clean-up
rm(list=ls())

source('acromanteau.R')

# Words to Test
testwords <- c('random','word','alloy')
# Minimum length of matching portmanteaus
minlength <- 5
# Restrict order of test words?
restrict <- FALSE

output <- acromanteau(testwords,minlength,restrict)
```
