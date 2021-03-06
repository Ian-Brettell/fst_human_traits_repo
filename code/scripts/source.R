#!/usr/bin/env Rscript

<<<<<<< HEAD
# Load libaries
=======
#############################
# Libaries
#############################
>>>>>>> e1d0d20ebc8c277bd98448a6ed43c802b1ff6638

library(here)
library(tidyverse)
library(pegas)
library(knitr)
library(plotly)
library(ggridges)
library(qqman)

<<<<<<< HEAD
# Functions
=======
#############################
# Paths
#############################

## Latest plot path
plot_path = here::here("plots", "20210203_batch")
dir.create(plot_path)


#############################
# Functions
#############################
>>>>>>> e1d0d20ebc8c277bd98448a6ed43c802b1ff6638

## Read `.afreq` files from `Plink`
read_afreq <- function(file){
  out = read.table(file, header = T, comment.char = "") %>%
    dplyr::rename(CHR = X.CHROM,
                  SNP = ID) %>% 
    dplyr::mutate(CHR = as.integer(CHR))

  return(out)
}

## Get manhattan plot
get_man <- function(df, trait, title, chr, bp, snp, p){
  # Plot
  manhattan(df, chr=chr, bp=bp, snp=snp, p=p,
            cex = 0.6,
            c(pal_primary[names(pal_primary) == trait],
              pal_secondary[names(pal_secondary) == trait]),
            main = title)
}

<<<<<<< HEAD
# Parameters

=======

#############################
# Parameters
#############################

## Clumping target parameter
>>>>>>> e1d0d20ebc8c277bd98448a6ed43c802b1ff6638
clump_param = "r2-0.1_kb-1000"

# Factor levels for `trait` (or `PHENO`)
trait_levels = c("hei", "bmi", "edu", "int", "ibd", "pig")
names(trait_levels) = trait_levels

trait_levels_verb =  c("Height",
                       "BMI",
                       "Educational attainment",
                       "Intelligence",
                       "IBD",
                       "Pigmentation")
names(trait_levels_verb) = trait_levels_verb

# Factor levels for `HIT_CONTROL`
hit_control_levels = c("hit", "control")

# Create vectors for recoding traits with full names and vice versa
recode_vec = c("hei" = "Height",
               "bmi" = "BMI",
               "edu" = "Educational attainment",
               "int" = "Intelligence",
               "ibd" = "IBD",
               "pig" = "Pigmentation")

rev_recode_vec = names(recode_vec)
names(rev_recode_vec) = recode_vec

# Colour palettes
pal_primary = c("Height" = "#FC4E07",
                "BMI" = "#FFBF00",
                "Educational attainment" = "#0BC166",
                "Intelligence" = "#00AFBB",
                "IBD" = "#D84797",
                "Pigmentation" = "#360568")
pal_secondary = c("Height" = "#B63502",
                  "BMI" = "#B88A00",
                  "Educational attainment" = "#07743D",
                  "Intelligence" = "#00727A",
                  "IBD" = "#972062",
                  "Pigmentation" = "#1F033A")
