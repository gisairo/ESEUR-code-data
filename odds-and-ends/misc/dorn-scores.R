#
# dorn-scores.R,  8 Apr 20
# Data from:
# A General Software Readability Model
# Jonathan Dorn
#
# Example from:
# Evidence-based Software Engineering: based on the publicly available data
# Derek M. Jones
#
# TAG experiment_human source-code_readability

source("ESEUR_config.r")


library("prefmod")


dorn=read.csv(paste0(ESEUR_dir, "odds-and-ends/dorn-scores.csv.xz"), as.is=TRUE)

num_answers=apply(dorn, 1, function(X) length(which(!is.na(X)))-1)

ratings=subset(dorn[, -1], num_answers == 20)


sal = pattL.fit(ratings, nitems = ncol(ratings), resptype="rating")

# Error in rep.int(rep.int(seq_len(nx), rep.int(rep.fac, nx)), orep) : 
#   invalid 'times' value

# sal = patt.design(ratings, nitems = ncol(ratings), resptype="rating")


