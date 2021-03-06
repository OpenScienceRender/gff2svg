#! /usr/bin/Rscript

args <- commandArgs()
url <- args[-(1:match("--args", args))]

## url <- "https://raw.githubusercontent.com/OpenScienceRender/gff2svg/master/data/my.gffdiff"

stopifnot(require("rtracklayer"))
stopifnot(require("ggbio"))

download.file(url, destfile = "gffdiff.tmp", method = "wget")

gffls0 <- readLines("gffdiff.tmp")
gffls <- paste0(dirname(url), "/", gffls0)

sapply(gffls, function(f)
       download.file(f, dest = basename(f), method = "wget"))

gffl <- lapply(gffls0, function(f) {    
    gff <- import(f)
    mcols(gff)$file <- f
    gff
})

gff <- do.call(c, gffl)

diff <- compare(gffl[[1]], gffl[[2]]) == 0
different <- rep(diff, 2)

svg("output.svg")
autoplot(gff, aes(fill = different), facets = file ~ .) +
    theme(legend.position="none")
dev.off()

unlink(c("gffdiff.tmp", gffls0))

