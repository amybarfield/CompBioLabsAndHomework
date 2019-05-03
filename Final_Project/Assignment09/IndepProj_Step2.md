# Effects of Herbicide Chemicals on Soil Communities

Amy Barfield
April 15, 2019

## Introduction

In Fall 2018, the Schmidt Alpine Microbial Observatory Lab produced the data I will be using. The team was given a grant by an independent donor to look at the effects of glyphosate (the active ingredient in many herbicides) and the adjuvant chemicals commonly applied with glyphosate on important soil organisms and processes. Several toxicity-test experiments were done on three different natural soils to get a broad understanding of the effects of glyphosate across a range of ecosystems. For this project, I will be using a set of data that uses soil from an agricultural site called Chatfield Farm located in Denver, CO. The question I will be asking with my data is: how are single-celled organisms in soil affected by the different herbicide chemicals?


## Microcosm Experiment Methods: 

The soil microcosms were treated with five replicates of five different applications. The applications were glyphosate (the active ingredient in many herbicides), Agridex (surfactant added to herbicides to help the active ingredient persist in the environment longer), glyphosate + AgriDex (in concentrations assumed to be similar to a manufactured formula), ProMax (a manufactured herbicide-chemical formula unknown), and a no-treatment control.

Soil was collected using sterile spatulas, kept at environmentally relevant temperatures until used in the experiments, and then homogenized to ensure that starting communities were similar among microcosms and also representative of the organisms found in the field. Each microcosm (55 mm diameter Petri dishes) was given 15-20 grams of soil and amended to 70% of water holding capacity as described in Darcy et al. 2016 and Schmidt et al. 2012. The microcosms were incubated under appropriate light and temperature conditions, to replicate natural environmental conditions of Denver, in a specially constructed incubator. The arrangement of the plates was randomized every three days to account for any variation in light and temperature within the incubator. Microcosms were surveyed twice weekly to monitor the growth of various microbial groups using a point-intercept method. In this method, a reticule is placed on the microscope’s objective and 100 measurements are taken for each plate at every sample time. A ‘hit’ was counted when the cross-hairs (a single point) of the reticule intersected any microorganism or structure and gives very accurate estimates of percent cover.


## The Data

The data I am using is the counts of cyanobacteria, “green patches” (anything green that was not otherwise classified), fungi, diatoms, branching algae, moss, dead diatom mats, and dead cyanobacteria, which gives percent cover on the plates, for the 3.5 weeks that the experiment ran (i.e. percent cover over time). Some of the species on the microcosms have been visually identified (such as the cyanobacteria species _Microcoleus_) but the identity of most species will need to be identified with DNA analysis. The data file is a .tsv file and looks pretty good. The only inconsistency is the number counts (column 15/O) which should all be 100 but some of the counts are greater than 100. This problem should not be too hard to overcome because I simply need to divide the counts from columns 7/G-14/N by the number in column 15/O to get % cover (instead of assuming all counts are out of 100, which would make an easy conversion to %). There are 176 lines of data and 16 columns.

The first analysis I would like to do with the data is to get percent cover over tie and graph it. I will graph percent cover/time for each species and each graph will have multiple lines to show the average for each treatment replicate. These graphs will likely help inspire next steps. I could also calculate growth rates for the differet species when exposed to the different species and final percent cover (i.e. maximum growth rate).  


## The Significance

While much research has been done on glyphosate, the active ingredient in herbicides, very little has been done on the toxicity, especially to microbial communities, of the unregulated additive chemicals commonly applied in conjunction with glyphosate which helps it persist in the environment and increase the toxicity of the herbicide.  Previous work that has come out of the Schmidt lab has shown that these adjuvant chemicals can be more toxic to amphibians than glyphosate itself (Vincent and Davidson 2015). Therefore, it will be interesting to determine the effect of these chemicals on soil microorganisms. 


## References 

AMO Website: "Effects of Herbicides on Mycorrhizal Fungi and Soil Ecosystems" [https://alpinemicrobialobservatory.weebly.com/herbicides-and-microbes.html](https://alpinemicrobialobservatory.weebly.com/herbicides-and-microbes.html)

Darcy, J.L. and S.K. Schmidt. 2016. Nutrient limitation of microbial phototrophs on a debris covered glacier. Soil Biol. Biochemistry 95: 156-163. [https://www.sciencedirect.com/science/article/pii/S0038071716000043](https://www.sciencedirect.com/science/article/pii/S0038071716000043)

Schmidt, S.K., D.R. Nemergut, B.T. Todd, J.L. Darcy, C.C. Cleveland and A.J. King. 2012. A method for determining limiting nutrients for photosynthetic crusts. Plant Ecology Diversity 5: 513-519. [http://niwot.colorado.edu/publications/pub/a-simple-method-for-determining-limiting-nutrients-for-photosynthetic-crust](http://niwot.colorado.edu/publications/pub/a-simple-method-for-determining-limiting-nutrients-for-photosynthetic-crust)

Vincent, K. and C. Davidson. 2015. The toxicity of glyphosate alone and glyphosate surfactant mixtures to Western Toad (Anaxyrus boreas) tadpoles. Environmental Toxicology and Chemistry 34:2791-2795. [https://www.ncbi.nlm.nih.gov/pubmed/26084619](https://www.ncbi.nlm.nih.gov/pubmed/26084619)
