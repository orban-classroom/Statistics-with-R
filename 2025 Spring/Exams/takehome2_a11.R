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

# Data: emotion_study_jap_usa.csv

# From: https://datadryad.org/dataset/doi:10.6086/D1WT25#
# Abstract: Experiencing emotions is a complex process that varies across social contexts (e.g., culture) and over time. 
# The current research examined the levels and trajectories of self-reported emotions among US (n = 321) and Japanese (n = 388) 
# adolescents (age range: 11–14 at Time 1). Emotions were conceptualized as high arousal positive (HAP), low arousal 
# positive (LAP), high arousal negative (HAN), and low arousal negative (LAN). At each time point, US adolescents (vs. 
# Japanese) showed greater positive and lower negative emotions (both arousal levels). Positive and negative emotions were 
# negatively associated in the US, but the associations were not present or were positive in Japan. While US adolescents’ 
# HAP and LAN emotions remained stable, Japanese adolescents showed increases in HAP and LAN emotions over time. However, 
# both groups showed increases at similar rates for HAN and no change in LAP emotions. Collectively, findings suggest that 
# emotions are both pancultural and culture-specific and highlight the value of considering valence and arousal in 
# cross-cultural examinations of emotions.

# Variable Definitions: 
#   Country: 1 = US; 2 = Japan
#   Gender: 1 = Male; 2 = Female

# Emotion items:
#   Columns C through O: Emotions meausured at Time 1
#   Columns P through AB: Emotions measured at Time 2
#   Columns AC through AN: Emotions measured at Time 3

# Scoring of the emotion dimensions: Mean of items for each dimension at each time point can be taken.
#    High Arousal Positive: Happy, Excited
#    Low Arousal Positive: Calm, Relaxed, Peaceful
#    High Arousal Negative: Ashamed, Worried, Afraid, Guilty, Angry
#    Low Arousal Negative: Depressed, Sad, Tired

# Missing data marked with 999

# PROBLEM 1
# Research Question: Is there a significant difference between the time 1 happiness (aHappy) levels of 
# Japanese and American adolescents (COUNTRY)?

# Import the data from GitHub, exams folder "emotion_study_jap_usa.csv"


# Filter the data for the relevant variables and rows. Remove data marked as 999


# Check for t-test assumptions. Report your results below. 


# What kind of t-test will you implement?


# Implement a manual t-test calculation. Verify using the built-in function


# Reach a statistical and research conclusion.


# PROBLEM 2
# Research question: Is there a significant difference between Time 1 and Time 2 happiness levels for all adolescents?

# Use the previously imported dataframes


# Filter the data for the relevant variables and rows. Remove data marked as 999


# Check for t-test assumptions. Report your results below. 


# What kind of t-test will you implement?


# Implement a manual t-test calculation. Verify using the built-in function


# Reach a statistical and research conclusion.




