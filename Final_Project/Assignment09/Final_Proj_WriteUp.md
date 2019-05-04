# Effects of Herbicide Chemicals on Soil Microbial Communities

Amy Barfield

May 3, 2019

## Biological Question

How are microbial (single-celled) organisms affected by the different chemicals in herbicides?

## Introduction

In Fall 2018, the Schmidt Alpine Microbial Observatory Lab produced the data I used. The team was given a grant by an independent donor to look at the effects of glyphosate (the active ingredient in many herbicides) and the adjuvant chemicals commonly applied with glyphosate on important soil organisms and processes. Several toxicity-test experiments were done on three different natural soils to get a broad understanding of the effects of glyphosate across a range of ecosystems. For this project, I used a set of data that uses soil from an agricultural site called Chatfield Farm located in Denver, CO. The data set I am analyzing has counts of different organisms on petri dishes containing chemically treated soil. This data can give a sense of what can or cannot grow when exposed to these chemicals. DNA extractions will give a sense of what different species are present and how communities shift when exposed to different chemicals.

## Methods

### The source of the data:

Twenty-five 55mm diameter petri dishes were filled with 12g of soil from Chatfield Farm. The soil used was collected using sterile spatulas, kept at environmentally relevant temperatures until used in the experiments, and then homogenized to ensure that starting communities were similar among microcosms and also representative of the organisms found in the field. The microcosms were amended to 70% of water holding capacity (as described in Darcy et al. 2016 and Schmidt et al. 2012) and incubated under appropriate light and temperature conditions to replicate natural environmental conditions of Denver. Each soil microcosm was treated with one of five replicates of five different applications. The applications were glyphosate (the active ingredient in many herbicides), Agri-Dex (surfactant added to herbicides to help the active ingredient persist in the environment longer), glyphosate + Agri-Dex (in concentrations assumed to be similar to a manufactured formula), Pro-Max (a manufactured herbicide-chemical formula unknown), and a no-treatment control (DI water only). The arrangement of the plates in the incubator was randomized every three days to account for any variation in light and temperature within the incubator. 

Microcosms were surveyed twice weekly to monitor the growth of various microbial groups using a point-intercept method. In this method, a reticule is placed on the microscope’s objective and 100 measurements are taken for each plate at every sample time. A ‘hit’ was counted when the cross-hairs (a single point) of the reticule intersected any microorganism or structure and gives very accurate estimates of percent cover. The counts start two days prior to the treatments and continue for 24 days. The microorganisms counted were 
cyanobacteria, “green patches” (anything green that was not otherwise classified), fungi, diatoms, branching algae, moss, dead diatom mats, and dead cyanobacteria. Some of the species on the microcosms have been visually identified (such as the cyanobacteria species _Microcoleus_) but the identity of most species will need to be identified with DNA analysis.

 The original data file was a .tsv file. The only inconsistency was the total number of  counts per plate, which should all be 100, but some of the counts are greater than 100 (this happend when the cross hairs "hit" multiple organisms). Prior to loading the data in R, I found the % cover for each species by dividing the counts of each species by the total number of counts for each plate. I added these % cover columns to the sreadsheet bringing the size of the data to 176 lines of data and 22 columns. I then saved the file as a .csv to make importing it into R easier.

## Results (and some methods)

The first thing I did with the data was to graph the percent cover over time for each of the 8 species I had data for. For these graphs, I found the mean percent cover for each species at each time point by averaging all of the values for the treatment replicates. Then I used this new data table to create point and line graphs. Once each of these 8 graphs were created I could see a few things. One, some of the species did not have enough data asociated with them to produce meaningful graphs. This is just because these species did not grow as much or as well as some of the other organisms. After that, I decided to only focus on cyanobacteria, the "green" organisms, fungi, and diatoms. My second thought was that by only focusing on the averages for all the replicates, you could not get a good sense on the spread of the data. So, I recreated the graphs using the geom_spread() function. I also created a faceted plot of the 4 organisms I am interested in so I could use that as a visualization to help me with my next analyses. 

![cyanosmooth](https://github.com/amybarfield/CompBioLabsAndHomework/blob/master/Final_Project/Assignment09/cyano.png "Cyano Smooth Plot")
> Fig. 1: Percent of cyanobacteria cover over time. Treatments are Agri-Dex (agri), Control (ctrl), Glyphosate + Agri-Dex (glax), Glyphosate (Gly), and Pro-Max (prmx).

![diatomsmooth](https://github.com/amybarfield/CompBioLabsAndHomework/blob/master/Final_Project/Assignment09/diatoms.png "Diatom Smooth Plot")
> Fig. 2: Percent of diatom cover over time. Treatments are Agri-Dex (agri), Control (ctrl), Glyphosate + Agri-Dex (glax), Glyphosate (Gly), and Pro-Max (prmx).

![greensmooth](https://github.com/amybarfield/CompBioLabsAndHomework/blob/master/Final_Project/Assignment09/green.png "Green Plot")
> Fig 3. Percent of green growth over time. Treatments are Agri-Dex (agri), Control (ctrl), Glyphosate + Agri-Dex (glax), Glyphosate (Gly), and Pro-Max (prmx).

![fungismooth](https://github.com/amybarfield/CompBioLabsAndHomework/blob/master/Final_Project/Assignment09/fungi.png "Fungi Smooth Plot")
> Fig. 4: Percent of fungi cover over time. Treatments are Agri-Dex (agri), Control (ctrl), Glyphosate + Agri-Dex (glax), Glyphosate (Gly), and Pro-Max (prmx).

From the graphs I created above I could see some general trends. The cyanobacteria, green guys, and diatoms fared much worse when exposed to the Agridex (agri) and Agridex + Glyphosate (glax) treatments, however the fungi seemed to thrive in these treatments. This could mean that this particular species or multiple species or fungi were _not_ affected by the treatments and/or they were able to feast on the dead or dying microorganisms that _were_ affected by the treatments. 

![facetplot](https://github.com/amybarfield/CompBioLabsAndHomework/blob/master/Final_Project/Assignment09/cover_time.png "Facet Plot")
> Fig. 5: Facet plot showing the mean percent cover over time for the 4 most interesting (and data rich) organisms: Cyanobacteria, Diatoms, Fungi, and Green Patches. Treatments are Agri-Dex (agri), Control (ctrl), Glyphosate + Agri-Dex (glax), Glyphosate (Gly), and Pro-Max (prmx).

The next thing I did was to calculate the growth rates of each organism for each treatment. I was interested to see how fast each organism reached their maximum growth given the different teatments. Comparing the different growth rates helps further validate how the different traetments affected each organism. Let me telll you, wrangling this data into a table was rough work, but I eventually did it! I created a segment plot to show the different growth rates to maximum growth for each organism. I also graphed the growth rates in bar plots for a different way to look at this data. What these graphs showed reflected the trends mentioned above. Cyanobacteria and diatoms grew faster and had higher maximum values when exposed to the control (ctrl) , glyphosate (gly), and Pro-Max (prmx) treatments than the other treatments. The green guys did not grow much at all and did not start growing until much later than the other organisms. The fungi grew faster and had greater maximum values in the Agri-Dex and Gly + Agri treatments. 

![segplot](https://github.com/amybarfield/CompBioLabsAndHomework/blob/master/Final_Project/Assignment09/segplot.png "Segment Plot")
> Fig. 6: Plot of growth trajectories for the 4 main organisms. For cyanobacteria, diatoms, and green guys, it is clear that the rate of growth (slope of line) and maximum growth (length of line) are optimised with the control (ctrl), glyphosate (gly), and Pro-Max (prmx) treatments. Fungi has higher rates and maximum cover with the Agri-Dex (agri) and glyphosate + Agri-Dex (glax) treatments. For cyanobacteria (cyano), fungi, and green, the glax treatment was the lesser of two evils. The glax treatment allowed for higher maximum growth rates. The green patches didn't begin to really show until 8 days after treatment was added (10 in this graph because I added 2 to all the days to eliminate negative numbers), and had much slower and smaller growth compared to all of the other organisms. 

![growthratesbar](https://github.com/amybarfield/CompBioLabsAndHomework/blob/master/Final_Project/Assignment09/gr.png "Growth Rates")
> Fig. 7: Growth rates from start of growth, day 0 (in reality 2 days before treatment but 2 was added to all days to eliminate negaitive numbers) to the maximum percent cover for each species. Green patches didn't begin growing until day 10. Treatments are Agri-Dex (agri), Control (ctrl), Glyphosate + Agri-Dex (glax), Glyphosate (Gly), and Pro-Max (prmx).

The final plot I created looked at just the **maximum growth** (or maximum percent growth) for each organism in each treatment (as opposed to the **rate** of growth for each organism discussed above). The trends are the same as noted above in regards to which organisms favored which treatments, and the graph looks remarkably similar to the growth rates plots. However, this graph is different because it gives an idea about which organisms favored which treatment conditions. For example the fungi favored the glax over the agridex by itself, and the diatoms prefered the DI water only (no treatment control).

![maxgrowth](https://github.com/amybarfield/CompBioLabsAndHomework/blob/master/Final_Project/Assignment09/MaxGrowth.png "Max Growth")
> Fig. 8: Maximum percent growth for each of the organisms. This graph shows how much of the microcosms were dominated by each organisms when exposed to the different treatments. Remarkably, fungi managed to cover over 50% of the plates exposed to the glax treatment. The green patches did not grow much compared to the other organisms. Treatments are Agri-Dex (agri), Control (ctrl), Glyphosate + Agri-Dex (glax), Glyphosate (Gly), and Pro-Max (prmx).

## Conclusions

The results of this study show some interesting things about microbial communities in response to herbicide chemicals. For non fungus species. the Agridex treatments were extremely deadly. The growth of these species stopped or slowed to almost nothing after being treated and they were not able to grow as abundantly compared to the other treatments. These same species flourished when exposed to the other treatments, which is unsuprising as other studies (unpublished, produced by the Schmidt lab) have suggested that P, N, and C rich glyphasate can act almost like a fertilizer, though this particular study does not have any results that support this theory. Interestingly, fungi reacted oppositely to the treatments. They were able to grow rapidly and abundantly when exposed to glyphosate, perhaps at the demise of or because of the other organisms. Fungi did not do so well with the non-agridex treatments. This could be because competition with the other species was greater so they were not able to grow as much or as rapidly than when the other species were killed by the chemicals. Overall, this study suggests that Agri-Dex is extremely toxic to non-fungal microbial organisms and should be used with caution, if used at all. 


## References 

AMO Website: "Effects of Herbicides on Mycorrhizal Fungi and Soil Ecosystems" [https://alpinemicrobialobservatory.weebly.com/herbicides-and-microbes.html](https://alpinemicrobialobservatory.weebly.com/herbicides-and-microbes.html)

Darcy, J.L. and S.K. Schmidt. 2016. Nutrient limitation of microbial phototrophs on a debris covered glacier. Soil Biol. Biochemistry 95: 156-163. [https://www.sciencedirect.com/science/article/pii/S0038071716000043](https://www.sciencedirect.com/science/article/pii/S0038071716000043)

Schmidt, S.K., D.R. Nemergut, B.T. Todd, J.L. Darcy, C.C. Cleveland and A.J. King. 2012. A method for determining limiting nutrients for photosynthetic crusts. Plant Ecology Diversity 5: 513-519. [http://niwot.colorado.edu/publications/pub/a-simple-method-for-determining-limiting-nutrients-for-photosynthetic-crust](http://niwot.colorado.edu/publications/pub/a-simple-method-for-determining-limiting-nutrients-for-photosynthetic-crust) 
