# Cambridge Analytica Simulator
This project will attempt to show how by scrambling psychometrics, a subject can avoid being clustered in groups. This exercise aims to support the argument that Cambridge Analytica works with psychometrics to classify individuals and then clusters them in order to show content and messages aimed at steering towards certain voting decisions. If a user scrambles their profiles and, for example, follow pages, persons or accounts they would not normally follow, CA's and FB's algorithms may have a hard time classifying this user, and hence will start receiving messages aimed at different clusters.

Motivation for this study is described in [our blog post about the subject](https://blog.datank.ai).

# The Data
Since we don't have access to CA's huge dataset, nor to the data used in Kosinski's work, we are working with 2 personality surveys, the "Right-Wing Authoritarianism Scale" (Altemayer, 1981) and the "Big5 Factor Marker" (Goldber, 1992). It is important to notice that we did not collect the data for these surveys, but rather we downloaded it from the [openpsychometrics.org project](http://openpsychometrics.org/_rawdata/RWAS.zip). The actual survey can be found [here](https://openpsychometrics.org/tests/RWAS/).

A cleansed version of this dataset is available in this repository, in the file `data/RWAS/modified_data_copy.csv`. This cleaned dataset has shorter variable names, and some variables have been removed for the sake of information.

The aim is to emulate a similar scenario to the one CA had.

# The methodology
We will attempt to cluster variables on the actual surveys, and some demographics included in the data. We will assume 4 groups, pertaining to 4 major political groups in Mexico. Each group will represent an echo chamber between its members. We will then try to break some members of the group away from it by modifying the value of some variables. This particular exercise aims to emulate the act of scrambling a user's profile in FB, so that CA's classification algorithms have a hard time binning this observation.
