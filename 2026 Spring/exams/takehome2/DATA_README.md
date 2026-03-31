# Data from: Effectiveness of tailored multichannel interventions on weight loss among adolescents: A Randomized controlled trial

Dataset DOI: [10.5061/dryad.sj3tx96k5](https://doi.org/10.5061/dryad.sj3tx96k5)

## Description of the data and file structure

Dataset Title: Weight Management Intervention Study – Baseline, 2-Month, and 5-Month Follow-Up Data

## 1. General Description

This dataset contains participant-level data from a weight management intervention study conducted among university students. Data were collected at three time points:

* Baseline (pre-intervention)
* 2 months post-intervention
* 5 months post-intervention

The dataset includes demographic characteristics, anthropometric measures, and questionnaire-based variables derived from health belief model constructs, self-efficacy scales, and behavioral assessments related to diet and physical activity.

All data are anonymized. Participants are identified only by unique study codes.

## 2. File Structure

The dataset  contains four files:

* information_sheet.csv
* baseline_assessment.csv
* 2_months_assessment.csv
* 5_months_assessment.csv

### a. `information sheet`

This sheet contains variable descriptions and coding schemes for categorical variables.

It provides:

* Variable names
* Variable Description
* Variable codes

### b. `baseline`

Contains baseline (pre-intervention) data for all participants.

Includes:

* Anthropometric measures
* Health belief model constructs

### **c.** **`2 months`**

Contains follow-up data collected 2 months after intervention.

Includes:

* Anthropometric measures (weight, height, and BMI)
* Health belief model constructs

### **d.** **`5 months`**

Contains follow-up data collected 5 months after intervention.

Includes:

* Anthropometric measures
* Health belief model constructs

## Health Belief Model Constructs

The key constructs of the HBM include 89 statements. 13 questions assessed perceived severity, 7 questions assessed perceived susceptibility, 14 questions addressed perceived barriers, 13 questions on perceived benefits, 12 questions on cues to action, 18 questions evaluated self-efficacy in dieting, 7 questions on self-efficacy in exercise, and 5 questions on the behavioral intention of weight management (dieting and exercising). All items are self-reported and scored on a 5-point Likert scale, with 1 representing "strongly disagree" and 5 indicating "strongly agree.” Higher scores denoted a more positive belief toward overweight preventive behaviors.

### A. Perceived Severity

* Emotional severity: `severityEM1–severityEM4`
* Physical severity: `severityPHY5–severityPHY9`
* Social severity: `severitySOC10–severitySOC13`

### B. Perceived Susceptibility

* Lifestyle susceptibility: `susceptLifestyle1–susceptLifestyle5`
* Environmental susceptibility: `susceptEnv6–susceptEnv7`

### C. Perceived Barriers

* Practical barriers: `barrierPractic1–barrierPractic4`
* Emotional barriers: `barrierEmot5–barrierEmot9`
* Awareness barriers: `barrierAware10–barrierAware14`

### D. Perceived Benefits

* Emotional benefits: `BenefitsEmot1–BenefitsEmot4`
* Physical benefits: `BenefitsPhys5–BenefitsPhys11`
* Social benefits: `BenefitsSocial12–BenefitsSocial13`

### E. Cues to Action

* Internal cues: `CuesInt1–CuesInt6`
* External cues: `CuesExt7–CuesExt12`

### F. Self-Efficacy Measures

#### Dietary Habit Self-Efficacy

* `EfficacydietHabit1–EfficacydietHabit13`

#### Emotional Eating Self-Efficacy

* `EfficacydietEmot14–EfficacydietEmot18`

#### Exercise Self-Efficacy

* `EfficacyExercise1–EfficacyExercise7`
  Higher scores indicate greater perceived self-efficacy.

### **G. Behavioral Outcomes**

### Dietary Behavior

* `BehavDiet1`
* `BehavDiet2`
* `BehavDiet3`

### Exercise Behavior

* `BehavExercises4`
* `BehavExercises5`



## Human subjects data

All data included in this dataset was collected in accordance with applicable ethical standards for research involving human participants. Prior to data collection, ethical approval was obtained from the appropriate institutional review board (IRB), and all participants provided informed consent to participate in the study. As part of the consent process, participants were explicitly informed that their data may be shared in a fully de-identified form for research and publication purposes, including deposition in a public data repository.
To ensure participant privacy and confidentiality, the dataset has been thoroughly de-identified prior to submission. All direct identifiers have been removed, including names, student identification numbers, contact information, and any other uniquely identifying personal details. Indirect identifiers that could potentially enable re-identification (such as highly specific demographic or contextual variables) have been carefully reviewed and either generalized, recoded, or excluded where necessary.
Participants are represented only by anonymized study codes that cannot be traced back to individual identities. No linkage file or key connecting participant identities to study codes is included in this dataset or retained in any publicly accessible location.
The dataset has been reviewed to ensure compliance with relevant data protection and privacy regulations and follows best practices for anonymization of human subjects' data. The authors confirm that the data, in its current form, poses minimal risk of re-identification and is suitable for sharing in the public domain.
