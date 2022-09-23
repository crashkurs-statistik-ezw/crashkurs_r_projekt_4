# 4.5 Setup -------------------------------------------------------------------
# 4.5.1 (Installiere und) lade das Paket skimr
library(skimr)


# 4.5.2 Daten einlesen
# Lese den Datensatz 'kurse_cleaned.csv' unter dem Variablennamen
# 'kurse_edx_stanford' ein
kurse_edx_stanford <- read_csv("data/cleaned/kurse_cleaned.csv")


# 4.6 Daten explorieren  ------------------------------------------------

# 4.6.1 Variablennamen einsehen
# Schaue dir mit 'colnames' und 'glimpse' die Variablennamen an
colnames(kurse_edx_stanford)
glimpse(kurse_edx_stanford)


# 4.6.2 Anzahl der Kurse pro Lernplattform berechnen
# Berechne mit count die Anzahl der Kurse pro Lernplattform
kurse_edx_stanford %>% 
  count(lernplattform)


# 4.6.3 Anzahl der Subjects
# Berechne mit count welche Lerninhalte am häufigsten in den Kursen
# gelehrt werden
kurse_edx_stanford %>% 
  count(course_subject, sort = TRUE)


# 4.6.4 skimr
# Führe folgenden Code aus und verschaffe dir einen Überblick über die Daten

# Überblick
skim(kurse_edx_stanford)

# Fehlende Werte finden
skim(kurse_edx_stanford) %>% focus(n_missing)

# Zentrale Variablen der Lernplattformen vergleichen
kurse_edx_stanford %>% 
  select(lernplattform, course_subject, age_mean, p_female, 
         p_hdi_low, educ_pre_college, weekly_effort) %>% 
  group_by(lernplattform) %>% 
  skim


# 4.6.5 Mittelwerte, Standardabweichungen und fehlende Werte ermitteln
# Führe folgenden Code aus um die Mittelwerte, den Median, 
# die Standardabweichungen und die fehlenden Werte für folgende Variablen 
# der beiden Kurse zu berechnen:
# * age_mean
# * p_female
# * p_hdi_low
# * educ_pre_college
# * weekly_effort
kurse_edx_stanford %>% 
  group_by(lernplattform) %>% 
  summarise(
    across(.cols = c(age_mean, p_female, p_hdi_low,
                     educ_pre_college, weekly_effort),
           .fns  = list(mean    = ~ mean(., na.rm = TRUE),
                        median  = ~ median(., na.rm = TRUE),
                        sd      = ~ sd(., na.rm = TRUE),
                        missing = ~ sum(is.na(.))))
  )

