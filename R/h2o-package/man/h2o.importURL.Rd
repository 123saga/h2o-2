\name{h2o.importURL}
\alias{h2o.importURL}
\title{
Import Data from URL
}
\description{
Imports a file from the URL and parses it, returning an object containing the identifying hex key.
}
\usage{
h2o.importURL(object, path, key = "", parse = TRUE, header, header_with_hash, sep = "",
              col.names, parser_type="AUTO")
}

\arguments{
  \item{object}{
An \code{\linkS4class{H2OClient}} object containing the IP address and port of the server running H2O.
}
  \item{path}{
The complete URL of the file to be imported. Each row of data appears as one line of the file.
}
  \item{key}{
(Optional) The unique hex key assigned to the imported file. If none is given, a key will automatically be generated based on the URL path.
}
\item{parse}{
(Optional) A logical value indicating whether the file should be parsed after import.
  }
    \item{header}{
(Optional) A logical value indicating whether the first row is the column header. If missing, H2O will automatically try to detect the presence of a header.
  }
     \item{header_with_hash}{
(Optional) A logical value indicating whether the first row is a column header that begins with a hash character. If missing, H2O will automatically try to detect the presence of a header.
  }
  \item{sep}{
(Optional) The field separator character. Values on each line of the file are separated by this character. If \code{sep = ""}, the parser will automatically detect the separator.
  }
  \item{col.names}{
(Optional) A \code{\linkS4class{H2OParsedData}} object containing a single delimited line with the column names for the file.
  }
  \item{parser_type}{
  (Optional) Specify the type of data to be parsed. parser_type = "AUTO" is the default, other acceptable values are "SVMLight", "XLS", and "CSV".
    }
}
\details{
WARNING: In H2O, import is lazy! Do not modify the data on hard disk until after parsing is complete.
}
\value{
If \code{parse = TRUE}, the function returns an object of class \code{\linkS4class{H2OParsedData}}. Otherwise, when \code{parse = FALSE}, it returns an object of class \code{\linkS4class{H2ORawData}}.
}
\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{h2o.importFile}, \link{h2o.importFolder}, \link{h2o.importHDFS}, \link{h2o.uploadFile}}
}
\examples{
\dontrun{
library(h2o)
localH2O = h2o.init()
prostate.hex = h2o.importURL(localH2O, path = paste("https://raw.github.com", 
  "h2oai/h2o/master/smalldata/logreg/prostate.csv", sep = "/"), key = "prostate.hex")
class(prostate.hex)
summary(prostate.hex)
}
}
