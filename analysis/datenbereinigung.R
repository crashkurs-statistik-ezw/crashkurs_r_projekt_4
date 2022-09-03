# 4.0 Setup -------------------------------------------------------------
# 4.0.1
# (Installiere und) lade die Pakete janitor und haven
library(janitor)
library(haven)


# 4.1 Daten einlesen -----------------------------------------------------

# 4.1.0
# * Lese die CSV-Dateien edXSample.csv und StanfordSample.csv in R ein
# * Speichere die beiden Dateien unter folgenden Variablen: edx und stanford
edx <- read_csv("data/edXSample.csv")
stanford <- read_csv("data/StanfordSample.csv")

# 4.2 Daten bereinigen ---------------------------------------------

# 4.2.1 Variable 'lernplattform' hinzufugen
# * Füge den beiden Data Frames mit mutate eine Spalte mit dem Namen 
#   lernplattform hinzu. Fülle für den Data Frame edx die Variable 
#   mit dem String "edx". Fülle für den Data Frame stanford die 
#   Variable mit dem String "stanford"
# * Speichere die Date Frames in den Variablen 'edx_cleaned' und
#   'stanford_cleaned'
edx_cleaned <- edx %>% 
  mutate(lernplattform = "edx")

stanford_cleaned <- stanford %>% 
  mutate(lernplattform = "stanford")


# 4.2.2 Data Frames zusammen fügen
# * Nutze die Funktion 'bind_rows' um die Data Frames 'edx_cleaned' und
#   'stanford_cleaned' zusammenzufügen
# * Nutze den Pipe-Operator und wende die Funktion 'clean_names' an,
#   um die Variablennamen zu reinigen
# * Speichere den Data Frame in der Variable 'kurse'
# * Füge mit 'rownames_to-column' die Reihennummer zum Datensatz hinzu. 
#   Nenne die neue Spalte "id"
kurse <- bind_rows(edx_cleaned, stanford_cleaned) %>% 
  clean_names(case = "snake") %>% 
  rownames_to_column(var = "id")


# 4.2.3 Spalten umkodieren
# * Kodiere die Spalte 'course_staff_gender' mit Hilfe von 'case_when'
#   folgendermaßen um.
#   -1 -> männlich / männlich dominiert
#   0  -> männlich und weiblich
#   1  -> weiblich
#   2  -> n/a (keine Fotos)
# * Kodiere die Spalte 'course_staff_gender_photos' mit Hilfe von 'case_when'
#   folgendermaßen um.
#   -1 -> männlich
#   0  -> männlich und weiblich
#   1  -> weiblich
# * Kodiere die Spalte 'stem' mit Hilfe von 'ifelse' folgendermaßen um.
#   1 -> STEM
#   0 -> kein STEM
# * Überschreibe die beiden Variablen course_staff_gender und stem
# * Speichere den Output im Datensatz kurse_cleaned
kurse_cleaned <- kurse %>% 
  mutate(
    course_staff_gender = case_when(
      course_staff_gender == -1 ~ "männlich / männlich dominiert",
      course_staff_gender ==  0 ~ "männlich und weiblich",
      course_staff_gender ==  1 ~ "weiblich",
      course_staff_gender ==  2 ~ "n/a (keine Fotos)",
      TRUE ~ as.character(course_staff_gender)
    ),
    course_staff_gender_photos = case_when(
      course_staff_gender_photos == -1 ~ "männlich",
      course_staff_gender_photos ==  0 ~ "männlich und weiblich",
      course_staff_gender_photos ==  1 ~ "weiblich",
      TRUE ~ as.character(course_staff_gender_photos)
    ),
    stem = ifelse(
      test = stem == 1,
      yes  = "stem",
      no   = "kein stem"
      )
  )


# 4.3 Datenexport ---------------------------------------------------------
# 4.3.1 Datensatz exportieren
# * Exportiere den Data Frame 'kurse_cleaned' als CSV-Datei im Ordner export
#   unter dem Dateinamen 'kurse_cleaned.csv'
# * Exportiere den Data Frame 'kurse_cleaned' als SAV-Datei im Ordner export
#   unter dem Dateinamen 'kurse_cleaned.sav'
write_csv(kurse_cleaned, "data/export/kurse_cleaned.csv")
write_sav(kurse_cleaned, "data/export/kurse_cleaned.sav")
