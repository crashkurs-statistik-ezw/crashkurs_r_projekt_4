# 4.6 Setup -------------------------------------------------------------------

# 4.6.1 Daten einlesen
# Lese den Datensatz 'kurse_cleaned.csv' unter dem Variablennamen
# 'kurse_edx_stanford' ein
kurse_edx_stanford <- read_csv("data/export/kurse_cleaned.csv")


# 4.6 Datenvisualisierung -------------------------------------------------

# 4.6.1 Histogramme der kontinuierlichen Variablen
# (Intervall- oder Verhältnisskaliert)
# Füge folgenden Code aus, um dir die Histogramme aller kontinuierlichen
# Variablen anzuzeigen
kurse_edx_stanford %>% 
  select(c(id, age_mean, p_female, 
           p_hdi_low, educ_pre_college, weekly_effort)) %>% 
  pivot_longer(
    cols = !id,
    names_to = "variable",
    values_to = "value") %>% 
  ggplot(aes(x = value)) + 
  geom_histogram(fill = "gray80", color = "gray20") +
  scale_y_continuous(expand = expansion(0)) +
  facet_wrap(vars(variable), scales = "free_x")


# 4.6.2 Boxplot der Variable weekly_effort erstellen
# Erstelle einen Boxplot der Variable weekly_effort und
# vergleiche wie sich der wöchentliche Aufwand der beiden
# Lernplattformen unterscheidet
kurse_edx_stanford %>% 
  ggplot(aes(x = lernplattform, y = weekly_effort)) + 
  geom_boxplot(fill = "grey70") +
  scale_y_continuous(label = scales::label_number(suffix = "h")) +
  labs(
    x = "Lernplattform",
    y = "Wöchentlicher Aufwand in Stunden"
  )


# 4.6.3 Boxplot  p_female und Gender Photos
# Erstelle einen Boxplot der Variablen p_female und
# course_staff_gender_photos und vergleiche, ob es einen Zusammenhang
# zwischen dem Geschlecht der Lernenden und dem Geschlecht der Lehrpersonen gibt
kurse_edx_stanford %>% 
  # select(id, p_female, course_staff_gender_photos) %>% 
  ggplot(aes(x = course_staff_gender_photos, y = p_female)) + 
  geom_boxplot(fill = "grey70") +
  scale_y_continuous(label = scales::label_percent()) + # Optional
  labs(
    x = "Angenommenes Geschlecht der Lehrpersonen",
    y = "% Anteil der weiblichen Lernenden"
  )


# 4.6.4 Scatterplot HDI und wöchentlicher Aufwand
# Erstelle ein Scatterplot mit der Variable p_hdi_low auf der Y-Achse
# und der Variable 'weekly_effort' auf der Y-Achse
kurse_edx_stanford %>% 
  ggplot(aes(x = p_hdi_low, y = weekly_effort)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  scale_y_continuous(label = scales::label_number(suffix = "h")) +
  labs(
    x = "Human Development Index der Lernenden",
    y = "Wöchentlicher Aufwand in Stunden"
  )
