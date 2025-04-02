# TAKE-HOME EXAM 2
#
#
#################################################################################
#################################################################################
## PREAMBLE
## You can use your notes, textbook and web during the exam.
## COMMUNICATIONS EMBARGO: Communication either with a classmate, over the phone or over the web is absolutely forbidden. 
## Keep your work concise and clean: add your answer below the headings
## Eliminate redundant lines of code
## All of your interim calculations must be done manually except for Take-Home Exam 1 content
## Tip: Show that you have double checked your work
## All of your answers must be supported by calculations for full points. 
## Partial points can be achieved even with errors.
## Answer conceptual questions with a hashtag comment. For full marks consider lecture discussions.

#################################################################################
#################################################################################

# Data: Rawlings_et_al_chimp_LT_personality_data.csv

# From: https://datadryad.org/dataset/doi:10.5061/dryad.xksn02vc0
# Abstract: Personality factors analogous to the Big Five observed in humans are present in the great apes. However, 
# few studies have examined the long-term stability of great ape personality, particularly using factor-based personality 
# instruments. Here, we assessed overall group, and individual-level, stability of chimpanzee personality by collecting 
# ratings for chimpanzees (N = 50) and comparing them to ratings collected approximately 10 years previously, using the 
# same personality scale. The overall mean ratings of three of the six factors differed across the two time points. 
# Sex differences in personality were also observed, with overall sex differences found for three traits, and males and 
# females showing different trajectories for two further traits over the 10-year period. Regardless of sex, rank-order 
# stability analysis revealed strong stability for dominance; individuals who were dominant at the first time point were 
# also dominant 10 years later. The other personality factors exhibited moderate-to-weak rank-order stability indicating 
# that individuals were variable in their rank-position consistency over time. As many studies assessing chimpanzee 
# cognition rely on personality data collected several years prior to testing, these data highlight the importance of 
# collecting current personality data when correlating them with cognitive performance.

# Variable Definitions: 
# sex 1 = males, 2 = females

# Time definitions
#   T1 refers to the intial data collection (April 2006-December 2008, by Freeman et al. 2013). 
#   T2 refers to the ratings collected between (September 2015-December 2016).

# Freeman, H., Brosnan, S. F., Hopper, L. M., Lambeth, S. P., Schapiro, S. J., & Gosling, S. D. (2013). 
# Developing a comprehensive and comparative questionnaire for measuring personality in chimpanzees using a 
# simultaneous top-down/bottom-up design. American Journal of Primatology, 75(10), 1042–1053. https://doi.org/10.1002/ajp.22168

# PROBLEM 1
# Research Question: Are there significant difference in great apes' agreeableness (T1 agreeableness; T2 agreeableness) 
# between the sexes (Sex)? 

# Import the data from GitHub, data folder "Rawlings_et_al_chimp_LT_personality_data.csv"


# Filter the data for the relevant variables and rows. Remove any missing data. 


# Check for t-test assumptions. Report your results below. 


# What kind of t-test will you implement?


# Implement a manual t-test calculation. Verify using the built-in function


# Reach a statistical and research conclusion.


# Generate barplot indicating SEM as error bars.


# PROBLEM 2
# Research Question: Are there significant difference in great apes' reactivity over time (T1 reactivity; T2 reactivity)?


# Use the previously imported dataframes


# Filter the data for the relevant variables and rows. Remove data marked as 999


# Check for t-test assumptions. Report your results below. 


# What kind of t-test will you implement?


# Implement a manual t-test calculation. Verify using the built-in function


# Reach a statistical and research conclusion.


# Generate barplot indicating SEM as error bars.

