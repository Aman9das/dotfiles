## Default CRAN repo
local({
  r <- getOption("repos")
  r["CRAN"] <- "https://cran.r-project.org"
  options(repos = r)
})

# set scientific notation
options(scipen = 200)
# options(prompt = "R⟩ ")

# silent load the packages
silentLoad <- function(p) {
  suppressWarnings(suppressPackageStartupMessages(library(p, character.only = TRUE)))
}

# At session startup
.First <- function() {
  silentLoad("tidyverse")
}

# At session end
.Last <- function() {
  cat("Goodbye!\n")
}
