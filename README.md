gff2svg: View my gff3 file
=============================

Given a url pointing to a valid `gff` file, prints the corresonding `svg` to `stdout`. 

- Requirements: [`genometools`](http://genometools.org/)
- Installation: `sudo apt-get install genometools`

Usage: `gff2svg https://raw.githubusercontent.com/OpenScienceRender/gff2svg/master/data/ex1.gff3`



gffdiff: compare 2 gff3 files
=============================

Requirements: `R` and

```{s}
source("http://www.bioconductor.org/biocLite.R")
biocLite(c("rtracklayer", "ggbio"))
```

Input: file with 2 gff3 filenames to be compared. These should be present at the same url as the original input.

Usage: `gffdiff https://raw.githubusercontent.com/OpenScienceRender/gff2svg/master/data/my.gffdiff`


