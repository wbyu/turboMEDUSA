\name{summarizeTurboMEDUSA}
\alias{summarizeTurboMEDUSA}
\title{
MEDUSA: Modeling Evolutionary Diversification Using Stepwise AIC
}
\description{
Summarize results from a \code{\link{runTurboMEDUSA}} analysis.
}
\usage{
summarizeTurboMEDUSA(results, modelNum = NULL, cutoff = "threshold", criterion = "aicc",
	plotTree = TRUE, time = TRUE, node.labels = TRUE, cex = 0.5, plotSurface = FALSE,
	printTitle = TRUE, n.points = 100, ...)
}

\arguments{
  \item{results}{
The list produced from a \code{\link{runTurboMEDUSA}} analysis.
}
  \item{modelNum}{
Optional. An integer indicating which model in \code{results} should be summarized. This is only useful if one wants to summarize a suboptimal model (i.e. not the best \code{criterion} or \code{cutoff} model; see below).
}
  \item{cutoff}{
Determines the increase in \code{criterion} score (see below) that is considered significant i.e. is used in determining the optimal size of model. The default is \code{cutoff="threshold"}; this is a predetermined threshold that is a function of the number of tips in the phylogeny. This relationship was determined via simulation. Alternatively, a numeric value can be passed in as the cutoff. In either case, the program selects the smallest model where \code{criterion(model_i - model_i-1) > threshold}
}
  \item{criterion}{
The statistical criterion used to determine whether larger models fit the data significantly better. Options are \code{criterion="aicc"} (default) or \code{criterion="aic"}. The default is strongly advised, as for some trees AIC can continue to improve well after AICc has deteriorated.
}
  \item{plotTree}{
Boolean value that determines whether the (possibly pruned) tree is plotted. If \code{plotTree=TRUE} (the default) the tree is plotted with edges coloured according to which piecewise model they belong to, and positions (nodes) of break points are potentially indicated (see \code{node.labels} below). 
}
  \item{time}{
Boolean value that indicates whether a timescale is printed below the tree. Only has meaning if \code{plotTree=TRUE}. For large trees it might be desirable to set \code{time=FALSE} to make tip labels legible.
}
  \item{node.labels}{
Boolean value that indicates whether node breaks are plotted on the tree. Only has meaning if \code{plotTree=TRUE}.
}
  \item{cex}{
Specifies the font size for printing tip labels. Default is \code{cex=0.5}; may need to decrease for larger trees. Only has meaning if \code{plotTree=TRUE}.
}
  \item{plotSurface}{
Boolean value that indicates whether likelihood surface(s) for the selected piecewise model is plotted. If \code{plotSurface=TRUE} the optimal model is evaluated from 1e-10 to 1 at \code{n.points} (see below), and contours are plotted. Default is no plot. 
}
  \item{printTitle}{
Whether to print titles on surface plots. 
}
  \item{n.points}{
The number of values between 1e-10 and 1 for each of r and epsilon to evaluate the selected piecewise model (hence, a total of \code{n.points} x \code{n.points} parameter combinations considered). A greater value of \code{n.points} gives better resolution of the surface, but comes with a computational burden. Default is \code{n.points=100}. Only has meaning if \code{plotSurface=T}.
}
  \item{\dots}{
Potential additional arguments for plotting etc.
}
}

\value{
Returned list has elements:
\item{$z}{A matrix listing branch times and richnesses, coded by model membership.}
\item{$mm}{Colour-coding for edges.}
\item{$break.point}{The position in the tree where shifts in models occur.}
\item{$phy}{The tree.}
}

\references{
Alfaro, ME, F Santini, C Brock, H Alamillo, A Dornburg, DL Rabosky, G Carnevale, and LJ Harmon. 2009. Nine exceptional radiations plus high turnover explain species diversity in jawed vertebrates. \emph{Proceedings of the National Academy of Sciences} \bold{106}: 13410-13414.
}

\author{
Joseph W. Brown, Richard G. FitzJohn, Michael E. Alfaro, and Luke J. Harmon.

Maintainer: Joseph W. Brown <josephwb@uidaho.edu>}

\seealso{
\code{\link{runTurboMEDUSA}}
\code{\link{plotPrettyTree}}
}