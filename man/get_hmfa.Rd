% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_hmfa.R
\name{get_hmfa}
\alias{get_hmfa}
\alias{get_hmfa_ind}
\alias{get_hmfa_var}
\alias{get_hmfa_partial}
\title{Extract the results for individuals/variables/group/partial axes - HMFA}
\usage{
get_hmfa(
  res.hmfa,
  element = c("ind", "quanti.var", "quali.var", "group", "partial.node")
)

get_hmfa_ind(res.hmfa)

get_hmfa_var(res.hmfa, element = c("quanti.var", "quali.var", "group"))

get_hmfa_partial(res.hmfa)
}
\arguments{
\item{res.hmfa}{an object of class HMFA [FactoMineR].}

\item{element}{the element to subset from the output. Possible values are
"ind", "quanti.var", "quali.var", "group" or "partial.node".}
}
\value{
a list of matrices containing the results for the active 
  individuals, variables, groups and partial nodes, including : 
  \item{coord}{coordinates} \item{cos2}{cos2} 
  \item{contrib}{contributions}
}
\description{
Extract all the results (coordinates, squared cosine and
contributions) for the active individuals/quantitative variables/qualitative
variable categories/groups/partial axes from Hierarchical Multiple Factor
Analysis (HMFA) outputs.\cr\cr \itemize{ \item get_hmfa(): Extract the
results for variables and individuals \item get_hmfa_ind(): Extract the
results for individuals only \item get_mfa_var(): Extract the results for
variables (quantitatives, qualitatives and groups) 
\item get_hmfa_partial(): Extract the results for partial.node. }
}
\examples{
# Multiple Factor Analysis
# ++++++++++++++++++++++++
# Install and load FactoMineR to compute MFA
# install.packages("FactoMineR")
library("FactoMineR")
data(wine)
hierar <- list(c(2,5,3,10,9,2), c(4,2))
res.hmfa <- HMFA(wine, H = hierar, type=c("n",rep("s",5)), graph = FALSE)
 
 # Extract the results for qualitative variable categories
 var <- get_hmfa_var(res.hmfa, "quali.var")
 print(var)
 head(var$coord) # coordinates of qualitative variables
 head(var$cos2) # cos2 of qualitative variables
 head(var$contrib) # contributions of qualitative variables
 
 # Extract the results for individuals
 ind <- get_hmfa_ind(res.hmfa)
 print(ind)
 head(ind$coord) # coordinates of individuals
 head(ind$cos2) # cos2 of individuals
 head(ind$contrib) # contributions of individuals
 
 # You can also use the function get_hmfa()
 get_hmfa(res.hmfa, "ind") # Results for individuals
 get_hmfa(res.hmfa, "quali.var") # Results for qualitative variable categories
 
}
\author{
Alboukadel Kassambara \email{alboukadel.kassambara@gmail.com}

Fabian Mundt \email{f.mundt@inventionate.de}
}
