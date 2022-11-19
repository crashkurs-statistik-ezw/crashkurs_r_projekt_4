# 4.0 Setup -------------------------------------------------------------
# 4.0.1
# (Installiere und) lade die Pakete janitor und haven


# 4.1 Daten einlesen -----------------------------------------------------

# 4.1.0
# * Lese die CSV-Dateien edXSample.csv und StanfordSample.csv in R ein
# * Speichere die beiden Dateien unter folgenden Variablen: edx und stanford


# 4.2 Daten bereinigen ---------------------------------------------

# 4.2.1 Variable 'lernplattform' hinzufugen
# * Füge den beiden Data Frames mit mutate eine Spalte mit dem Namen 
#   lernplattform hinzu. Fülle für den Data Frame edx die Variable 
#   mit dem String "edx". Fülle für den Data Frame stanford die 
#   Variable mit dem String "stanford"
# * Speichere die Date Frames in den Variablen 'edx_cleaned' und
#   'stanford_cleaned'


# 4.2.2 Data Frames zusammen fügen
# * Nutze die Funktion 'bind_rows' um die Data Frames 'edx_cleaned' und
#   'stanford_cleaned' zusammenzufügen
# * Nutze den Pipe-Operator und wende die Funktion 'clean_names' an,
#   um die Variablennamen zu reinigen
# * Speichere den Data Frame in der Variable 'kurse'
# * Füge mit 'rownames_to-column' die Reihennummer zum Datensatz hinzu. 
#   Nenne die neue Spalte "id"


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


# 4.3 Datenexport ---------------------------------------------------------
# 4.3.1 Datensatz exportieren
# * Exportiere den Data Frame 'kurse_cleaned' als CSV-Datei im Ordner export
#   unter dem Dateinamen 'kurse_cleaned.csv'
# * Exportiere den Data Frame 'kurse_cleaned' als SAV-Datei im Ordner export
#   unter dem Dateinamen 'kurse_cleaned.sav'

